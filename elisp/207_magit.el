;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;

(evil-define-key 'normal magit-status-mode-map
  "s" 'magit-stage-item
  "S" 'magit-stage-all
  "d" 'magit-discard-item
  "i" 'magit-ignore-item
  "g" 'magit-refresh
  (kbd "TAB") 'magit-cycle-section)


(evil-leader/set-key "m" 'magit-status)

(provide '207_magit)
