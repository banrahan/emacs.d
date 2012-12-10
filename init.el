(setenv "PATH"
   (getenv "PATH")
)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/site-elisp")

;;-----------------------------------------
;; Load configs for features and modes
;;-----------------------------------------
(require 'init-compatability)
(require 'init-elpa)
(require 'init-general)
(require 'init-autocomplete)
(require 'init-python)
(require 'init-django)
(require 'init-org)
(require 'init-snippets)
(require 'init-indentation)

;; magit for git support
(require 'magit)

;; ESS for R support
(require 'ess-site)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
