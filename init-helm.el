(require 'helm-config)
(require 'helm-files)

(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
;; set the locate command to use spotlight and a script
(setq helm-c-locate-command "locate_with_mdfind %.0s %s")

(loop for ext in '("\\.swf$" "\\.elc$" "\\.pyc$")
      do (add-to-list 'helm-c-source-mac-spotlight ext))
;(define-key global-map [(alt t)] 'helm-for-files)
(global-set-key (kbd "C-x f") 'helm-for-files)

;; Keep follow mode persistent
(setq helm-follow-mode-persistent t)

;; show the path...mostly used for cmd t
(setq helm-ff-transformer-show-only-basename nil) 

;; cmd t stuff
(push "~/.emacs.d/site-elisp/helm-cmd-t" load-path)
(require 'helm-cmd-t)
(global-set-key (kbd "s-t") 'helm-cmd-t)
;; cmd r stuff
(global-set-key (kbd "s-r") 'helm-imenu)

;; customize helm-mini
(defun helm-mini ()
  "Preconfigured `helm' lightweight version \(buffer -> recentf\)."
  (interactive)
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-recentf
                       helm-c-source-files-in-current-dir
                       helm-c-source-buffer-not-found)
                     "*helm mini*"))


;; yasnippet stuff
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t) ;[default: nil]
(setq helm-yas-display-key-on-candidate t)
(global-set-key (kbd "s-y") 'helm-yas-complete)

;; fix a problem with using cmd-t with fish (change && to ;)
(setq helm-cmd-t-repo-types
  `(("git"         ".git"           "cd %d ; git --no-pager ls-files --full-name")
    ("hg"          ".hg"            "cd %d ; hg manifest")
    ("bzr"         ".bzr"           "cd %d ; bzr ls --versioned")
    ("dir-locals"  ".dir-locals.el" helm-cmd-t-get-find)
    (""            ""               helm-cmd-t-get-find))
)

(provide 'init-helm)
