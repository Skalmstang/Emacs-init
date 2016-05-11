;; ------------------------------------------------------------- [ Find master ]
;; Find the master file

(defun munk-update-input-alist (dir)
  "Return a alist where the key is the file being input'ed
and value a list of the files refering to it."
  (let ((candidates (directory-files dir t "\\.tex" t)) ;All .tex files in DIR
	key cell al streng)
    (with-temp-buffer
      (dolist (file candidates)
	(when (and (stringp (file-name-extension file))
		   (string-match "tex\\>" (file-name-extension file)))    ;Access only for .tex files

	  ;; Replace the content in the temp buffer with the file content
	  ;; Don't apply major mode etc.
	  (if (not (get-file-buffer file))
	      (insert-file-contents-literally file nil nil nil t)
	    ;; If a buffer is visiting that file, search the buffer.
	    ;; It might contain unsaved inputs
	    (delete-region (point-min) (point-max))
	    (insert-buffer-substring-no-properties (get-file-buffer file)))

	  (goto-char (point-min))
	  
	  ;; Find all references to other files
	  (while (re-search-forward "^\\s-*\\\\in\\(?:put\\|clude\\){\\([^}]+\\)}" nil t)
	    (setq streng (concat dir (match-string 1) ".tex")
		  key (assoc streng al))

	    ;; Update the alist
	    (cond ((null al)		;Getting started
		   (setq al (list (cons streng (list file)))))

		  (key			;Updating
		   (setq cell key)
		   (setcdr cell (append (list file) (cdr key)))) ;Appends, so value is a list

		  ((null key)		;New key
		   (setq cell (cons streng (list file))
			 al (cons cell al))))))))
    ;; Return the alist
    al))

(defvar LaTeX-master-alist nil
  "Buffer local var containing the alist from `munk-master'")

(defun munk-master (&optional override)
  "Returns the master-file for this LaTeX document.
If document contains \\documentclass{ it is considered the masterfile.
Else find the .tex file no else is linking to."
  (interactive "P")
  (let ((count 0)
	(count-try 0)
	tried				;Guesses
	master				;Holds intermediate and final candidates
	input-alist)			;Alist containing who inputs who
    (if (limited-save-excursion
	 (goto-char (point-min))
	 (search-forward "\\documentclass" nil t))
	(progn
	  (message "This file is the master")
	  (setq master t))
      
      ;; This is not the master!
      ;; Get the input alist from a buffer from same dir
      (when buffer-file-name
	(unless override 
	  (catch 'found
	    (dolist (buffer (buffer-list))
	      (when (and (buffer-file-name buffer)                                  ;It must be visiting something
			 (not (equal (buffer-file-name) (buffer-file-name buffer))) ;Not be itself
			 (equal (file-name-directory (buffer-file-name))		  ;And from same dir
				(file-name-directory (buffer-file-name buffer))))

		(setq input-alist (buffer-local-value 'LaTeX-master-alist buffer)	  ;Ge the local input-alist
		      tried (buffer-local-value 'TeX-master buffer))		  ;Our guess on the master

		;;Only accept if this LaTeX document is in the input alist
		(if (and (assoc (buffer-file-name) input-alist) tried)		  
		    (progn
		      (setq master (expand-file-name (if (eq tried t)               ;If true this is the master
							 (buffer-file-name buffer)  
						       tried)))                     
		      (throw 'found master))
		  (setq input-alist nil
			tried nil))))))
	
	;; If we couldn't find a candidate that way...
	(unless master
	  ;; Check the files in this directory
	  (setq input-alist (munk-update-input-alist default-directory)
		tried (cadr (assoc buffer-file-name input-alist))) ;First guess

	  ;; If no masterfile in this dir, check the parent directory
	  ;; If no one there return nil ie. choose one yourself
	  (unless tried
	    (setq count (1+ count)
		  input-alist (append input-alist ; Add the refs for the parent dir
				      (munk-update-input-alist (parent-dir default-directory count)))
		  tried (cadr (assoc master input-alist)))) ; And check if there's a masterfile there

	  ;; If one is found in the main or parent dir look for the masterfile's master
	  (while tried
	    ;; Set the master file to the last candidate
	    (setq count-try (1+ count-try)
		  master tried
		  tried (cadr (assoc tried input-alist))) ;If no file inputs this one, it will return nil
	    
	    ;; Found a candidate, check the parent dir
	    (unless tried
	      (setq count (1+ count)
		    input-alist (append input-alist
					(munk-update-input-alist (parent-dir default-directory count)))
		    tried (cadr (assoc master input-alist)))) ;If this returns nil, the loop stops.

	    ;; FAILSAFE: Maximum length of the chain of files
	    (when (> count-try 15)
	      (setq tried nil))))
	
	;; Can't give relative paths to empty lists
	(when master					   
	  ;; Return the relative filename without filetype
	  (setq tried master
		master (file-relative-name
			(file-name-sans-extension master)))
	  
	  (unless (get-file-buffer tried)
	    (kill-buffer (find-file-noselect tried t)))

	  (message "The master file is: \"%s.tex\"" master))))

    ;; Store the alist for others to use
    (set (make-local-variable 'LaTeX-master-alist) input-alist)
    
    ;; Unless we just got our alist from another buffer, update the other alists
    (unless (= count-try 0)
      (let ((cur-buffer (current-buffer)))
	;; In the buffers visiting a file in the alist and the master, update the alist.
	(dolist (file `((,tried) ,@LaTeX-master-alist)) 
	  (when (get-file-buffer (car file))
	    (with-current-buffer (get-file-buffer (car file))
	      (set (make-local-variable 'LaTeX-master-alist)
		   (buffer-local-value 'LaTeX-master-alist cur-buffer)))))))
    ;; Set and return the master
    (setq TeX-master master)))

(provide 'munk-findmaster) 
