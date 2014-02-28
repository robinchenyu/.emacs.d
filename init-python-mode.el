(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'python-django)
(require-package 'ipython)
(require-package 'virtualenv)
(require 'python-django)
(global-set-key (kbd "C-x j") 'python-django-open-project)


(require 'init-ace-jump)
(require 'init-key-chord)
(require 'init-multiple-cursors)
(require 'init-jedi)

(provide 'init-python-mode)
