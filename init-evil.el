(require 'evil)
(evil-mode 1)

;; set the toggle key
(evil-set-toggle-key "s-=")

;; restore control-u as up half a page
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; turn on surround
(require 'surround)
(global-surround-mode 1)

;; turn on evil numbers
(require 'evil-numbers)
(global-set-key (kbd "C-c =") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; folding
(outline-minor-mode 1)
(define-key evil-normal-state-map "zo" 'outline-toggle-children)
(define-key evil-normal-state-map "zO" 'show-subtree)
(define-key evil-normal-state-map "zM" 'hide-body)
(define-key evil-normal-state-map "zR" 'show-all)
(define-key evil-normal-state-map "zj" 'outline-next-visible-heading)
(define-key evil-normal-state-map "zk" 'outline-previous-visible-heading)
(define-key evil-normal-state-map "zc" 'hide-subtree)
  
(provide 'init-evil)
