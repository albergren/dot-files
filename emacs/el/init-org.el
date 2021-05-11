
(require 'org-templates)

;; ---------------------------------------------
;; |	org-mode 						       |
;; ---------------------------------------------

(defconst *my-date* "%m/%d/%y")
(defun date-fun (d) (format-time-string *my-date* (time-subtract (current-time) (days-to-time d))))
(defun date-fun2 () (format-time-string "[%Y-%m-%d %a %H:%M]"))
         
(global-set-key (kbd "C-c c") 'org-capture)


;; ---------------------------------------------
;; |	org-roam 	    			           |
;; ---------------------------------------------

;; deft to index
(setq deft-extensions '("txt" "tex" "org"))
(setq deft-directory notes-dir)


;; layout definition
(defun roam-layout (switch)
(desktop-save-mode 0)
(global-auto-revert-mode 0)
(use-package org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory notes-dir)
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n c" . org-roam-capture)
               ("C-c n g" . org-roam-graph)
	       ("C-c n j" . org-roam-jump-to-index))

              :map org-mode-map
              (("C-c n i" . org-roam-insert))))

(setq org-roam-index-file (concat notes-dir roam-index-file))
	(desktop-clear)
	(desktop-save-mode 0)
	(interactive)


	(setq inhibit-startup-screen t)
	(delete-other-windows)
	(deft)

	(org-roam-mode)
	(org-roam-buffer-toggle-display)
	                                                                                                                                                                                                
	(setq org-image-actual-width nil)
	(next-multiframe-window)
	(enlarge-window-horizontally ( - 35 (window-body-width)))
	(previous-multiframe-window)
)



(defun xfun()
  (interactive)
  (let ((fileName)
        (newDirName)
		(dirName))
  )
  
  ;; get name of current file
  (setq fileName (file-name-sans-extension
				 (file-name-nondirectory 
			     (buffer-file-name)))) 
  (setq fileName (concat fileName "/"))
  (setq dirName (file-name-directory (buffer-file-name)))
  
  ;; make new directory with same name as file
  (setq newDir (concat "files/" fileName))
  (setq dest (concat dirName newDir))
  (if (not (file-directory-p newDir))
    (make-directory dest t))
  (setq url (read-string "Enter url:"))
  (setq downloadFile (concat dest (file-name-nondirectory url)))
  (insert downloadFile)
  (url-copy-file url downloadFile) 
)

(provide 'init-org)
