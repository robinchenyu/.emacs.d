;;; Package --- summary
;;; Commentary:
;;; 2016-11-17 first created, config for org keywords

;;; Code:
;;; configuration org keywords
;; (setq org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE")))
;; set local for gbk in windows

;; (require-package 'deft)

;; (setq deft-extensions '("org", "md"))
;; (setq deft-use-filename-as-title t)
;; (setq deft-use-filter-string-for-filename t)
;; (setq deft-auto-save-interval 0)
;; (setq deft-use-filter-string-for-filename t)
;; (setq deft-recursive t)
;; (setq deft-markdown-mode-title-level t)

;; ;;function to run deft in specified directory
;; (defun bjm-deft (dir)
;;   "Run deft in directory DIR"
;;   (setq deft-directory dir)
;;   (switch-to-buffer "*Deft*")
;;   (kill-this-buffer)
;;   (deft))

;; (global-set-key (kbd "C-c d")
;;                 (lambda () (interactive)
;;                   (let ((deft-extension "md")
;;                         (deft-text-mode 'markdown-mode))
;;                     (bjm-deft "~/blogs2/"))))

;; (global-set-key (kbd "C-c D")
;;                 (lambda () (interactive)
;;                   (let ((deft-extension "org")
;;                         (deft-text-mode 'org-mode))
;;                     (bjm-deft "~/diary"))))


;; ;;advise deft-new-file-named to replace spaces in file names with -
;; (defun bjm-deft-strip-spaces (args)
;;   "Replace spaces with - in the string contained in the first element of the list args. Used to advise deft's file naming function."
;;   (list (replace-regexp-in-string " " "-" (car args)))
;;   )

;; (advice-add 'deft-new-file-named :filter-args #'bjm-deft-strip-spaces)
(global-set-key (kbd "C-c d")
                (lambda () (interactive)
                  (switch-to-buffer "*Deft*")
                  (kill-this-buffer)
                  (progn (setq deft-directory "~/blogs2")
                         (setq deft-use-filename-as-title t)
                         (setq deft-extensions '("md" "org"))
                         (setq deft-recursive t)
                         (setq deft-markdown-mode-title-level t)
                         (deft))))

(global-set-key (kbd "C-c D")
                (lambda () (interactive)
                  (switch-to-buffer "*Deft*")
                  (kill-this-buffer)
                  (progn (setq deft-directory "~/diary")
                         (setq deft-use-filename-as-title nil)
                         (setq deft-extension "org")
                         (setq deft-text-mode 'org-mode)
                         (setq deft-recursive nil)
                         (deft))))

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

;; (require 'init-evil)

(provide 'init-local)
;;; init-local ends here
