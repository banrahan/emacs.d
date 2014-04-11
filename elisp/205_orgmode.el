
;;;;;;;;;;;;;;;;;;;;;;
;;;; org-mode
;;;;;;;;;;;;;;;;;;;;;;

;; don't truncate lines
(setq org-startup-truncated nil)

;; warnings-days
(setq org-deadline-warning-days 0)


;; import todos
(setq org-agenda-files (list "~/Dropbox/org/dissertation.org"
                             "~/Dropbox/org/gtd.org"
                             "~/Dropbox/org/projects.org"
                             "~/Dropbox/org/work.org"
                             ))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; not needed when global-font-lock-mode is on
(add-hook 'org-mode-hook 'turn-on-font-lock) 

;; custom view for what is due today
(setq org-agenda-custom-commands
      '(("i" "Immediate"
         ((agenda "" ((org-agenda-ndays 1)))) ;; limits the agenda display to a single day
         ((org-agenda-compact-blocks t) ;; options set here apply to the entire block
          (org-deadline-warning-days 0)))
        ("n" todo "NEXT"
         ((org-deadline-warning-days 0)))
       )
)

;; setup 0-9 priorities
(setq org-default-priority 57)

(setq org-highest-priority 48)
(setq org-lowest-priority 57)

;; setup capture
(setq org-default-notes-file "~/Dropbox/org/gtd.org")
(setq org-capture-templates
      '(("i" "Inbox" entry (file+headline "~/Dropbox/org/gtd.org" "Inbox")
             "* %?")))

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 1)
                                 (org-agenda-files :maxlevel . 1))))

;; todo customization
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING" "EMAIL"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("EMAIL" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))


;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;
;; org agenda evil movement commands
(define-key org-agenda-mode-map "j" 'evil-next-line)
(define-key org-agenda-mode-map "k" 'evil-previous-line)
;; org evil movement commands
(evil-define-key 'normal org-mode-map "k" 'previous-line) ; for some reason evil-previous-line moves up two in column view
(evil-define-key 'normal org-mode-map "j" 'next-line) ; for some reason evil-next-line moves down and switches columns in column view
;; magit evil movement commands
(define-key magit-status-mode-map (kbd "C-j") 'evil-next-line)
(define-key magit-status-mode-map (kbd "C-k") 'evil-previous-line)
;; dired evil movement commands
(evil-define-key 'normal dired-mode-map "$" 'evil-end-of-line)
(evil-define-key 'normal dired-mode-map "0" 'evil-beginning-of-line)

;; org key bindings  
(global-set-key (kbd "s-4") 'org-agenda)
(global-set-key (kbd "s-5") '(lambda () (interactive) (org-capture nil "i")))
(evil-define-key 'normal org-mode-map "t" 'org-todo)
(evil-leader/set-key-for-mode 'org-mode "$" 'org-archive-subtree)
(evil-leader/set-key-for-mode 'org-mode "n" 'org-add-note)
(evil-define-key 'normal org-mode-map (kbd "C-o") '(lambda()
                                            (interactive)
                                            (evil-end-of-line)
                                            (org-insert-heading-respect-content t)
                                            (evil-end-of-line)
                                            (evil-append 0)
                                            )
  )
(evil-define-key 'normal org-mode-map (kbd "C-S-o") '(lambda()
                                            (interactive)
                                            (evil-beginning-of-line)
                                            (org-insert-heading-respect-content t)
                                            (evil-end-of-line)
                                            (evil-append 0)
                                            )
  )

(provide '205_orgmode)
