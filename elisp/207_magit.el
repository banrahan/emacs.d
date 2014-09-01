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
  "q" 'magit-mode-quit-window)

(evil-leader/set-key "m" 'magit-status)


;; set magit executable
(if (eq system-type 'darwin)
    (setq magit-git-executable '"/usr/local/bin/git")) 
(if (eq system-type 'gnu/linux)
    (setq magit-git-executable '"/usr/bin/git"))


(provide '207_magit)
