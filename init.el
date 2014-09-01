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
(require '003_evil)
(require '004_general)
(require '005_autocomplete)

;; configuration for look and feel
(require '100_look_and_feel)
(require '101_powerline)
(require '102_folding)

;; configuration for specific tools
(require '200_tools)
(require '201_eshell)
(require '202_erc)
(require '203_helm)
(require '204_email)
(require '205_orgmode)
(require '206_jabber)
(require '207_magit)

;; language configurations
(require '300_languages)
(require '301_latex)
(require '302_python)

(require '400_sandbox)

;;;; sandbox
(setq font-lock-maximum-decoration t)
(defface font-lock-func-face 
    '((nil (:foreground "#b58900" :weight bold))
      (t (:bold t :italic t)))
  "Font Lock mode face used for function calls."
  :group 'font-lock-highlighting-faces)

(font-lock-add-keywords
 'emacs-lisp-mode
  '(
    ("\\<\\(interactive\\)" . 'font-lock-keyword-face)
    ("\\<\\(setq\\)" . 'font-lock-function-name-face)
    ("\\<\\(push\\)" . 'font-lock-function-name-face)
    ("\\<\\(put\\)" . 'font-lock-function-name-face)
    ("\\<\\(load-library\\)" . 'font-lock-function-name-face)
  )
)

;;;;;;;;;;;;;;;;;;;;;;
;;;; Emacs Auto Config
;;;;;;;;;;;;;;;;;;;;;;

;;; init.el ends here
