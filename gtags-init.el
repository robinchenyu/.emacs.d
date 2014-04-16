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

;;; for custom find symbol
(defvar g-buffer-stack nil)
(defvar g-point-stack nil)

(defun g-push-context ()
  (setq g-buffer-stack (cons (current-buffer) g-buffer-stack))
  (setq g-point-stack (cons (point) g-point-stack)))

;; pop context from stack
(defun g-pop-context ()
  (interactive)
  (if (not g-buffer-stack) nil
    (let (buffer point)
      (setq buffer (car g-buffer-stack))
      (setq g-buffer-stack (cdr g-buffer-stack))
      (setq point (car g-point-stack))
      (setq g-point-stack (cdr g-point-stack))
      (switch-to-buffer buffer)
      (goto-char point))))


(require 'thingatpt)

(defun find-word ()
  (interactive)
  (let ((symbol (thing-at-point 'symbol)))
    (message "project dir: %s" proj-dir)
    (message symbol)
    (g-push-context)
    ;; Setting process-setup-function makes exit-message-function work
    ;; even when async processes aren't supported.
    (compilation-start (concat "grep -nH -e " symbol " *")
                       'grep-mode)))

(defun find-word1 ()
  (interactive)
  (let ((symbol (thing-at-point 'symbol)))
    (message "project dir: %s" proj-dir)
    (message symbol)
    (g-push-context)
    ;; Setting process-setup-function makes exit-message-function work
    ;; even when async processes aren't supported.
    (rgrep symbol)))



(global-set-key [f4] 'find-word)
(global-set-key [(ctrl f4)] 'g-pop-context)
(global-set-key [(shift f4)] 'rgrep)


(provide 'gtags-init)
;;; gtags-init ends here
