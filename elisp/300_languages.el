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

;;;; elisp
(setq font-lock-maximum-decoration t)
(defface font-lock-func-face 
    '((nil (:foreground "#b58900" :weight bold))
      (t (:bold t :italic t)))
  "Font Lock mode face used for function calls."
  :group 'font-lock-highlighting-faces)

(font-lock-add-keywords
 'emacs-lisp-mode
  '(
    ("\\<\\(interactive\\)" . 'font-lock-keyword-face)
    ("\\<\\(setq\\)" . 'font-lock-function-name-face)
    ("\\<\\(push\\)" . 'font-lock-function-name-face)
    ("\\<\\(put\\)" . 'font-lock-function-name-face)
    ("\\<\\(load-library\\)" . 'font-lock-function-name-face)
  )
)

(provide '300_languages)
