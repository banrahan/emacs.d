;;; 100_look_and_feel.el --- sets all of the general stuff for look and feel
;;
;;; Commentary:
;;
;; Just a bunch of stuff in here
;;
;;; Code:

;;; Font
(set-face-attribute 'default nil
                    :height 200
                    :foundry "apple"
                    :family "Monaco")

(set-face-attribute 'elscreen-tab-background-face nil
                    :background "#073642"
                    :foreground "#93A1A1"
                    )

;;;; Various
;; Turn off that blasted blinking cursor
(blink-cursor-mode 0)

;; no more bells
(setq ring-bell-function 'ignore)

(show-paren-mode t)

(display-time-mode t)

;; disable scroll bar
(scroll-bar-mode 0)

;; disable toolbar
(tool-bar-mode 0)

;;;; Diminish
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode " Y"))
(eval-after-load "Undo-Tree" '(diminish 'undo-tree-mode))
(eval-after-load "abbrev" '(diminish 'abbrev-mode "Ab"))
(eval-after-load "autopair" '(diminish 'autopair-mode))
(eval-after-load "magit" '(diminish 'magit-auto-revert-mode))

;;;; Solarized theme
;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use more italics
(setq solarized-use-more-italic t)

(setq solarized-high-contrast-mode-line t)
(set-face-attribute 'powerline-active1 nil
                    :background "#93A1A1"
                    :foreground "#073642"
		    )
(set-face-attribute 'powerline-active2 nil
                    :background "#93A1A1"
                    :foreground "#073642"
		    )

(load-theme 'solarized-dark t)

;;;; Tabs
(require 'elscreen)
(elscreen-start)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

(set-face-attribute 'elscreen-tab-background-face nil
                    :background "#073642"
                    :foreground "#93A1A1"
                    )
(set-face-attribute 'elscreen-tab-current-screen-face nil
                    :background "#93A1A1"
                    :foreground "#073642"
                    )
(set-face-attribute 'elscreen-tab-other-screen-face nil
                    :background "#073642"
                    :foreground "#93A1A1"
                    )

;;;; Dired
(setq dired-omit-files
                (concat dired-omit-files "\\|^\\..+$"))
(setq dired-omit-mode t)
(defun enable-dired-omit-mode () (dired-omit-mode 1))
(add-hook 'dired-mode-hook 'enable-dired-omit-mode)

;;;; popwin
(popwin-mode 1)

(setq display-buffer-function 'popwin:display-buffer)
(push '("^\*helm.+\*$" :regexp t :height 20) popwin:special-display-config)
(push '("^\*\*.+\*Org todo.+\*$" :regexp t :height 7) popwin:special-display-config)

;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;

;; elscreen
(global-set-key (kbd "s-}") 'elscreen-next)
(global-set-key (kbd "s-{") 'elscreen-previous)
(global-set-key (kbd "s-T") 'elscreen-clone)
(global-set-key (kbd "s-w") 'elscreen-kill)

(provide '100_look_and_feel)
;;; 100_look_and_feel.el ends here
