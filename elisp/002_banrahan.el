;;; 002_banrahan.el --- Helper functions used everywhere
;;
;;; Commentary:
;;
;; This is where I dump all of my helper functions
;;
;;; Code:

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

(defun banrahan-center-screen ()
  (interactive)
  (set-fringe-style '(800 . 200))
  )

(defun banrahan-reset-center-screen ()
  (interactive)
  (set-fringe-style '(0 . 0))
  )

(provide '002_banrahan)
;;; 002_banrahan.el ends here
