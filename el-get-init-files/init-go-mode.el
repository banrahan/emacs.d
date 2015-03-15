(require 'go-autocomplete)
(load-file "~/.emacs.d/site-elisp/oracle.el")
(setq go-oracle-command "/Users/bhanraha/working/go/bin/oracle")
(setenv "GOPATH" "/Users/bhanraha/working/go/")

(defun my-go-mode-hook ()
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build && go test && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(define-key go-mode-map (kbd "C-c C-c") 'compile)
