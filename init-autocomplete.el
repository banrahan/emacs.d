(require 'auto-complete)
(require 'auto-complete-config)

(global-auto-complete-mode t)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")

;; bind c-tab to autocomplete
(global-set-key (kbd "C-<tab>") 'auto-complete)

;; next prev commands in popup
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(dolist (mode '(django-mode django-html-mode sql-mode))
  (add-to-list 'ac-modes mode))

(provide 'init-autocomplete)
