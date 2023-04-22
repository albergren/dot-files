
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

;; wrap lines
(setq truncate-lines nil)


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

(defun set-roam-buffer ()
		(org-roam-buffer-toggle)
	                                                                                                                                                                                                
	(setq org-image-actual-width nil)
	(next-multiframe-window)
	(enlarge-window ( - (  / (window-body-height)  3) (window-body-height)))

	(set-window-dedicated-p (selected-window) t)
	(setq my-buffer (get-buffer "*org-roam*"))
	(setq-default buffer-invisibility-spec (cons my-buffer 'no-other-window))
	(previous-multiframe-window)
)
  
(setq org-roam-index-file (concat notes-dir roam-index-file))
	(desktop-clear)
	(desktop-save-mode 0)
	(interactive)


	(setq inhibit-startup-screen t)
	(delete-other-windows)
	(deft)

	;;(org-roam-mode)
(set-roam-buffer)

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

;;----------------------------------;;
;;  Change buffer layout on resize  ;;
;;----------------------------------;;

(defvar my-previous-frame-width nil)
(setq my-previous-frame-width 133) ;; find way to get width

(defun check-frame-size-change ()
  "Function to check if the frame size has changed."
  (let ((current-width (frame-width)))
    (unless  (= current-width my-previous-frame-width)
      (setq my-previous-frame-width current-width)
		t)))


(defun my-adjust-window-layout (window)
  "Adjust window layout based on frame width."
  (if (check-frame-size-change)
		(let ((frame-width (frame-width)))
		;; Set window layout based on frame width
		(cond
			((> frame-width 135) ;; find better way to get width
			;; set split window layout
			(let ((buffer (get-buffer "*org-roam*"))) 
				(let ((roam-window (get-buffer-window buffer)))
					(if roam-window
						(delete-window roam-window)
						(message "No window found for buffer %s." buffer-name))))
			  
			(split-window-horizontally)
			(window-resize (selected-window) (- 115 (window-width)) t) ;; find better way to get width
			(other-window 1)
			  
			(split-window-horizontally)
			(window-resize (selected-window) (- 115 (window-width)) t)
			
			(other-window 1)	
			(set-window-buffer (selected-window) "*org-roam*")
			(set-window-dedicated-p (selected-window) t)
			(other-window 1)
			(other-window 1)
			(next-buffer)
			)
			 (t
			  ;; Narrow layout with one window and roam buffer
				(delete-window)
				(other-window 1)
				(delete-window)
				(set-roam-buffer))))))



(add-hook 'window-size-change-functions 'my-adjust-window-layout)

(provide 'init-org)
