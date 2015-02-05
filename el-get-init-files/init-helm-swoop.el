(require 'helm-swoop)
(global-set-key (kbd "s-f") 'helm-swoop)
(global-set-key (kbd "s-F") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "s-f") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "s-f") 'helm-multi-swoop-all-from-helm-swoop)
;; When doing evil-search, hand the word over to helm-swoop
(define-key evil-motion-state-map (kbd "s-f") 'helm-swoop-from-evil-search)
