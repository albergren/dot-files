
(require 'org-templates)

;; ---------------------------------------------
;; |	org-mode 						       |
;; ---------------------------------------------
(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))

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
(setq-default frame-title-format '("Emacs-Roam"))

(desktop-save-mode 0)
(global-auto-revert-mode 0)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory notes-dir)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode)
)


  
(setq org-roam-index-file (concat notes-dir roam-index-file))
	(desktop-clear)
	(desktop-save-mode 0)
	(interactive)


	(setq inhibit-startup-screen t)
	(delete-other-windows)
	(deft)

	;;(org-roam-mode)
	(org-roam-buffer-toggle)
	                                                                                                                                                                                                
	(setq org-image-actual-width nil)
	(next-multiframe-window)
	;;(enlarge-window-horizontally ( - (  / (window-body-width)  3) (window-body-width)))
	(enlarge-window ( - (  / (window-body-height)  3) (window-body-height)))

	(set-window-dedicated-p (selected-window) t)
	(previous-multiframe-window)

)

(defun download-inline-image()
    (interactive)

  (setq fileName (download-from-url))
    (insert "#+ATTR_ORG: :width 500")
  (newline)
  (insert "[[" )
  (insert fileName)
  (insert "]]")
  )

(defun download-document()
    (interactive)

  (setq fileName (download-from-url))
  (insert "[[" )
  (insert fileName)
  (insert "][]]")
  (backward-char 2)
  )



(defun download-from-url()
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
  
  ;; make new directory with same name as current file and make new dir
  ;; if it does not exist
  (setq newDir (concat "files/" fileName))
  (setq dest (concat dirName newDir))
  (if (not (file-directory-p newDir))
    (make-directory dest t))
  (setq url (read-string "Enter url:"))
  (setq downloadFile (concat dest (file-name-nondirectory url)))
  (url-copy-file url downloadFile) 
  downloadFile
  


)

;; Set deft to ignore properties tags
(defun cm/deft-parse-title (file contents)
    (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
	  (if begin
		(string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
	   (deft-base-filename file))))
  
    (advice-add 'deft-parse-title :override #'cm/deft-parse-title)
  
    (setq deft-strip-summary-regexp
	  (concat "\\("
		  "[\n\t]" ;; blank
		  "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
		  "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
		  "\\|^- tags ::"
		  "\\)"))

(setq deft-file-limit 70)

(provide 'init-org)
