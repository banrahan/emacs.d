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

;;; Solarized theme
(load-theme 'solarized-light t)

;;; Tabs
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

(provide '100_look_and_feel)
;;; 100_look_and_feel.el ends here
