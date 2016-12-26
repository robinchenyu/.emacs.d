(require 'csv-mode)
(require-package 'csv-nav)

(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")

(setq csv-separators '("," ";" "|" " "))

(defun csv-field-width ()
  (goto-char (point-min))
  (let ((run 100)
        rt)
    (while (> run 0)
      (let* ((line (thing-at-point 'line t))
             (line-width (map 'list ;; get clolumn width
                              'length (split-string line "[,|]" t "[\n\t ]+")))
             (lrt (length rt))
             (lwd (length line-width)))
        (if (< lrt lwd)
            (setq rt (append rt (make-list (- lwd lrt) 0)))
          (if (> lrt lwd)
              (setq line-width (append line-width (make-list (- lrt lwd) 0)))))
        (setq rt (if rt
                     (map 'list  ;; get max
                          (lambda (x  y)
                            (max x y))
                          line-width
                          rt)
                   line-width)))
      (forward-line 1)
      (if (= (point) (buffer-end 1))
          (setq run 0)
        (beginning-of-line)))
    rt))

(defun csv-table-align ()
  (interactive)
  (let ((run 100)
        (w (csv-field-width)))
    (goto-char (point-min))
    (while (> run 0)
      (let* ((line (thing-at-point 'line t))
             (pbegin (line-beginning-position))
             (pend (line-end-position))
             (line2 (map 'list ;; get clolumn width
                         (lambda (x y)
                           (let ((lx (length x)))
                             (if (< lx y)
                                 (format "%s%s" x (make-string (- y lx) ? ))
                               x))) (split-string line "[,|]" t "[\n\t ]+") w)))
        (delete-region pbegin pend)
        (insert (mapconcat (lambda (x) x) line2 "|")))
      (forward-line 1)
      (if (= (point) (buffer-end 1))
          (setq run 0)
        (beginning-of-line)))))

(global-set-key (kbd "s-;") 'csv-table-align)

(provide 'init-csv)
