;;; 004_general.el --- general settings
;;
;;; Commentary:
;;
;; General settings that don't fit anywhere else
;;
;;; Code:

(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Have buffers revert if the file was changed
(global-auto-revert-mode t)

; stop creating those backup~ files
(setq make-backup-files nil) 
; stop creating those #autosave# files
(setq auto-save-default nil) 

;; turn on winner mode for window/tab-like management
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Dired
;(add-hook 'dired-load-hook (function (lambda () (load "dired-x"))))

;; setting fuzzy matching for interactive-do mode
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching for interactive do mode

;; enable autopair in all buffers
(autopair-global-mode) 

;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;

;; toggle solarized
(evil-leader/set-key "-" 'banrahan-toggle-solarized)

;; commenting
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)

;; better scrolling
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   16)) )
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 16)) )

(provide '004_general)
;;; 004_general.el ends here
