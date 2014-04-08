;;; 102_folding.el --- all the junk to get folding to work
;;
;;; Commentary:
;;
;; Trying to get folding to work across different modes
;;
;;; Code:

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
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;
;;;; folding
(define-key evil-normal-state-map "zo" 'banrahan-open-fold)
(define-key evil-normal-state-map "zO" 'banrahan-open-folds)
(define-key evil-normal-state-map "zc" 'banrahan-close-fold)
(define-key evil-normal-state-map "zC" 'banrahan-close-folds)

(provide '102_folding)
;;; 102_folding.el ends here
