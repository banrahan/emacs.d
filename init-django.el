;; setup the different modes
(require 'django-html-mode)
(require 'django-mode)

;; associate django-html
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

;; pony mode
(add-to-list 'load-path "~/.emacs.d/site-elisp/pony-mode/src")
(require 'pony-mode)

(require 'python-django)

(global-set-key (kbd "C-c C-o") 'python-django-open-project)

(provide 'init-django)
