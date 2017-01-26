(require 'pinyinlib)

(defun pinyin-regexp (pinyin)
  "Convert the first letter of Chinese PINYIN to regexp."
  (pinyinlib-build-regexp-string pinyin t nil nil))

(provide 'init-pinyin)
