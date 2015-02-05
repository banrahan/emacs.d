;;; 100_look_and_feel.el --- sets all of the general stuff for look and feel
;;
;;; Commentary:
;;
;; Just a bunch of stuff in here
;;
;;; Code:

;;; Font
(if (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil
                        :height 150
                        :family "Inconsolata"))

(if (eq system-type 'darwin)
    (set-face-attribute 'default nil
                        :height 170
                        :family "Monaco"))

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

;;;; Dired
(setq dired-omit-files
                (concat dired-omit-files "\\|^\\..+$"))
(setq dired-omit-mode t)
(defun enable-dired-omit-mode () (dired-omit-mode 1))
(add-hook 'dired-mode-hook 'enable-dired-omit-mode)

(provide '100_look_and_feel)
;;; 100_look_and_feel.el ends here
