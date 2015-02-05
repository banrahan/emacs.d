;; toggle solarized
(evil-leader/set-key "-" 'banrahan-toggle-solarized)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

;; Use more italics
(setq solarized-use-more-italic t)

(defvar dark-light)
(setq dark-light 'light)
(defun banrahan-toggle-solarized ()
  "Toggle between light and dark solarized themes."
  (interactive)
  (if (eq dark-light 'light)
      (progn (setq dark-light 'dark) (load-theme 'solarized-dark t))
    (progn (setq dark-light 'light) (load-theme 'solarized-light t))
    )
  )

(load-theme 'solarized-light t)
