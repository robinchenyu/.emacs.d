
(defconst +bufname+ "*uma-compile*")

(defun call-me (process event)
  (princ
   (format "Process: %s had the event `%s'" process event))
  (switch-to-buffer +bufname+)
  (raise-frame))

(defun uma-compile (num)
  "Compiling uma code"
  (interactive "n 0 - all;1 - init;2 - suse;3 - redhat;4 - aix:5 - recover")
  (let ((buf (get-buffer-create (concat +bufname+)))
        (args (cond ((eq num 0) "all")
                    ((eq num 1) "init")
                    ((eq num 2) "uma_suse")
                    ((eq num 3) "uma_redhat")
                    ((eq num 5) "uma_recover")
                    ((eq num 4) "uma_aix"))))
    (set-buffer buf)
    (start-process "compiling" buf "/cygdrive/d/software/apache-ant-1.8.2/bin/ant" "-f" "d:/home/ci/build.xml" args)

    ;;    (start-process "compiling" buf "sleep" "10")
    (set-process-sentinel (get-process "compiling") 'call-me)))

;; (defconst +vpn-home+ "d:/software/OpenVPNPortable")
;; (defconst +vpn-proxy+ "proxynj.zte.com.cn")

;; ;;(setq default-directory "d:/software/OpenVPNPortable/data/config/")
;; (defun vpn-connect (proxy-ip)
;;   "connect to vpn"
;;   (with-current-buffer (get-buffer-create "*vpn-status*")
;;     (let ((default-directory (concat +vpn-home+ "/data/config/"))
;;           (pname (get-vpn-process-name "vpn")))
;;       (if (and pname (process-status pname))
;;           (kill-process pname)
;;         (setq pname "vpn-conn"))
;;       (start-process pname "*vpn-status*" "openvpn" "--config"
;;                      "./client2.ovpn" "--http-proxy" proxy-ip "80" "auto"))))
  
  ;; (let ((buf (get-buffer-create (concat "*vpn-status*")))
  ;;       (pname (get-vpn-process-name "vpn")))
  ;;   (set-buffer buf)
  ;;   (setq default-directory "d:/software/OpenVPNPortable/data/config/")
  ;;   (if (and pname (process-status pname))
  ;;       (kill-process pname)
  ;;       (setq pname "vpn-conn"))
  ;;   ;; (start-process "vpn-conn" buf (concat default-directory "start.sh"))))
  ;;   (start-process pname buf "openvpn" "--config"
  ;;                  "./client2.ovpn" "--http-proxy" proxy-ip "80" "auto")))

;; (vpn-connect "proxynj.zte.com.cn")
;; (list-system-processes )
;; (process-list)
;; (process-status "vpn-conn<1>")
;; (kill-process "vpn-conn<1>")
;; (stop-process (get-process "vpn-conn"))
;; (continue-process (get-process "vpn-conn"))
;; (vpn-monitor)
;; (get-buffer "*vpn-status*")
;; (buffer-substring -10 -1)

;; (defun vpn-monitor ()
;;   (interactive)
;;   (vpn-monitor-iner 300))

;; (defun vpn-monitor-iner (sec)
;;   (format "vpn-monitor check %s" (vpn-status))
;;   (wl-org-agenda-to-appt)
;;   (if (not (vpn-status))
;;       (progn (vpn-connect +vpn-proxy+)
;;              (print "vpn-connect")))
;;   (if (> sec 0)
;;       (run-at-time t sec 'vpn-monitor-iner -1)))

;; (defun vpn-status ()
;;   (let ((buf (get-buffer-create (concat "*vpn-status*"))))
;;     (set-buffer buf)
;;     (if (< (last-line "*vpn-status*" "Initialization")
;;            50)
;;         t
;;         nil)))
;; ;; (vpn-status)
;; ;; (format "Hello %s" nil)

;; ;;(uma-compile)
;; (defun last-line (buf-name string)
;;   (set-buffer (get-buffer buf-name))
;;   (goto-char (point-max))
;;   (let ((pt (search-backward string nil t)))
;;     (if (integerp pt)
;;         (- (point-max) pt)
;;         100))
;;   )
;; ;;(get-vpn-process-name "vpn")
;; (defun get-vpn-process-name (name)
;;   (setq vpn-proc nil)
;;   (dolist (proc (process-list) vpn-proc)
;;     ;;(print (process-name proc))
;;     (if (string-match name (process-name proc))
;;         (setq vpn-proc (process-name proc)))))
;; (string-match "hell" "ksafdjhellldsf")
;; (search-forward "def")
;; (last-line "*vpn-status*" "Initialization")


(provide 'init-uma)

;;(uma-compile)
