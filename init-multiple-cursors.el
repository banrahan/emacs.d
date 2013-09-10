(require 'multiple-cursors)
(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(global-set-key (kbd "s-D") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-d") 'mc/mark-all-like-dwim)
(global-set-key (kbd "s-<mouse-1>") 'mc/add-cursor-on-click)


(provide 'init-multiple-cursors)
