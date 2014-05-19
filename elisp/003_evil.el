;;; 003_evil.el --- All evil stuff
;;
;;; Commentary:
;;
;; Evil stuff is here, keybindings are handled later on
;; Eventually I need to set evil normal mode for everything..a way to do this
;;  is commented out below
;;
;;; Code:

(require 'evil)
(require 'evil-leader)

(evil-mode 1)
;; (setq evil-motion-state-modes (append evil-emacs-state-modes evil-motion-state-modes))
;; (setq evil-emacs-state-modes nil)
(setq evil-normal-state-modes (append '(mu4e-main-mode
                                      mu4e-headers-mode
                                      mu4e-view-mode
                                      magit-status-mode)
                                      evil-normal-state-modes))
(setq evil-emacs-state-modes (delete 'mu4e-main-mode
                                     evil-emacs-state-modes))
(setq evil-emacs-state-modes (delete 'mu4e-headers-mode
                                     evil-emacs-state-modes))
(setq evil-emacs-state-modes (delete 'mu4e-view-mode
                                     evil-emacs-state-modes))
(setq evil-emacs-state-modes (delete 'magit-status-mode
                                     evil-emacs-state-modes))

(setq evil-magic 'very-magic)

(global-evil-leader-mode t)
(evil-leader/set-leader "<SPC>")

(global-surround-mode 1)

;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;
(evil-leader/set-key "+" 'evil-numbers/inc-at-pt)
(evil-leader/set-key "=" 'evil-numbers/dec-at-pt)
(evil-set-toggle-key "s-=") ; set the toggle key
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up) ; restore control-u as up half a page
(define-key evil-normal-state-map (kbd "C-=") 'ispell-word)

(provide '003_evil)
;;; 003_evil.el ends here
