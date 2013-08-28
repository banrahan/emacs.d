;; yas-snippet
(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/yasnippet/snippets"
        "~/.emacs.d/snippets"
        ))

(yas-global-mode 1)

(setq yas/prompt-functions '(yas/x-prompt yas/dropdown-prompt))

(provide 'init-snippets)
