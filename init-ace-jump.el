(require-package 'ace-jump-mode)
(require-package 'ace-jump-buffer)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;;you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


;;enable a more powerful jump back function from ace jump mode

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)


(define-key global-map (kbd "C-c o") 'ace-jump-buffer)

(provide 'init-ace-jump)
