(setq gtags-suggested-key-mapping t)
(setq gtags-disable-pushy-mouse-mapping t)

(require 'gtags)
;; (require 'ggtags)

(autoload 'gtags-mode "gtags" "" t)
(add-hook 'c-mode-hook
          '(lambda()
             (gtags-mode 1)))
(add-hook 'c++-mode-hook
          '(lambda()
             (gtags-mode 1)))
(add-hook 'gtags-select-mode-hook
  '(lambda ()
     (setq hl-line-face 'underline)
     (hl-line-mode 1)
))

(defconst +gtag-name+ "*updategtags*")
(defconst +gtag-proc+ "*updatetags*")

(defvar proj-dir nil)
(defvar proj-name nil)

(defun gtags-update ()
  (interactive)
  (message "dir: %s %s" proj-dir proj-name)
  (let ((dir proj-dir)
        (version proj-name))
  (with-current-buffer (get-buffer-create "*gtags-update*")
    (let ((default-directory dir)
          (proj-version version)
          (cmd "sh"))
      (if (compare-strings "uma" 0 3 proj-version 0 3)
          (progn
            (start-process +gtag-proc+ +gtag-name+
                           cmd "updateumatags.sh")
            (message "update %s tags run updateumatags.sh dir: %s cmd: %s" version default-directory cmd))
        (progn
          (start-process +gtag-proc+ +gtag-name+
                         cmd "updatetags.sh")
          (message " %s %s %s  %s tags" +gtag-proc+ +gtag-name+ cmd version)))
      (set-process-sentinel (get-process +gtag-proc+) 'close-window)))))
;;(compare-strings "uma" 0 3 "uma-07" 0 3)
(defun close-window (process event)
  "when update gtags, close buffer and window"
  (message "update over! process %s event %s" process event))



(add-hook 'gtags-mode-hook
  '(lambda ()
     (define-key gtags-mode-map "\C-cd" 'gtags-update)
     ))

(provide 'gtags-init)
;;; gtags-init ends here
