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
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(safe-local-variable-values
   (quote
    ((pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/bin/python")
     (pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/env/bin/python"))))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t ( :height 180  :foundry "apple" :family "Monaco")))))

(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; load theme
(package-initialize)
(load-theme 'solarized-light t)

;;-----------------------------------------
;; Load configs for features and modes
;;-----------------------------------------
(require 'init-elpa)
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

;; magit for git support
(require 'magit)

;; ESS for R support
(require 'ess-site)

;;; init.el ends here


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
