;;; Code:
(define-key prog-mode-map (kbd "C-c M-a") 'beginning-of-defun)
(define-key prog-mode-map (kbd "C-c M-e") 'end-of-defun)

(add-hook 'c-mode-hook
          '(lambda()
             (setq header-line-format which-func-format)))



;; c中隐藏ifdef
;;(require 'hide-ifdef-settings)

;; 为不同层次的ifdef着色
(require 'ifdef-settings)


(provide 'init-c)
