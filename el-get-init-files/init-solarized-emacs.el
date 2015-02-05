;; toggle solarized
(evil-leader/set-key "-" 'banrahan-toggle-solarized)

(defvar dark-light)
(setq dark-light 'dark)
(defun banrahan-toggle-solarized ()
  "Toggle between light and dark solarized themes."
  (interactive)
  (if (eq dark-light 'light)
      (progn (setq dark-light 'dark) (load-theme 'solarized-dark t))
    (progn (setq dark-light 'light) (load-theme 'solarized-light t))
    )
  )
