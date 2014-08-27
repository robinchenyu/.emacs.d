(defun set-gbk ()
  ;; gbk environment
  ;;(set-language-environment "UTF-8")
  (set-terminal-coding-system 'chinese-iso-8bit)
  (set-keyboard-coding-system 'chinese-iso-8bit)
  (prefer-coding-system 'chinese-iso-8bit)
  (setq default-process-coding-system '(chinese-iso-8bit . chinese-iso-8bit))
)

(defun set-utf8 ()
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (setq default-process-coding-system '(utf-8 . utf-8))
  (setq locale-coding-system 'utf-8)
)

;; Little hack to get proper Windows cyrillic language environment setup
;; out of the box
(defconst +lang+ (getenv "LANG"))

(if (and +lang+ (string-match "UTF-8" +lang+))
    (set-utf8)
  (set-gbk))

(provide 'init-locales)
