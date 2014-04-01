;;; init.el --- All of my settings
;;
;;; Commentary:
;;
;; Each thing is put in an rc-like load file, the sort order is the boot
;;   order.
;; helm-imenu is bound to <s-r> in this buffer and grabs anything
;;   with ;;;; at the start of the line
;;
;;; Code:

(add-to-list 'load-path "~/.emacs.d/elisp/")

(require '000_paths)
(require '001_packages)
(require '002_banrahan)
(require '003_evil)
(require '100_look_and_feel)
(require '101_powerline)

;;;;;;;;;;;;;;;;;;;;;;
;;;; popwin
;;;;;;;;;;;;;;;;;;;;;;
(popwin-mode 1)

(setq display-buffer-function 'popwin:display-buffer)
(push '("^\*helm.+\*$" :regexp t :height 20) popwin:special-display-config)
(push '("^\*\*.+\*Org todo.+\*$" :regexp t :height 7) popwin:special-display-config)

;;;;;;;;;;;;;;;;;;;;;;
;;;; General settings
;;;;;;;;;;;;;;;;;;;;;;

(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Have buffers revert if the file was changed
(global-auto-revert-mode t)

; stop creating those backup~ files
(setq make-backup-files nil) 
; stop creating those #autosave# files
(setq auto-save-default nil) 

;; turn on winner mode for window/tab-like management
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Dired
;(add-hook 'dired-load-hook (function (lambda () (load "dired-x"))))

;; setting fuzzy matching for interactive-do mode
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching for interactive do mode

;; enable autopair in all buffers
(autopair-global-mode) 

;; set magit executable
(setq magit-git-executable '"/usr/local/bin/git")

;;;;;;;;;;;;;;;;;;;;;;
;;;; Folding
;;;;;;;;;;;;;;;;;;;;;;

(load-library "hideshow")
(add-hook 'prog-mode-hook #'hs-minor-mode)
;; functions for using appropriate folding commands
; close one
(defvar banrahan-close-fold-command #'undefined)
(defun banrahan-close-fold ()
  (interactive)
  (call-interactively banrahan-close-fold-command))
(add-hook 'prog-mode-hook
          (lambda () (set (make-local-variable 'banrahan-close-fold-command) #'hs-hide-block)))
(add-hook 'TeX-mode-hook
          (lambda () (set (make-local-variable 'banrahan-close-fold-command) #'hide-entry)))
; close all
(defvar banrahan-close-folds-command #'undefined)
(defun banrahan-close-folds ()
  (interactive)
  (call-interactively banrahan-close-folds-command))
(add-hook 'prog-mode-hook
          (lambda () (set (make-local-variable 'banrahan-close-folds-command) #'hs-hide-all)))
(add-hook 'TeX-mode-hook
          (lambda () (set (make-local-variable 'banrahan-close-folds-command) #'hide-body)))
; open one
(defun banrahan-open-fold ()
  (interactive)
  (call-interactively banrahan-open-fold-command))
(add-hook 'prog-mode-hook
          (lambda () (set (make-local-variable 'banrahan-open-fold-command) #'hs-show-block)))
(add-hook 'TeX-mode-hook
          (lambda () (set (make-local-variable 'banrahan-open-fold-command) #'show-entry)))
; open all
(defvar banrahan-open-folds-command #'undefined)
(defun banrahan-open-folds ()
  (interactive)
  (call-interactively banrahan-open-folds-command))
(add-hook 'prog-mode-hook
          (lambda () (set (make-local-variable 'banrahan-open-folds-command) #'hs-show-all)))
(add-hook 'TeX-mode-hook
          (lambda () (set (make-local-variable 'banrahan-open-folds-command) #'show-all)))

;;;;;;;;;;;;;;;;;;;;;;
;;;; Indentation
;;;;;;;;;;;;;;;;;;;;;;

(define-key global-map (kbd "RET") 'newline-and-indent)

;; set tab to use spaces
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 4) 

;; you have to do hooks sometimes...
(add-hook 'python-mode-hook
          (function (lambda ()
                     (setq indent-tabs-mode nil
                           tab-width 4))))
(add-hook 'javascript-mode
          (function (lambda ()
                     (setq indent-tabs-mode nil
                           tab-width 4))))
 
(setq js-indent-level 4)
(setq css-indent-offset 4)
(setq python-indent 4)

;;;;;;;;;;;;;;;;;;;;;;
;;;; auto-complete
;;;;;;;;;;;;;;;;;;;;;;

(global-auto-complete-mode t)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")

(setq ac-auto-show-menu 0)

(set-default 'ac-sources '(ac-source-features
                           ac-source-functions
                           ac-source-yasnippet
                           ac-source-variables
                           ac-source-symbols
                           ac-source-filename
                           ac-source-files-in-current-dir
                           ac-source-abbrev
                           ac-source-dictionary
                           ac-source-words-in-same-mode-buffers))


(dolist (mode '(django-mode django-html-mode sql-mode
                html-mode LaTeX-mode))
  (add-to-list 'ac-modes mode))

;;;;;;;;;;;;;;;;;;;;;;
;;;; eshell
;;;;;;;;;;;;;;;;;;;;;;

;; open eshell here in normal mode with '!'
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the current buffer's file."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (name (car (last (split-string parent "/" t)))))
    (split-window-vertically)
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(defun delete-single-window (&optional window)
  "Remove WINDOW from the display.  Default is `selected-window'.
If WINDOW is the only one in its frame, then `delete-frame' too."
  (interactive)
  (save-current-buffer
    (setq window (or window (selected-window)))
    (select-window window)
    (kill-buffer)
    (if (one-window-p t)
        (delete-frame)
        (delete-window (selected-window)))))

(defun eshell/x (&rest args)
  (delete-single-window))

;;;;;;;;;;;;;;;;;;;;;;
;;;; ERC
;;;;;;;;;;;;;;;;;;;;;;

(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '((".*\\.freenode.net" "#emacs" "#python" "#django" "#git")))

(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"

                                 "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;;;;;;;;;;;;;;;;;;;;;;
;;;; python
;;;;;;;;;;;;;;;;;;;;;;

;; pymacs stuff
(setq pymacs-python-command "/usr/local/bin/python")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;; ipython
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; jedi auto completion
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

;; associate django-html
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

;;;;;;;;;;;;;;;;;;;;;;
;;;; LaTex
;;;;;;;;;;;;;;;;;;;;;;

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)
(setq tex-fold-mode)

; turn on search for master
(setq-default TeX-master nil) ; Query for master file.

; turn on reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
(setq reftex-plug-into-AUCTeX t)

; turn on flyspell
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

;;;;;;;;;;;;;;;;;;;;;;
;;;; emmet
;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

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
;;;; Markdown
;;;;;;;;;;;;;;;;;;;;;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;;;;;;;;;;;;;;;;;;;;;
;;;; snippets
;;;;;;;;;;;;;;;;;;;;;;
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/yasnippet/snippets"
        "~/.emacs.d/snippets"
        ))

(yas-global-mode 1)

(setq yas/prompt-functions '(yas/x-prompt yas/dropdown-prompt))

;; ansi-term turn off yas
(add-hook 'term-mode-hook (lambda()
                (yas-minor-mode -1)))

;;;;;;;;;;;;;;;;;;;;;;
;;;; Helm
;;;;;;;;;;;;;;;;;;;;;;
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
;; set the locate command to use spotlight and a script
(setq helm-c-locate-command "locate_with_mdfind %.0s %s")

(loop for ext in '("\\.swf$" "\\.elc$" "\\.pyc$")
      do (add-to-list 'helm-c-source-mac-spotlight ext))
;; Keep follow mode persistent
(setq helm-follow-mode-persistent t)

;; show the path...mostly used for cmd t
(setq helm-ff-transformer-show-only-basename nil) 

;; customize helm-mini
(defun helm-mini ()
  "Preconfigured `helm' lightweight version \(buffer -> recentf\)."
  (interactive)
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-recentf
                       helm-c-source-files-in-current-dir
                       helm-c-source-buffer-not-found)
                     "*helm mini*"))


;; yasnippet helm
(setq helm-yas-space-match-any-greedy t) ;[default: nil]
(setq helm-yas-display-key-on-candidate t)

;; fix a problem with using cmd-t with fish (change && to ;)
(setq helm-cmd-t-repo-types
  `(("git"         ".git"           "cd %d ; git --no-pager ls-files --full-name")
    ("hg"          ".hg"            "cd %d ; hg manifest")
    ("bzr"         ".bzr"           "cd %d ; bzr ls --versioned")
    ("dir-locals"  ".dir-locals.el" helm-cmd-t-get-find)
    (""            ""               helm-cmd-t-get-find))
)

;; imenu for elisp
(defun imenu-elisp-sections ()
  (setq imenu-prev-index-position-function nil)
  (add-to-list 'imenu-generic-expression '("Sections" "^;;;; \\(.+\\)$" 1) t))
(add-hook 'emacs-lisp-mode-hook 'imenu-elisp-sections)

;; imenu for init
(defun banrahan-init-imenu ()
  (interactive)
  (find-file-existing "~/.emacs.d/init.el")
  (widen)
  (helm-imenu))

;; imenu org mode
(defun banrahan-org-imenu ()
  (interactive)
  (find-file-existing "~/Dropbox/org/projects.org")
  (widen)
  (helm-org-headlines))

;; change the order of projectile stuff to have recents and buffers first
(defun helm-projectile ()
  "Use projectile with Helm instead of ido."
  (interactive)
  (let ((helm-ff-transformer-show-only-basename nil))
    (helm :sources '(helm-source-projectile-recentf-list
                     helm-source-projectile-buffers-list
                     helm-source-projectile-files-list
                     )
          :buffer "*helm projectile*"
          :prompt (projectile-prepend-project-name "pattern: "))))


;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;

;; evil bindings
(evil-leader/set-key "k" 'kill-buffer)
(evil-leader/set-key "+" 'evil-numbers/inc-at-pt)
(evil-leader/set-key "=" 'evil-numbers/dec-at-pt)
(evil-set-toggle-key "s-=") ; set the toggle key
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up) ; restore control-u as up half a page

;; folding
(define-key evil-normal-state-map "zo" 'banrahan-open-fold)
(define-key evil-normal-state-map "zO" 'banrahan-open-folds)
(define-key evil-normal-state-map "zc" 'banrahan-close-fold)
(define-key evil-normal-state-map "zC" 'banrahan-close-folds)

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

;; toggle solarized
(evil-leader/set-key "-" 'banrahan-toggle-solarized)

;; commenting
(global-set-key (kbd "s-/") 'comment-or-uncomment-region)

;; better scrolling
(global-set-key "\M-n"  (lambda () (interactive) (scroll-up   16)) )
(global-set-key "\M-p"  (lambda () (interactive) (scroll-down 16)) )

;; org key bindings  
(global-set-key (kbd "s-4") 'org-agenda)
(global-set-key (kbd "s-5") '(lambda () (interactive) (org-capture nil "i")))
(evil-define-key 'normal org-mode-map "t" 'org-todo)
(evil-leader/set-key-for-mode 'org-mode "$" 'org-archive-subtree)
(evil-leader/set-key-for-mode 'org-mode "n" 'org-add-note)
(evil-define-key 'normal org-mode-map "o" '(lambda()
                                            (interactive)
                                            (evil-end-of-line)
                                            (org-insert-heading-respect-content t)
                                            (evil-end-of-line)
                                            (evil-append 0)
                                            )
  )
(evil-define-key 'normal org-mode-map "O" '(lambda()
                                            (interactive)
                                            (evil-beginning-of-line)
                                            (org-insert-heading-respect-content t)
                                            (evil-end-of-line)
                                            (evil-append 0)
                                            )
  )

;; helm
(global-set-key (kbd "s-t") 'helm-projectile)
(global-set-key (kbd "s-e") 'helm-for-files)
(global-set-key (kbd "s-d") 'helm-find-files)
(global-set-key (kbd "s-r") 'helm-imenu)
(global-set-key (kbd "s-y") 'helm-yas-complete)
(global-set-key (kbd "s-P") 'helm-M-x)
(global-set-key "\M-x" 'helm-M-x)

;; django project
(global-set-key (kbd "C-c C-o") 'python-django-open-project)

;; latex 
(evil-define-key 'normal LaTeX-mode-map "[" 'reftex-citation)

;; bind c-tab to autocomplete
(global-set-key (kbd "C-<tab>") 'auto-complete)

;; next prev commands in popup
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; eshell
(define-key evil-normal-state-map "!" 'eshell-here)

;; magit
(evil-leader/set-key "m" 'magit-status)

;; elscreen
(define-key evil-normal-state-map "gt" 'elscreen-next)
(define-key evil-normal-state-map "gT" 'elscreen-previous)
(define-key evil-normal-state-map "gc" 'elscreen-clone)
(define-key evil-normal-state-map "gk" 'elscreen-kill)
(global-set-key (kbd "s-}") 'elscreen-next)
(global-set-key (kbd "s-{") 'elscreen-previous)
(global-set-key (kbd "s-T") 'elscreen-clone)
(global-set-key (kbd "s-w") 'elscreen-kill)

;;;;;;;;;;;;;;
;;;; email
;;;;;;;;;;;;;;

(global-set-key (kbd "s-i") (lambda () (interactive) (mu4e~headers-jump-to-maildir '"/gmail/INBOX")))
(evil-define-key 'normal mu4e-headers-mode-map "J" 'mu4e~headers-jump-to-maildir)
(evil-define-key 'normal mu4e-headers-mode-map (kbd "RET") 'mu4e-headers-view-message)
(evil-define-key 'normal mu4e-headers-mode-map "d" 'mu4e-headers-mark-for-trash)
(evil-define-key 'normal mu4e-headers-mode-map "r" 'mu4e-headers-mark-for-refile)
(evil-define-key 'normal mu4e-headers-mode-map "R" 'mu4e-compose-reply)
(evil-define-key 'normal mu4e-headers-mode-map "F" 'mu4e-compose-forward)
(evil-define-key 'normal mu4e-headers-mode-map "C" 'mu4e-compose-new)
(evil-define-key 'normal mu4e-headers-mode-map "M" 'mu4e-headers-mark-pattern)
(evil-define-key 'normal mu4e-headers-mode-map "u" 'mu4e-headers-mark-for-unmark)
(evil-define-key 'normal mu4e-headers-mode-map "U" 'mu4e-mark-unmark-all)
(evil-define-key 'normal mu4e-headers-mode-map "s" 'mu4e-headers-search)
(evil-define-key 'normal mu4e-headers-mode-map "b" 'mu4e-headers-search-bookmark)

(evil-define-key 'normal mu4e-view-mode-map "R" 'mu4e-compose-reply)
(evil-define-key 'normal mu4e-view-mode-map "F" 'mu4e-compose-forward)


(evil-define-key 'normal mu4e-headers-mode-map "x" 'mu4e-mark-execute-all)
(evil-define-key 'normal mu4e-headers-mode-map "I" (lambda () (interactive) (mu4e-update-mail-and-index t)))

(evil-define-key 'normal mu4e-view-mode-map "q" 'mu4e~view-quit-buffer)

(add-hook 'mu4e-view-mode-hook 'turn-on-flyspell)

(setq user-mail-address "hanrahan.ben@gmail.com")
(setq user-full-name "Ben Hanrahan")

(setq mu4e-mu-binary "/usr/local/bin/mu")
(setq mu4e-maildir "~/.mail")
(setq mu4e-drafts-folder "/gmail/[Gmail].Drafts")
(setq mu4e-sent-folder   "/gmail/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/gmail/[Gmail].Trash")
(setq mu4e-refile-folder  "/gmail/[Gmail].All Mail")

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; allow for updating mail using 'U' in the main view:
;; TODO make a toggle function for this...or a get all function that sets it and resets it
(setq mu4e-get-mail-command "offlineimap -o")
;(setq mu4e-get-mail-command "offlineimap -f INBOX")
; run on a timer
(run-with-timer 0 (* 10 60) (lambda () (interactive) (mu4e-update-mail-and-index t)))

(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)


(setq ssl-program-name "gnutls-cli"
      ssl-program-arguments '("--port" service
                              "--insecure"
                              "--x509cafile" "/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt"
                              host))

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

(setq message-kill-buffer-on-exit t)


;;;;;;;;;;;;;;;;;;;;;;
;;;; jabber 
;;;;;;;;;;;;;;;;;;;;;;

(setq jabber-alert-presence-message-function (lambda (who oldstatus newstatus statustext) nil))
(setq jabber-roster-line-format "%c %-25n %u %-8s  %S")

(setq jabber-account-list
  '(("hanrahan.ben@gmail.com" 
     (:network-server . "talk.google.com")
     (:connection-type . ssl))))



;;;;;;;;;;;;;;;;;;;;;;
;;;; Emacs Auto Config
;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    (quote
     (safe-local-variable-values
      (quote
       ((pony-settings make-pony-project :python "/Users/bhanraha/working/env/crowd_server/bin/ipython" :settings "settings")
        (python-mode
         (python-shell-interpreter . "python")
         (python-shell-interpreter-args . "/Users/bhanraha/working/crowd_plugins/crowd_server/manage.py shell")
         (python-shell-prompt-regexp . "In \\[[0-9]+\\]: ")
         (python-shell-prompt-output-regexp . "Out\\[[0-9]+\\]: ")
         (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
         (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
")
         (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
")
         (python-shell-virtualenv-path . "/Users/bhanraha/working/env/crowd_server"))
        (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
")
        (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
")
        (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
        (python-shell-interpreter-args . "/Users/bhanraha/working/crowd_plugins/crowd_server/manage.py shell")
        (python-shell-interpreter . "python")
        (pony-settings make-pony-project :python "/Users/bhanraha/working/env/crowd_server/bin/python" :settings "settings" :pony-sqlite-program "/usr/bin/sqlite3")
        (pony-settings make-pony-project :python "/Users/bhanraha/working/env/crowd_server/bin/python" :settings "settings")
        (pony-settings make-pony-project :python "/Users/bhanraha/working/env/crowd_server/bin/python")
        (pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/bin/python")
        (pony-settings make-pony-project :python "/Users/bhanraha/working/competitions/env/bin/python")))))))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
