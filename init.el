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

;; fundamental configuration
(require '000_paths)
(require '001_packages)
(require '002_banrahan)
(require '004_general)

;; configuration for look and feel
(require '100_look_and_feel)
(require '102_folding)

;; configuration for specific tools
(require '201_eshell)
(require '202_erc)
(require '203_helm)
(require '205_orgmode)

;; language configurations
(require '300_languages)
(require '302_python)

(require '400_sandbox)

;;;;;;;;;;;;;;;;;;;;;;
;;;; Emacs Auto Config
;;;;;;;;;;;;;;;;;;;;;;

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16" :height 1.0))))
 '(org-level-2 ((t (:inherit variable-pitch :foreground "#859900" :height 1.0))))
 '(org-level-3 ((t (:inherit variable-pitch :foreground "#268bd2" :height 1.0))))
 '(org-level-4 ((t (:inherit variable-pitch :foreground "#b58900" :height 1.0)))))
