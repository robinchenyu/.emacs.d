;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------
(add-auto-mode 'tcl-mode "Portfile\\'")
(fset 'yes-or-no-p 'y-or-n-p)

(dolist (hook (if (fboundp 'prog-mode)
                  '(prog-mode-hook ruby-mode-hook)
                '(find-file-hooks)))
  (add-hook hook 'goto-address-prog-mode))
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(setq goto-address-mail-face 'link)

(setq-default regex-tool-backend 'perl)

(add-auto-mode 'conf-mode "Procfile")

;; ------------------------------- add pinyin search for find-file ---------
(require 'init-pinyin)

(defun counsel--find-file-matcher-pinyin (orig-fun &optional regexp candidates)
  "Return REGEXP-matching CANDIDATES.
Skip some dotfiles unless `ivy-text' requires them."
  (let ((pinyin-reg (pinyin-regexp regexp)))
    (apply orig-fun (list pinyin-reg candidates) )))

(advice-add 'counsel--find-file-matcher :around #'counsel--find-file-matcher-pinyin)
;; --------------------------------------------------------------------------
(provide 'init-misc)
