;; 000_paths.el --- configure the paths for emacs
;;
;;; Commentary:
;;
;; Code:

(if (eq system-type 'gnu/linux)
      (setenv "PYMACS_PYTHON" "python2"))

;;;; Emacs Paths
(add-to-list 'load-path "~/.emacs.d/site-elisp")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.virtualenvs/default/bin")

(if (eq system-type 'darwin)
    (setq ispell-program-name "/usr/local/bin/aspell"))

;;;; el-get stuff
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-custom-recipes")

(progn (cd "~/.emacs.d/el-get")
       (normal-top-level-add-subdirs-to-load-path))

(progn (cd "~/.emacs.d/site-elisp")
       (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(provide '000_paths)
;;; 000_paths.el ends here
