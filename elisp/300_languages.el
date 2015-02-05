;;;; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;;;; tags configuration

;;;; clojure
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook (lambda () (paredit-mode 1)))
(setq cider-repl-tab-command 'indent-for-tab-command)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide '300_languages)
