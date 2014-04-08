;;; init.el --- All of my settings
;;
;;; Commentary:
;;
;; Each thing is put in an rc-like load file, the sort order is the boot
;;   order.
;; helm-imenu is bound to <s-r> in this buffer and grabs anything
;;   with ;;;; at the start of the line
;;
;;; Code:

(add-to-list 'load-path "~/.emacs.d/elisp/")

;; fundamental configuration
(require '000_paths)
(require '001_packages)
(require '002_banrahan)
(require '003_evil)
(require '004_general)
(require '005_autocomplete)

;; configuration for look and feel
(require '100_look_and_feel)
(require '101_powerline)
(require '102_folding)

;; configuration for specific tools
(require '200_tools)
(require '201_eshell)
(require '202_erc)
(require '203_helm)
(require '204_email)
(require '205_orgmode)
(require '206_jabber)
(require '207_magit)

;; language configurations
(require '300_languages)
(require '301_latex)
(require '302_python)

;;;; sandbox
(setq font-lock-maximum-decoration t)
(defface font-lock-func-face 
    '((nil (:foreground "#b58900" :weight bold))
      (t (:bold t :italic t)))
  "Font Lock mode face used for function calls."
  :group 'font-lock-highlighting-faces)

(font-lock-add-keywords
 'emacs-lisp-mode
  '(
    ("\\<\\(interactive\\)" . 'font-lock-keyword-face)
    ("\\<\\(setq\\)" . 'font-lock-function-name-face)
    ("\\<\\(push\\)" . 'font-lock-function-name-face)
    ("\\<\\(put\\)" . 'font-lock-function-name-face)
    ("\\<\\(load-library\\)" . 'font-lock-function-name-face)
  )
)

;;;;;;;;;;;;;;;;;;;;;;
;;;; Emacs Auto Config
;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    (quote
     (safe-local-variable-values
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
        (pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/env/bin/python")))))))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
