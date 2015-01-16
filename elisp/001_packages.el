;;; 001_packages.el --- Load all packages up front
;;
;;; Commentary:
;;
;; I put all of the requires up front to avoid problems with not loading in time
;;
;;; Code:


(require 'package)
(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq my-packages
      '(auctex
	auto-complete
	autopair
	ctable
	deferred
	diminish
	el-get
	elscreen
	emmet-mode
	epc
	evil
	evil-leader
	evil-surround
	evil-numbers
	ess
        exec-path-from-shell
        flycheck
	fuzzy
	helm
	helm-cmd-t
	helm-c-yasnippet
	jedi
	magit
        nose
	popup
	popwin
	pony-mode
	powerline
	projectile
	pymacs
	python-django
	python-environment
	rope
	ropemacs
	ropemode
        solarized-emacs
	yasnippet))

(el-get 'sync my-packages)

(require 'ess-site)
(require 'evil)
(require 'evil-leader)
(require 'evil-surround)
(require 'evil-numbers)
(require 'org-agenda)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'autopair)
(require 'magit)
(require 'pymacs)
(require 'django-html-mode)
(require 'django-mode)
(require 'pony-mode)
(require 'python-django)
(require 'tex-site)
(require 'reftex)
(require 'emmet-mode)
(require 'flycheck)
(require 'org)
(require 'yasnippet)
(require 'helm-config)
(require 'helm-files)
(require 'helm-match-plugin)
(require 'helm-cmd-t)
(require 'helm-c-yasnippet)
(require 'dired)
(require 'popwin)
(require 'erc)
(require 'elscreen)
(require 'projectile)
(require 'helm-projectile)
(require 'powerline)
(require 'diminish)

(provide '001_packages)
;;; 001_packages.el ends here
