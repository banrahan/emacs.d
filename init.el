(setenv "PATH"
        
   (getenv "PATH")
)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/site-elisp")
(progn (cd "~/.emacs.d/site-elisp")
       (normal-top-level-add-subdirs-to-load-path))

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
;(require 'magit)

;; ESS for R support
(require 'ess-site)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(safe-local-variable-values
   (quote
    ((pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/bin/python")
     (pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/env/bin/python"))))
 '(tool-bar-mode nil))
;(put 'upcase-region 'disabled nil)
;(put 'dired-find-alternate-file 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#fdf6e3" :foreground "#657b83" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 180 :width normal :foundry "apple" :family "Monaco")))))

