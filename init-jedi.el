(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:ac-setup)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t )
(setq jedi:server-args
      '("--virtual-env" "/home/robin/Env/mezproj"))
(provide 'init-jedi)
