;;; org mode
;; The following lines are always needed. Choose your own keys.
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(setq org-agenda-custom-commands
      '(("I" "Immediate"
         ((agenda "" ((org-agenda-ndays 1))) ;; limits the agenda display to a single day
         )
        (
          (org-agenda-compact-blocks t) ;; options set here apply to the entire block
          (org-deadline-warning-days 0)
        )
       ))
)

(provide 'init-org)