;; turn on winner mode for window/tab-like management
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; setting fuzzy matching for interactive-do mode
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching for interactive do mode

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;; turn on cua
(cua-mode t)

(add-hook 'dired-load-hook (function (lambda () (load "dired-x"))))

;;; Key Bindings

;; better scrolling
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   16)) )
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 16)) )

;; better window management commands
(global-set-key (kbd "M-<left>") 'windmove-left)          ; move to left windnow
(global-set-key (kbd "M-<right>") 'windmove-right)        ; move to right window
(global-set-key (kbd "M-<up>") 'windmove-up)              ; move to upper window
(global-set-key (kbd "M-<down>") 'windmove-down)          ; move to downer window

(provide 'init-general)
