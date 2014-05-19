;;;;;;;;;;;;;;;;;;;;;;
;;;; Markdown
;;;;;;;;;;;;;;;;;;;;;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;;; clojure
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook (lambda () (paredit-mode 1)))

;;;; javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))


(provide '300_languages)
