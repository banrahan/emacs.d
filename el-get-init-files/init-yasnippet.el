(setq yas-snippet-dirs
      '("~/.emacs.d/el-get/yasnippet/snippets"
        "~/.emacs.d/snippets"
        ))

(yas-global-mode 1)

(setq yas/prompt-functions '(yas/x-prompt yas/dropdown-prompt))

;; ansi-term turn off yas
(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))
