(require 'ace-jump-mode)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(key-chord-define-global "aj" 'ace-jump-mode)

(provide 'init-acejump)
