(require 'evil)
(evil-mode 1)

;; set the toggle key
(evil-set-toggle-key "<f13>")

;; restore control-u as up half a page
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)


(provide 'init-evil)

