(when (eval-when-compile (>= emacs-major-version 24))
  (require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode))

;; Override default flycheck triggers
(setq flycheck-check-syntax-automatically '(save idle-change mode-enabled)
      flycheck-idle-change-delay 0.8)

(add-hook 'flycheck-mode-hook
  '(lambda ()
     (define-key flycheck-mode-map (kbd "M-N") 'flycheck-next-error)
     (define-key flycheck-mode-map (kbd "M-P") 'flycheck-previous-error)
     ))


 ;; (require 'helm-flycheck) ;; Not necessary if using ELPA package
 ;; (eval-after-load 'flycheck
 ;;   '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(provide 'init-flycheck)
