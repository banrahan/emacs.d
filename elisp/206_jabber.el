;;;;;;;;;;;;;;;;;;;;;;
;;;; jabber 
;;;;;;;;;;;;;;;;;;;;;;

(setq jabber-alert-presence-message-function (lambda (who oldstatus newstatus statustext) nil))
(setq jabber-roster-line-format "%c %-25n %u %-8s  %S")

(setq jabber-account-list
  '(("hanrahan.ben@gmail.com" 
     (:network-server . "talk.google.com")
     (:connection-type . ssl))))


;; jabber
(evil-define-key 'normal jabber-roster-mode-map (kbd "RET")'jabber-roster-ret-action-at-point)

(provide '206_jabber)
