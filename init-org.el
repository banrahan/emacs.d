;;; org mode
;; The following lines are always needed. Choose your own keys.
(require 'org)

;; don't truncate lines
(setq org-startup-truncated nil)

;; turn on follow mode
(setq org-agenda-start-with-follow-mode t)

;; recursively add org files
(load-library "find-lisp")

;; from working
;; from projects
(setq org-agenda-files (find-lisp-find-files "~/Dropbox/org/" "\.org$"))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on

;; some key bindings  
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)

;; custom view for what is due today
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

;; setup 0-9 priorities
(setq org-default-priority 57)
(setq org-highest-priority 48)
(setq org-lowest-priority 57)

;; setup capture
(setq org-default-notes-file "~/Dropbox/org/gtd.org")
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("i" "Inbox" entry (file+headline "~/Dropbox/org/gtd.org" "Inbox")
             "* TODO %?")))

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 1)
                                 (org-agenda-files :maxlevel . 1))))


(provide 'init-org)
