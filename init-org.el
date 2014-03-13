;;; org mode
;; The following lines are always needed. Choose your own keys.
(require 'org)

;; don't truncate lines
(setq org-startup-truncated nil)

;; turn on follow mode
(setq org-agenda-start-with-follow-mode t)

;; import todos
(setq org-agenda-files (list "~/Dropbox/org/gtd.org"
                             "~/Dropbox/org/work.org"
                             "~/Dropbox/org/dissertation.org"))

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

; mobile-org
(setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")
(setq org-mobile-files (quote ("~/Dropbox/org")))
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-capture-file "~/Dropbox/Apps/MobileOrg/mobileorg.org")
(setq org-directory "~/Dropbox/org")

; mobile-org pushing
(defvar org-mobile-push-timer nil
  "Timer that `org-mobile-push-timer' used to reschedule itself, or nil.")

(defun org-mobile-push-with-delay (secs)
  (when org-mobile-push-timer
    (cancel-timer org-mobile-push-timer))
  (setq org-mobile-push-timer
        (run-with-idle-timer
         (* 1 secs) nil 'org-mobile-push)))

(add-hook 'after-save-hook 
 (lambda () 
   (when (eq major-mode 'org-mode)
     (dolist (file (org-mobile-files-alist))
      (if (string= (file-truename (expand-file-name (car file)))
		   (file-truename (buffer-file-name)))
           (org-mobile-push-with-delay 30)))
   )))
  
;(run-at-time "00:05" 86400 '(lambda () (org-mobile-push-with-delay 1))) ;; refreshes agenda file each day
(provide 'init-org)
