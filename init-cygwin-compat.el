(defun cygwin-compat (file oa)
  (message "%S " (car oa))
  (if (string-match "WINWORD" (cadr oa))
      (setq file (cygwin-convert-file-name-to-windows file)))
  (mapcar (lambda (x) (if (eq x 'file) file x))
                                (nth 2 oa)))


(defun openwith-file-handler (operation &rest args)
  "Open file with external program, if an association is configured."
  (when (and openwith-mode (not (buffer-modified-p)) (zerop (buffer-size)))
    (let ((assocs openwith-associations)
          (file (car args))
          oa)
      ;; do not use `dolist' here, since some packages (like cl)
      ;; temporarily unbind it
      (while assocs
        (setq oa (car assocs)
              assocs (cdr assocs))
        (when (save-match-data (string-match (car oa) file))
          (let ((params (cygwin-compat file oa)))
            (when (or (not openwith-confirm-invocation)
                      (y-or-n-p (format "%s %s? " (cadr oa)
                                        (mapconcat #'identity params " "))))
              (if (eq system-type 'windows-nt)
                  (openwith-open-windows file)
                (openwith-open-unix (cadr oa) params))
              (kill-buffer nil)
              (when (featurep 'recentf)
                (recentf-add-file file))
              ;; inhibit further actions
              (error "Opened %s in external program"
                     (file-name-nondirectory file))))))))
  ;; when no association was found, relay the operation to other handlers
  (let ((inhibit-file-name-handlers
         (cons 'openwith-file-handler
               (and (eq inhibit-file-name-operation operation)
                    inhibit-file-name-handlers)))
        (inhibit-file-name-operation operation))
    (apply operation args)))

(provide 'init-cygwin-compat)
