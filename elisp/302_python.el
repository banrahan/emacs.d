;;;;;;;;;;;;;;;;;;;;;;
;;;; python
;;;;;;;;;;;;;;;;;;;;;;

;; pymacs stuff
;; set magit executable
(if (eq system-type 'darwin)
    (setq pymacs-python-command "/usr/local/bin/python"))
(if (eq system-type 'gnu/linux)
    (setq pymacs-python-command "/usr/bin/python2"))

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; ipython
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; jedi auto completion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; associate django-html
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

;; django project
(global-set-key (kbd "C-c C-o") 'python-django-open-project)

(require 'nose)
(defun django-nosetests-one (&optional debug)
  "run django nosetests on testable thing at point in current buffer"
  (interactive)
  (message (concat "python " (rope-get-project-root) "manage.py test " (format "%s:%s" buffer-file-name (nose-py-testable)) " -s"))
  (compile (concat "python " (rope-get-project-root) "manage.py test " (format "%s:%s" buffer-file-name (nose-py-testable)) " -s")))

(defun django-nosetests-all (&optional debug)
  "run django nosetests on entire project"
  (interactive)
  (message (concat "python " (rope-get-project-root) "manage.py test -s"))
  (compile (concat "python " (rope-get-project-root) "manage.py test -s")))

(evil-define-key 'normal inferior-python-mode-map
  (kbd "C-d") 'evil-scroll-down)

(define-key python-mode-map (kbd "C-c C-d") 'django-nosetests-one)
(define-key django-mode-map (kbd "C-c C-d") 'django-nosetests-one)

(provide '302_python)
