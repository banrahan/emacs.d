;; 000_paths.el --- configure the paths for emacs
;;
;;; Commentary:
;;
;; I still can't get magit to commit correctly run if
;;   I don't start it in the shell
;;
;; Code:

;;;; Shell Paths


;;;; PATH and other env variables
(if (eq system-type 'darwin)
    (progn
      (setenv "PATH"
	      (concat
	       "/usr/local/bin" ":"
	       "/usr/texbin/" ":"
	       "/usr/local/sbin" ":"
	       "/Users/bhanraha/.emacs.d/scripts" ":"
	       "/Users/bhanraha/bin" ":"
	       "/usr/bin" ":"
	       "/bin" ":"
	       "/usr/sbin" ":"
	       "/sbin" ":"
	       "/usr/local/bin" ":"
	       "/opt/X11/bin" ":"
	       (getenv "PATH"))
	      )
      (setenv "PYMACS_PYTHON" "python")))

(if (eq system-type 'darwin)
    (progn
      (push "~/.virtualenvs/default/bin" exec-path)
      (setenv "PATH"
              (concat
               "~/.virtualenvs/default/bin" ":"
               (getenv "PATH")))))

(if (eq system-type 'gnu/linux)
    (progn
      (setenv "PATH"
	      (concat
	       "/usr/local/bin" ":"
	       "/usr/bin/python2" ":"
	       "/usr/local/texlive/2008/bin/universal-darwin" ":"
	       "/usr/local/sbin" ":"
	       "/home/banrahan/.emacs.d/scripts" ":"
	       "/home/banrahan/bin" ":"
	       "/usr/bin" ":"
	       "/bin" ":"
	       "/usr/sbin" ":"
	       "/sbin" ":"
	       "/usr/local/bin" ":"
	       (getenv "PATH"))
	      )
      (setenv "PYMACS_PYTHON" "python2")))

(if (eq system-type 'darwin)
    (setq ispell-program-name "/usr/local/bin/aspell"))

;;;; Emacs Paths
(add-to-list 'load-path "~/.emacs.d/site-elisp")
(add-to-list 'load-path "~/.emacs.d/site-elisp/pony-mode/src")
(add-to-list 'load-path "~/.emacs.d/site-elisp/org/lisp")
(add-to-list 'load-path "~/.emacs.d/site-elisp/org/contrib/lisp" t)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/el-get/pymacs")
(add-to-list 'load-path "~/.virtualenvs/default/bin")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(progn (cd "~/.emacs.d/el-get")
       (normal-top-level-add-subdirs-to-load-path))

(progn (cd "~/.emacs.d/site-elisp")
       (normal-top-level-add-subdirs-to-load-path))

(provide '000_paths)
;;; 000_paths.el ends here
