;; 000_paths.el --- configure the paths for emacs
;;
;;; Commentary:
;;
;; I still can't get magit to commit correctly run if
;;   I don't start it in the shell
;;
;;; Code:

;;;; Shell Paths


;;;; PATH and other env variables
(if (eq system-type 'darwin)
    (progn
      (setenv "PATH"
	      (concat
	       "/usr/local/bin" ":"
	       "/usr/local/share/python/" ":"
	       "/usr/local/texlive/2008/bin/universal-darwin" ":"
	       "/usr/local/sbin" ":"
	       "/Users/bhanrahan/.emacs.d/scripts" ":"
	       "/Users/bhanrahan/bin" ":"
	       "/usr/bin" ":"
	       "/bin" ":"
	       "/usr/sbin" ":"
	       "/sbin" ":"
	       "/usr/local/bin" ":"
	       "/opt/X11/bin" ":"
	       (getenv "PATH"))
	      )
      (setenv "PYMACS_PYTHON" "python")))

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


;;;; Emacs Paths
(add-to-list 'load-path "~/.emacs.d/site-elisp")
(add-to-list 'load-path "~/.emacs.d/site-elisp/pony-mode/src")
(add-to-list 'load-path "~/.emacs.d/site-elisp/org/lisp")
(add-to-list 'load-path "~/.emacs.d/site-elisp/org/contrib/lisp" t)
(progn (cd "~/.emacs.d/site-elisp")
       (normal-top-level-add-subdirs-to-load-path))

(provide '000_paths)
;;; 000_paths.el ends here
