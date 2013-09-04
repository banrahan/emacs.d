(add-to-list 'load-path "~/.emacs/site-elisp/multiple-cursors")
(require 'multiple-cursors)

(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(global-set-key (kbd "s-D") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-d") 'mc/mark-all-like-this)

(provide 'init-multi-cursor)
