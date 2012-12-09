;; ropemacs
(require 'pymacs)
(require 'python-mode)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(ac-ropemacs-initialize)
(add-hook 'python-mode-hook
          (lambda ()
        (add-to-list 'ac-sources '(ac-source-ropemacs ac-source-yasnippet))))

(provide 'init-python)