(require 'avp-data)
(require 'pp)


(defun avp-cmdcode (alist)
  "decode avp cmd by cmdflag and cmdcode"
  (let* ((cmdflag (cdr (assoc "cmdflag" alist)))
         (cmdcode (cdr (assoc "cmdcode" alist)))
         (x (cons cmdflag cmdcode)))
    (message "%S . %S " cmdflag cmdcode)
    (cond ((equal x '(128 . 272)) "CCR")
          ((equal x '(0 . 272)) "CCA")
          ((equal x '(128 . 258)) "RAR")
          ((equal x '(0 . 258)) "RAA")
          ((equal x '(128 . 274)) "ASR")
          ((equal x '(0 . 274)) "ASA")
          ((equal x '(128 . 280)) "DWR")
          ((equal x '(0 . 280)) "DWA")
          ((equal x '(128 . 282)) "DPR")
          ((equal x '(0 . 282)) "DPA")
          ((equal x '(128 . 257)) "CER")
          ((equal x '(0 . 257)) "CRA"))))

;; (avp-cmdcode 128 272)



;; (defun avp-decode-format (c data st)
;;   ""
;;   (cond ((char-equal c ?c)
;;          (string-to-number (substring data st (+ st 2)) 16))
;;         ((char-equal c ?n)
;;          (string-to-number (substring data st (+ st 6)) 16))
;;         ((char-equal c ?i)
;;          (string-to-number (substring data st (+ st 8)) 16)))  )
;; (avp-decode-format ?c (substring sample-data 0 2))
;; (avp-decode-format ?i "010002ac" 2)
;; (string-to-number "0002ac" 16)

;; (defun avp-decode-header (dd)
;;   "version msglen cmdcode appid hhi eei"
;;   (let* ((data (replace-regexp-in-string "[\n ]" "" dd))
;;          (ver (avp-decode-format ?c data 0))
;;          (len (avp-decode-format ?n data 2))
;;          (cmdflag (avp-decode-format ?c data 8))
;;          (cmdcode (avp-decode-format ?n data 10))
;;          (appid (avp-decode-format ?i data 16))
;;          (hhi (avp-decode-format ?i data 24))
;;          (eei (avp-decode-format ?i data 32)))
;;     (vector ver len (avp-cmdcode cmdflag cmdcode) appid hhi eei)))
;; (print sample-data)
;; (avp-decode-header sample-data)
;; (let ((rt []))
;;   (reduce (lambda (data tag)
;;             (cond ((string-equal tag "c")
;;                    (append)))) "cncniii" :inital-value sample-data))

(defun avp-decode-format2 (fmt data &optional off)
  "decode hex string to number
   c => char
   n => 3 bytes number
   i => int"
  (let ((dd (replace-regexp-in-string "[\n ]" "" data))
        rt)
    (if off
        (-avp-decode-format (string-to-list fmt) (substring dd off) rt)
      (-avp-decode-format (string-to-list fmt) dd rt))))



(defun -avp-decode-format (fmt data rt)
  " private func for decode one parameter from fmt "
  (let ((len (cdr (assoc (car fmt) '((?c . 2) (?n . 6) (?i . 8))))))
    (if (> (length fmt) 0)
        (-avp-decode-format (cdr fmt) (seq-drop data len)
                            (cons (string-to-number (seq-take data len) 16) rt))
      (reverse rt))))

;; (avp-decode-format2 "cncniii" sample-data)
;; (avp-decode-formats "cn" "
;; (assoc 99 '((?c . 2) (?n . 6) (?i . 8)))

(defun avp-print-header (names data)
  "Display header"
  (let (pair)  (map 'list (lambda (n v)
                            (setq pair (plist-put pair n v))) names data)
       (print (plist-get pair "cmdflag") (plist-get pair "cmdcode"))
       (setq pair (plist-put pair "req" (avp-cmdcode (lax-plist-get pair "cmdflag") (lax-plist-get pair "cmdcode"))))))
;; (avp-print-header (vector "version" "msglen" "cmdflag" "cmdcode" "appid" "hhi" "eei") (avp-decode-format2 "cncniii" sample-data))

;; (avp-decode-format2 "icn" sample-data 40)

(defun avp-decode-body (data &optional subavp)
  " Display body of TLV AVPs"
  (let ((dd (replace-regexp-in-string "[\n ]" "" data))
        rt)
    (if subavp
        (-avp-decode-body dd rt)
      (-avp-decode-body (substring dd 40) rt))))

(defun decode-hex-string (hex-string)
  (let ((res nil))
    (dotimes (i (/ (length hex-string) 2) (apply #'concat (reverse res)))
      (let ((hex-byte (substring hex-string (* 2 i) (* 2 (+ i 1)))))
        (push (format "%c" (string-to-number hex-byte 16)) res)))))

(defun avp-display-atom (code val)
  (let ((v (lax-plist-get avp-codelist code)))
    (cond ((member (nth 2 v) '("Integer32" "Unsigned32" "Integer64" "Unsigned64")) (cons (nth 1 v) (string-to-number val 16)))
          ((member (nth 2 v) '("OctetString")) (cons (nth 1 v) (decode-hex-string val)))
          ((equal (nth 2 v) "Group") (let ((subval (avp-decode-body val t)))
                                       (cons (nth 1 v) subval)))
          (t (cons (or (nth 1 v) code) val)))))

(defun -avp-decode-body (data rt)
  ;; (message "decode %S" data)
  (let* ((v (avp-decode-format2 "icn" data))
         (code (nth 0 v))
         (flag (nth 1 v))
         (len (* 2 (nth 2 v)))
         (off 0)
         val)
    (let ((m (mod len 8)))
      (if (> m 0)
          (setq len (+ len 8 (- 0 m)))))
    (if (> (logand flag #x80) 0)
        (setq off 8))
    (setq val (substring data (+ 16 off) len))
    (message "%S %S %S %S => %S" code flag len off val)

    (if (> (length data) (+ 16 len))
        (-avp-decode-body (substring data len) (cons (avp-display-atom code val) rt))
      (reverse (cons (avp-display-atom code val) rt)))))

(defun avp-decode (data &optional subavp)
  "Decode avp header and body"
  (let ((dd (replace-regexp-in-string "[\n ]" "" data))
        header
        rt)
    (setq header (-avp-decode-format (string-to-list "cncniii") dd rt))
    (map 'list (lambda (n v)
                 (push (cons n v) rt)) '("version" "msglen" "cmdflag" "cmdcode" "appid" "hhi" "eei") header)
    (push (cons "req" (avp-cmdcode rt)) rt)
    (if subavp
        (-avp-decode-body dd rt)
      (-avp-decode-body (substring dd 40) rt))))


;; (avp-decode-body sample-data)
;; (avp-decode sample-data)
;; (avp-decode-body  "000001bd 40 000018 000001bf 40000010 0000000000001f40" t)

(defun dmt-decode ()
  (interactive )
  (with-temp-buffer
    (yank)
    (let ((data (buffer-substring-no-properties (point-min) (point-max))))
      (pp-display-expression (avp-decode data) (get-buffer-create "*result*")))))


(global-set-key (kbd "s-q") 'dmt-decode)



(provide 'init-avp)
