(require 'tex-site)
(require 'reftex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
;(setq TeX-PDF-mode t)

; turn on search for master
(setq-default TeX-master nil) ; Query for master file.


; turn on reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode
(setq reftex-plug-into-AUCTeX t)

; turn on flyspell
(add-hook 'LaTeX-mode-hook 'turn-on-flyspell)

; auto-indentation
(setq TeX-newline-function 'newline-and-indent)
(setq LaTeX-indent-level 2)

(provide 'init-latex)
