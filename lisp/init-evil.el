(require-package 'evil)
(evil-mode 1)

;; do not move cursor back after exit insert mode
(setq evil-move-cursor-back nil)

;; set cursor color by diff state
(setq evil-normal-state-cursor '("black" box))
(setq evil-motion-state-cursor '("green" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-emacs-state-cursor '("blue" box))

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fs" 'save-buffer
  "b" 'switch-to-buffer
  "k" 'bury-buffer)

(evil-leader/set-leader "<SPC>")

(evil-leader/set-key-for-mode 'elisp-mode "e" 'sanityinc/eval-last-sexp-or-region)

(provide 'init-evil)
