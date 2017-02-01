;; See also init-clojure-cider.el

(when (maybe-require-package 'clojure-mode)
  (require-package 'cljsbuild-mode)
  (require-package 'elein)

  (after-load 'clojure-mode
    (add-hook 'clojure-mode-hook 'sanityinc/lisp-setup)
    (add-hook 'clojure-mode-hook 'subword-mode)))
(setq cider-known-endpoints '(("X240" "localhost" "30000")))


(provide 'init-clojure)
