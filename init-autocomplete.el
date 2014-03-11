;;; init-autocomplete.el --- Autocomplete setting
;;
;;; Commentary:
;;
;; <c-tab> is the autocomplete key
;; popup is set to be immediate
;;

;;; Code:
(require 'auto-complete)
(require 'auto-complete-config)

(global-auto-complete-mode t)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")

(setq ac-auto-show-menu 0)

;; bind c-tab to autocomplete
(global-set-key (kbd "C-<tab>") 'auto-complete)

;; next prev commands in popup
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

(set-default 'ac-sources '(ac-source-features
                           ac-source-functions
                           ac-source-yasnippet
                           ac-source-variables
                           ac-source-symbols
                           ac-source-filename
                           ac-source-files-in-current-dir
                           ac-source-abbrev
                           ac-source-dictionary
                           ac-source-words-in-same-mode-buffers))


(dolist (mode '(django-mode django-html-mode sql-mode
                html-mode LaTeX-mode))
  (add-to-list 'ac-modes mode))

(provide 'init-autocomplete)

;;; init-autocomplete.el ends here
