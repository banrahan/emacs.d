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

;; latex 
(evil-define-key 'normal LaTeX-mode-map "[" 'reftex-citation)
