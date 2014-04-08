
;;;;;;;;;;;;;;;;;;;;;;
;;;; emmet
;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

;;;;;;;;;;;;;;;;;;;;;;
;;; snippets
;;;;;;;;;;;;;;;;;;;;;;
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/yasnippet/snippets"
        "~/.emacs.d/snippets"
        ))

(yas-global-mode 1)

(setq yas/prompt-functions '(yas/x-prompt yas/dropdown-prompt))

;; ansi-term turn off yas
(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))

;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;


(provide '200_tools)
