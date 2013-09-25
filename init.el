(setenv "PATH"
   (getenv "PATH")
)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/site-elisp")
(progn (cd "~/.emacs.d/site-elisp")
       (normal-top-level-add-subdirs-to-load-path))

;;-----------------------------------------
;; All of the emacs auto stuff
;;-----------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(org-deadline-warning-days 0)
 '(safe-local-variable-values
   (quote
    ((pony-settings make-pony-project :python "/Users/bhanraha/working/env/crowd_server/bin/ipython" :settings "settings")
     (python-mode
      (python-shell-interpreter . "python")
      (python-shell-interpreter-args . "/Users/bhanraha/working/crowd_plugins/crowd_server/manage.py shell")
      (python-shell-prompt-regexp . "In \\[[0-9]+\\]: ")
      (python-shell-prompt-output-regexp . "Out\\[[0-9]+\\]: ")
      (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
      (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
")
      (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
")
      (python-shell-virtualenv-path . "/Users/bhanraha/working/env/crowd_server"))
     (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
")
     (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
")
     (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
     (python-shell-interpreter-args . "/Users/bhanraha/working/crowd_plugins/crowd_server/manage.py shell")
     (python-shell-interpreter . "python")
     (pony-settings make-pony-project :python "/Users/bhanraha/working/env/crowd_server/bin/python" :settings "settings" :pony-sqlite-program "/usr/bin/sqlite3")
     (pony-settings make-pony-project :python "/Users/bhanraha/working/env/crowd_server/bin/python" :settings "settings")
     (pony-settings make-pony-project :python "/Users/bhanraha/working/env/crowd_server/bin/python")
     (pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/bin/python")
     (pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/env/bin/python"))))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 180 :foundry "apple" :family "Monaco")))))

(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; load theme
(package-initialize)
(load-theme 'solarized-light t)

;;-----------------------------------------
;; Load configs for features and modes
;;-----------------------------------------
(require 'init-elpa)
(require 'init-chord)
(require 'init-evil)
(require 'init-general)
(require 'init-autocomplete)
(require 'init-python)
(require 'init-django)
(require 'init-latex)
(require 'init-org)
(require 'init-snippets)
(require 'init-autopair)
(require 'init-indentation)
(require 'init-helm)
(require 'init-multiple-cursors)
(require 'init-emmet)
(require 'init-acejump)
(require 'init-expand-region)
(require 'init-magit)

;; ESS for R support
(require 'ess-site)

;;; init.el ends here



