;;; 001_packages.el --- Load all packages up front
;;
;;; Commentary:
;;
;; I put all of the requires up front to avoid problems with not loading in time
;;
;;; Code:

;;;; elpa

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;;;; Requires

(require 'ess-site)
(require 'evil)
(require 'evil-leader)
(require 'surround)
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
(require 'jabber)
(require 'mu4e)
(require 'smtpmail)
(require 'diminish)

(provide '001_packages)
;;; 001_packages.el ends here
