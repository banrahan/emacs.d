(require 'popwin)
(popwin-mode 1)

(setq display-buffer-function 'popwin:display-buffer)
(push '("^\*helm.+\*$" :regexp t :height 20) popwin:special-display-config)
(push '("^\*\*.+\*Org todo.+\*$" :regexp t :height 7) popwin:special-display-config)
