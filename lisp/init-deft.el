(require 'deft)

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
(setq deft-use-filter-string-for-filename t)

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

(require 'init-pinyin)

(defun deft-filter-regexp-as-regexp-pinyin ()
  (if deft-incremental-search
      (mapconcat 'regexp-quote (reverse deft-filter-regexp) "\\|")
    (pinyin-regexp (car deft-filter-regexp))))

(advice-add 'deft-filter-regexp-as-regexp :override #'deft-filter-regexp-as-regexp-pinyin)

(defun deft-search-forward-pinyin (file str)
  (if deft-incremental-search
      (if (search-forward str nil t)
          (puthash file (thing-at-point 'line) deft-hash-summaries))

    (re-search-forward (pinyin-regexp str) nil t)))

(advice-add 'deft-search-forward :override #'deft-search-forward-pinyin)

(provide 'init-deft)
