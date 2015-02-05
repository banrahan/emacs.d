;; 000_paths.el --- configure the paths for emacs
;;
;;; Commentary:
;;
;; Code:

;;;; Shell Paths

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

;;;; Emacs Paths
(add-to-list 'load-path "~/.emacs.d/site-elisp")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.virtualenvs/default/bin")
(if (eq system-type 'darwin)
    (setq ispell-program-name "/usr/local/bin/aspell"))

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
