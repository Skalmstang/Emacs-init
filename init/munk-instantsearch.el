;; ------------------------------------------------------------- [ FF Isearch ]
;; Start searching when entering characters
;; Pr. 04/05-2011 er det kun slået til i recentf.
(defvar isearch-initial-string nil)

;; Opdater søgestregen til `isearch-initial-string'
(defun isearch-set-initial-string ()
  "Updates the variables `isearch-string' and `isearch-message'"
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string
	isearch-message isearch-initial-string)
  (isearch-search-and-update))


;; Søger efter det tastede bogstav
(defun isearch-search-char (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the typed character."
  (interactive "P\np")
  ;; Sætter speciel backspace, nødvendig for kunne slette det først indtastede
  (define-key isearch-mode-map (kbd "<backspace>") 'isearch-backspace)
  (if regexp-p
      (isearch-forward regexp-p no-recursive-edit)
    (let ((invoke
	   ;; æøå returnerer en vektor i stedet for en streng, konverter den
	   (if (stringp (this-command-keys)) 
	       (this-command-keys)
	     (string (aref (this-command-keys) 0)))))
      (setq isearch-initial-string invoke)
      (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
      (condition-case nil
	  (isearch-forward regexp-p no-recursive-edit)
	;; Hvis bogstavet ikke kan findes, så fjern fra søgestrengen...
	(wrong-type-argument		
	 (setq isearch-initial-string "")
	 (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
	 (isearch-forward regexp-p no-recursive-edit))))))

(defun isearch-backspace ()
  "Speciel backspace command for when using `isearch-search-char'
Makes it possible to the delete the first char of the search string."
  (interactive)
  (let ((lngd (length isearch-string)))
    (cond ; normal delete...
     ((> lngd 1)
      (isearch-other-control-char))

     ;; Delete initial char; by exiting search, rewinding to start pos, and starting new search.
     ((= lngd 1)
      ;; Nu har vi brugt det specielle, slå tilbage
      (define-key isearch-mode-map (kbd "<backspace>") 'isearch-other-control-char)
      (isearch-exit)
      ;; isearch gemmer selv hvor den startede
      (let ((cmd (car isearch-cmds)))
	(goto-char (isearch-barrier-state cmd)))
      (isearch-forward))
     
     ;; Last resort; just do as always.
     (t
      (isearch-other-control-char)))))

(provide 'munk-instantsearch)
