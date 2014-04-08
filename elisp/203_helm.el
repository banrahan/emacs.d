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
;; helm
(global-set-key (kbd "s-t") 'helm-projectile)
(global-set-key (kbd "s-e") 'helm-for-files)
(global-set-key (kbd "s-d") 'helm-find-files)
(global-set-key (kbd "s-r") 'helm-imenu)
(global-set-key (kbd "s-y") 'helm-yas-complete)
(global-set-key (kbd "s-P") 'helm-M-x)
(global-set-key "\M-x" 'helm-M-x)

(provide '203_helm)
