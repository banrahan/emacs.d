(elscreen-start)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

(set-face-attribute 'elscreen-tab-background-face nil
                    :background "#073642"
                    :foreground "#93A1A1"
                    )
(set-face-attribute 'elscreen-tab-current-screen-face nil
                    :background "#93A1A1"
                    :foreground "#073642"
                    )
(set-face-attribute 'elscreen-tab-other-screen-face nil
                    :background "#073642"
                    :foreground "#93A1A1"
                    )

(global-set-key (kbd "s-}") 'elscreen-next)
(global-set-key (kbd "s-{") 'elscreen-previous)
(global-set-key (kbd "s-T") 'elscreen-clone)
(global-set-key (kbd "s-w") 'elscreen-kill)
