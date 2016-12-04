(defvar emacs-english-font "Lucida Console"
  "The font name of English.")

(setq emacs-english-font "Lucida Console")

(defvar emacs-cjk-font "Microsoft YaHei"
  "The font name for CJK.")

(setq emacs-cjk-font "Microsoft YaHei")


(defvar emacs-font-size-pair '(15 . 18)
  "Default font size pair for (english . chinese)")

(defvar emacs-font-size-pair-list
  '(( 5 .  6) (10 . 12)
    (13 . 16) (15 . 18) (17 . 26)
    (19 . 22) (20 . 24) (21 . 26)
    (24 . 28) (26 . 32) (28 . 34)
    (30 . 36) (34 . 40) (36 . 44))
  "This list is used to store matching (englis . chinese) font-size.")

(setq emacs-font-size-pair-list '(( 5 .  6) (10 . 12)
                                  (13 . 16) (15 . 18) (17 . 26)
                                  (19 . 22) (20 . 24) (21 . 26)
                                  (24 . 28) (26 . 32) (28 . 34)
                                  (30 . 36) (34 . 40) (36 . 44)))


(defun font-exist-p (fontname)
  "Test if this font is exist or not."
  (if (or (not fontname) (string= fontname ""))
      nil
    (if (not (x-list-fonts fontname)) nil t)))

(defun set-font (english chinese size-pair)
  "Setup emacs English and Chinese font on x window-system."

  (if (font-exist-p english)
      (set-frame-font (format "%s:pixelsize=%d" english (car size-pair)) t)
    (message "English font do not exist"))

  (if (font-exist-p chinese)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
        (set-fontset-font (frame-parameter nil 'font) charset
                          (font-spec :family chinese :size (cdr size-pair))))
    (message "Chinese font do not exist")))

;; Setup font size based on emacs-font-size-pair
(set-font emacs-english-font emacs-cjk-font emacs-font-size-pair)
;; 你好
(defun emacs-step-font-size (step)
  "Increase/Decrease emacs's font size."
  (let ((scale-steps emacs-font-size-pair-list))
    (if (< step 0) (setq scale-steps (reverse scale-steps)))
    (setq emacs-font-size-pair
          (or (cadr (member emacs-font-size-pair scale-steps))
              emacs-font-size-pair))
    (when emacs-font-size-pair
      (message "emacs font size set to %.1f" (car emacs-font-size-pair))
      (set-font emacs-english-font emacs-cjk-font emacs-font-size-pair)      )))

(defun increase-emacs-font-size ()
  "Decrease emacs's font-size acording emacs-font-size-pair-list."
  (interactive) (emacs-step-font-size 1))

(defun decrease-emacs-font-size ()
  "Increase emacs's font-size acording emacs-font-size-pair-list."
  (interactive) (emacs-step-font-size -1))

;; color src code block
(setq org-src-fontify-natively t)

(global-set-key (kbd "C-=") 'increase-emacs-font-size)
(global-set-key (kbd "C--") 'decrease-emacs-font-size)

(provide 'cus-org-fontsize)
