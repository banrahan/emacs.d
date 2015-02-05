(evil-mode 1)

(setq evil-magic 'very-magic)

(evil-set-toggle-key "s-=") ; set the toggle key
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up) ; restore control-u as up half a page
(define-key evil-normal-state-map (kbd "C-=") 'ispell-word)
(define-key evil-normal-state-map (kbd "M-'") 'helm-etags-select)
(define-key evil-insert-state-map (kbd "M-'") 'helm-etags-select)
