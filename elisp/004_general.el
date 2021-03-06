;;; 004_general.el --- general settings
;;
;;; Commentary:
;;
;; General settings that don't fit anywhere else
;;
;;; Code:

(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(setq-default indent-tabs-mode nil)

;; Have buffers revert if the file was changed
(global-auto-revert-mode t)

; stop creating those backup~ files
(setq make-backup-files nil) 
; stop creating those #autosave# files
(setq auto-save-default nil) 

;; turn on winner mode for window/tab-like management
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; setting fuzzy matching for interactive-do mode
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching for interactive do mode

;; enable autopair in all buffers
(autopair-global-mode) 

;; dired, suggest adjacent dired directory for some commands
(setq dired-dwim-target t)

;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;

;; commenting
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)

;; better scrolling
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   16)) )
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 16)) )

(define-key dired-mode-map (kbd "M-o") 'dired-omit-mode)

(provide '004_general)
;;; 004_general.el ends here
