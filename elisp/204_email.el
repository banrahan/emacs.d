;;;;;;;;;;;;;;
;;;; email
;;;;;;;;;;;;;;
(require 'mu4e)

(add-hook 'mu4e-view-mode-hook 'turn-on-flyspell)

(setq user-mail-address "hanrahan.ben@gmail.com"
      user-full-name "Ben Hanrahan"
      message-signature nil)



(if (eq system-type 'darwin)
    (setq mu4e-mu-binary "/usr/local/bin/mu"))
(if (eq system-type 'gnu/linux)
    (progn
      (setq mu4e-mu-binary "/usr/bin/mu")
      (setq mu4e-msg2pdf "/usr/bin/msg2pdf")))

(setq mu4e-maildir "~/.mail")

(setq mu4e-drafts-folder "/gmail/[Gmail].Drafts"
      mu4e-sent-folder   "/gmail/[Gmail].Sent Mail"
      mu4e-trash-folder  "/gmail/[Gmail].Trash"
      mu4e-refile-folder  "/gmail/[Gmail].All Mail")

;; can't get this to work quite right
;(add-to-list 'mu4e-bookmarks
;	     '("\"maildir:/gmail/INBOX\"" "Inbox" ?i))

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; allow for updating mail using 'U' in the main view:
;; TODO make a toggle function for this...or a get all function that sets it and resets it
(setq mu4e-get-mail-command "offlineimap -o")
;(setq mu4e-get-mail-command "offlineimap -f INBOX")
; run on a timer
;(run-with-timer 0 (* 10 60) (lambda () (interactive) (mu4e-update-mail-and-index t)))

(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(setq mu4e-html2text-command "w3m -dump -T text/html")

(setq ssl-program-name "gnutls-cli"
      ssl-program-arguments '("--port" service
                              "--insecure"
                              "--x509cafile" "/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt"
                              host))

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)


(setq message-kill-buffer-on-exit t)
(mu4e)

;;;;;;;;;;;;;;;;;;;;;;
;;;; Key Bindings
;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "s-i") (lambda () (interactive) (mu4e~headers-jump-to-maildir '"/gmail/INBOX")))
(evil-define-key 'normal mu4e-headers-mode-map "g" (lambda () (interactive) (mu4e-update-mail-and-index t)))
(evil-define-key 'normal mu4e-view-mode-map "g" (lambda () (interactive) (mu4e-update-mail-and-index t)))

(evil-define-key 'normal mu4e-headers-mode-map
  "J" 'mu4e~headers-jump-to-maildir
  (kbd "RET") 'mu4e-headers-view-message
  "d" 'mu4e-headers-mark-for-trash
  "r" 'mu4e-headers-mark-for-refile
  "R" 'mu4e-compose-reply
  "F" 'mu4e-compose-forward
  "C" 'mu4e-compose-new
  "M" 'mu4e-headers-mark-pattern
  "u" 'mu4e-headers-mark-for-unmark
  "U" 'mu4e-mark-unmark-all
  "s" 'mu4e-headers-search
  "x" 'mu4e-mark-execute-all
  "+" 'mu4e-headers-mark-for-flag
  "-" 'mu4e-headers-mark-for-unflag
  "b" 'mu4e-headers-search-bookmark)

(evil-define-key 'normal mu4e-view-mode-map
  "J" 'mu4e~headers-jump-to-maildir
  "d" 'mu4e-view-mark-for-trash
  "r" 'mu4e-view-mark-for-refile
  "R" 'mu4e-compose-reply
  "F" 'mu4e-compose-forward
  "C" 'mu4e-compose-new
  "s" 'mu4e-headers-search
  "b" 'mu4e-headers-search-bookmark
  "n" 'mu4e-view-headers-next
  "p" 'mu4e-view-headers-prev
  "q" 'mu4e~view-quit-buffer
  "x" 'mu4e-view-marked-execute
  "O" 'mu4e-view-open-attachment
  "+" 'mu4e-view-mark-for-flag
  "-" 'mu4e-view-mark-for-unflag
  "U" 'mu4e-view-go-to-url)

(provide '204_email)
