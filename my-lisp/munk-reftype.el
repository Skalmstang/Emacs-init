(defun munk-reftype ()
  "Return the reference macro"
  (let ((refname (if (munk-capital-ref)
      (capitalize munk-reftype)
    munk-reftype)))
    (concat "\\" refname)))

(defun munk-format-ref (label def-fmt)
    (format "%s{%s}" (munk-reftype) label))

(defun munk-capital-ref ()
  "Returns t if point is at beginning of line or a period have been set
whitin the last 5 characters.

Returns nil otherwise.

This is used to determine if \\Fref or \\fref should be used in refTeX."
  ;; (unless (eq ?  (char-before (1- (point))))
  ;;   (insert " "))
  (save-excursion
    (let ((now-pos (point))
	  (line-beg (line-beginning-position)))
      (if (eq now-pos line-beg)
	  ;; Hvis point er ved begyndelsen af linien
	  (if (re-search-backward "^$" (1- line-beg) t) ; Tjek om linien inden point er tom.
	      t
	    ;; Hvis } eller . inden point
	    (if (re-search-backward "[}.]" (- now-pos 3) t) 
		(munk-forkort)))			      ; Er ordet inden . en forkortelse
	;; Hvis den ikke er ved begyndelsen af linien
	(if (search-backward "." (- now-pos 2) t)
	    (munk-forkort)
	  nil)))))

(defun munk-forkort ()
  "Checks if the word before the matched . is an abbrevation."
  (let ((word (buffer-substring (match-beginning 0) (progn		       ; Bestem ordet inden punktum
						      (skip-syntax-backward "w_") ; Bestem slutningen af ordet
						      (point)))))		       
    (unless (member word munk-forkort)					       ; Hvis den _ikke_ er forkortelse return t
      t)))

(provide 'munk-fref)
