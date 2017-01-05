;;; Package --- summary
;;; Commentary:
;;; 2016-11-17 first created, config for org keywords

;;; Code:
;;; configuration org keywords
;; (setq org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE")))
;; set local for gbk in windows

;; -------------------------------------------------------------------------
;; customer funcs
(defun cy-copy-word ()
  (interactive)
  (kill-new (thing-at-point 'word)))

(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

(global-set-key (kbd "s-w") 'cy-copy-word)
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "s-i") 'imenu)

(require 'init-avp)

(require 'cus-imagepaste)
(require 'cus-org-fontsize)

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)
(require 'init-deft)
;; (require 'init-evil)

(provide 'init-local)
;;; init-local ends here
