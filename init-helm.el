(require 'helm-config)
(require 'helm-files)

(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
(setq helm-c-locate-command "locate_with_mdfind %.0s %s")
(loop for ext in '("\\.swf$" "\\.elc$" "\\.pyc$")
      do (add-to-list 'helm-c-source-mac-spotlight ext))
(define-key global-map [(alt t)] 'helm-for-files)

;; keep follow mode persistent
(setq helm-follow-mode-persistent t)

;; show the path...mostly used for cmd t
(setq helm-ff-transformer-show-only-basename nil) 

;; cmd t stuff
(push "~/.emacs.d/site-elisp/helm-cmd-t" load-path)
(require 'helm-cmd-t)
(global-set-key (kbd "M-t") 'helm-cmd-t)

;; customize helm-mini
(defun helm-mini ()
  "Preconfigured `helm' lightweight version \(buffer -> recentf\)."
  (interactive)
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-recentf
                       helm-c-source-files-in-current-dir
                       helm-c-source-buffer-not-found)
                     "*helm mini*"))

(provide 'init-helm)
