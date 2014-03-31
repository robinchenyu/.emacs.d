;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(add-to-list 'load-path user-emacs-directory)
(require 'init-benchmarking) ;; Measure startup time

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(defconst *spell-check-support-enabled* nil)
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))

;; (set-language-environment "UTF-8")
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (list-coding-systems)

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-maxframe)
(require 'init-proxies)
(require 'init-dired)
(require 'init-isearch)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)
;; (require 'init-growl)

(require 'init-editing-utils)

(require 'init-darcs)
(require 'init-git)

(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-erlang)
(require 'init-javascript)
(require 'init-php)
(require 'init-org)
(require 'init-nxml)
(require 'init-css)
(require 'init-haml)
(require 'init-python-mode)
(require 'init-haskell)
;; (require 'init-ruby-mode)
;; (require 'init-rails)
(require 'init-sql)

(require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; (require 'init-clojure)
;; (require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))

(require 'init-marmalade)
(require 'init-misc)

;; Extra packages which don't require any configuration

(require-package 'gnuplot)
(require-package 'lua-mode)
(require-package 'htmlize)
(require-package 'dsvn)
(when *is-a-mac*
  (require-package 'osx-location))
(require-package 'regex-tool)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)



;;Example setup:

;; (add-to-list 'load-path "~/Emacs/emmet/")
;; (require 'emmet-mode)
(require-package 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)


;; (load "~/.emacs.d/site-lisp/nxhtml/autostart")
;; (setq auto-mode-alist
;;       (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
;; (setq mumamo-background-colors nil)
;; (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))
;; ;; Workaround the annoying warnings:
;; ;; Warning (mumamo-per-buffer-local-vars):
;; ;; Already 'permanent-local t: buffer-file-name
;; (when (and (equal emacs-major-version 24)
;;            (equal emacs-minor-version 3))
;;   (eval-after-load "mumamo"
;;     '(setq mumamo-per-buffer-local-vars
;;            (delq 'buffer-file-name mumamo-per-buffer-local-vars)))
;;   (eval-after-load "bytecomp"
;;     '(add-to-list 'byte-compile-not-obsolete-vars
;;                   'font-lock-beginning-of-syntax-function))
;;   (eval-after-load "tramp-compat"
;;     '(add-to-list 'byte-compile-not-obsolete-vars
;;                   'font-lock-beginning-of-syntax-function)))



(require-package 'openwith)
(openwith-mode t)


(if (eq system-type 'windows)
    (proc (require 'cygwin-mount)
          (cygwin-mount-activate)))



(message "init completed in %.2fms"
         (sanityinc/time-subtract-millis (current-time) before-init-time))

(require 'openvpn)
(require 'init-uma)
(require 'gtags-init)
;;(autoload 'gtags-mode "gtags" "" t)
(setq c-default-style "k&r"
          c-basic-offset 4
                  tab-width 4
                  indent-tabs-mode t)

;; hilight-symbol config
(require 'highlight-symbol)
(if (or (eq system-type 'windows) (eq system-type 'cygwin))
    (global-set-key [(ctrl f3)] 'highlight-symbol-at-point)
  (global-set-key [(super f3)] 'highlight-symbol-at-point))
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)


;;(require 'sublimity-scroll)

;; delete tailing whitespace when saving
;; nuke trailing whitespaces when writing to a file
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-O") 'other-window-backward)
(setq redisplay-dont-pause t)
(require 'init-pclint)
;; (require 'navi-mode)
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
