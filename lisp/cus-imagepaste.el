(require 'org)

(defvar ip-script-path "c:/msys64/home/chenyu/.emacs.d/bin/imagepaste.py")
(defvar default-image-file "d:/images/untitled.png")

(defun replace-home-prefix (path)
  (interactive)
  (message (replace-regexp-in-string
            (replace-regexp-in-string "\\\\" "/" (getenv "HOME"))
            "~/" path)))


;; (buffer-file-name (get-buffer "work.org"))
;; (file-name-sans-extension (buffer-file-name (get-buffer "work.org")))
;; (message default-directory)
;; (mkdir-get-buffer-pic-name )
(defun mkdir-get-buffer-pic-name ()
  (interactive)
  (let* ((bf-name (or (buffer-file-name (current-buffer))  default-image-file))
         (cur-dir default-directory)
         (file-dir (file-relative-name (file-name-sans-extension bf-name) cur-dir))
         (fn-base (file-name-base bf-name))
         (idx 0)
         (new-file-name "")
         (if-loop 1))
    (unless (file-exists-p file-dir)
      (mkdir file-dir)
      (setq idx (length (directory-files file-dir))))
    (while (> if-loop 0)
      (setq new-file-name (format "./%s/%s%d.png" file-dir fn-base idx))
      (if (file-exists-p new-file-name)
          (setq idx (1+ idx))
        (setq if-loop 0)))
    new-file-name))

(defun image-paste (raw-prefix &optional string-in)
  (interactive "*P")
  (let* ((file-name (mkdir-get-buffer-pic-name))
         (buf-str (format "[[%s]]" (replace-home-prefix file-name)))
         (ret (call-process "python3" nil "*ImagePaste*" nil ip-script-path (code-convert
                                                                             file-name
                                                                             'utf-8
                                                                             'gbk))))
    (if (= ret 0)
        (progn
          (message "success")
          (insert buf-str))
      (progn (message (format "imagepaste failed, check clipboard is image data. return: %d" ret)
                      (whole-line-or-region-yank raw-prefix string-in))))))

(define-key org-mode-map (kbd "C-y") 'image-paste)

(provide 'cus-imagepaste)
