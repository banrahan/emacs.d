;; auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; set tab to use spaces
(setq-default indent-tabs-mode nil)    ; use only spaces and no tabs
(setq default-tab-width 2) 

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

(provide 'init-indentation)
