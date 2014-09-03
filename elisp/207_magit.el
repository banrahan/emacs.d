;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;

(evil-define-key 'normal magit-status-mode-map
  "s" 'magit-stage-item
  "S" 'magit-stage-all
  "d" 'magit-discard-item
  "i" 'magit-ignore-item
  "g" 'magit-refresh
  (kbd "TAB") 'magit-cycle-section
  "c" 'magit-commit
  "F" 'magit-pull
  "P" 'magit-push
  "q" 'magit-mode-quit-window
  "l" 'magit-key-mode-popup-logging)

(evil-leader/set-key "m" 'magit-status)

(provide '207_magit)
