;;; package --- Sammary
;;; Commentary:

;;; Code:
(defun pclint-check ()
  (interactive)
  ;;  (compile "ls"))
  (compile (concat "lint.exe -i\"d:/software/PcLint\" -u std.lnt env-vc5.lnt " (buffer-name))))

(defun pclint-proj-check ()
  (interactive)
  ;;  (compile "ls"))
  (compile  "lint-nt.exe +ffn -i\"d:/software/PcLint\" -u std env-vc6 makefile.lnt"))


(defun pclint-proj-check1 ()
  (interactive)
  ;;  (compile "ls"))
  (compilation-start  "lint-nt.exe +ffn -i\"d:/software/PcLint\" -u std env-vc6 makefile.lnt"))

(defun cygwin-path (filename)
  (message "win-path: %s" filename)
  (if (and (stringp filename) (string-match "[a-zA-Z]\:" (substring filename 0 2)))
      (let ((drv (substring filename 0 1))
            (subpath (replace-regexp-in-string "\\\\" "/" (substring filename 2))))
        (message "sub: %s path: %s" drv subpath)
        (format "/cygwin/%s/%s" drv subpath))
    filename))

(defadvice compilation-find-file (before convert-cygpath activate)
  (message "compilation run %S" (ad-get-arg 1))
  (ad-set-arg 1 (cygwin-path (ad-get-arg 1))))

;; (stringp "123")
;; (stringp nil)
(provide 'init-pclint)
;;; init-pclint.el ends here



;;(cygwin-path "/cygdrive/e/uma/7/source/uep/comm/../comm/umafunc.h")
;; (replace-regexp-in-string "\\\\" "/" "E:\\uma\\7\\source\\uep\\buf_func\\buf_func.h")
;; (cygwin-path "E:\\uma\\7\\source\\uep\\buf_func\\buf_func.h")
