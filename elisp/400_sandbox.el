(require 'helm)

(defvar helm-mu4e-source-buffer "*helm mu4e*")

;;;; helm mu4e maildirs
(defvar helm-source-mu4e-maildirs
  `((name . "Maildirs")
    (candidate-number-limit . 9999)
    (candidates
     . (lambda () (mu4e-get-maildirs)))
     (action . (("Jump to maildir" .
                (lambda (candidate)
                  (mu4e~headers-jump-to-maildir candidate)))))))

;;;###autoload
(defun helm-mu4e nil
  "Select from mu4e maildirs to jump to."
  (interactive)
  (helm :sources '(helm-source-mu4e-bookmarks
		   helm-source-mu4e-maildirs)
        :buffer helm-mu4e-source-buffer))

(defvar helm-mu4e-bookmarks-source-buffer "*helm mu4e bookmarks*")

;;;; helm mu4e bookmarks
(defvar helm-source-mu4e-bookmarks
  `((name . "Bookmarks")
    (candidate-number-limit . 9999)
    (candidates
     . (lambda () 
	 (loop for s in mu4e-bookmarks
	       collect (nth 1 s))))
     (action . (("Jump to bookmarks" .
                (lambda (candidate)
                  (mu4e-headers-search candidate)))))))
  
;;;###autoload
(defun helm-mu4e-bookmarks nil
  "Select from mu4e bookmarks to jump to"
  (interactive)
  (helm :sources 'helm-source-mu4e-bookmarks
	:buffer helm-mu4e-bookmarks-source-buffer))

;; (require 'ox-taskjuggler)
;; (setq org-taskjuggler-target-version 3.4)

;;;; sublimity

;;(require 'sublimity)
;;(require 'sublimity-scroll)
;;(require 'sublimity-map)
;;(require 'sublimity-attractive)

;;(sublimity-mode 1)
;;(setq sublimity-scroll-drift-length 1); sublimity-scroll-weight 4)
;;(setq sublimity-attractive-centering-width nil)
;(sublimity-map-set-delay 5)

;; need to put this in the locals
(menu-bar-mode -1)

(provide '400_sandbox)
