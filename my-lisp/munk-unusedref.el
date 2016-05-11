
(defun munk-find-unused-ref ()
  (unless (fboundp 'reftex-all-document-files)
    (error "RefTeX must be loaded"))

  (message "-------------------\n Begin: \n-----------------")
  (let ((files (reftex-all-document-files))
	(label (make-hash-table :test 'equal))
	(ref (make-hash-table :test 'equal))
	map unused)
    (with-temp-buffer

      (dolist (file files)

	;; Replace the content in the temp buffer with the file content
	;; Don't apply major mode etc.
	(if (not (get-file-buffer file))
	    (insert-file-contents-literally file nil nil nil t)
	  ;; If a buffer is visiting that file, search the buffer.
	  ;; It might contain unsaved inputs
	  (delete-region (point-min) (point-max))
	  (insert-buffer-substring-no-properties (get-file-buffer file)))

	(goto-char (point-min))

	(while (search-forward-regexp "\\(?:\\(label\\)\\|\\(ref\\)\\){\\([^ }]+\\)" nil t)
	  (setq map  (if (match-string 1)
			 label
		       ref))
	(puthash (match-string 3) t map)))

    (setq test ref)

    (maphash (lambda (key value)
	       (unless (gethash key ref nil)
		 (setq unused (cons key unused))))
	     label)
    (sort unused 'string<)
    (munk-display-unused unused)
    )))

(defun munk-display-unused (unused)
  (switch-to-buffer "*Unused result*")
  (dolist (keys unused)
    (insert (pop unused))
    (newline)))





