(defun pretty-greek ()
  (pretty-all)
  (let* ((greek '(;; Greek uppercase
		  ("Gamma" 67) ("Delta" 68) ("Theta" 72) ("Lambda" 75) ("Xi" 78) ("Pi" 80) ("Sigma" 83) ("Phi" 86) ("Psi" 88) ("Omega" 89) 
		  ;;lower starts after them
		  "alpha" "beta" "gamma" "delta" "epsilon" "zeta" "eta"
		  "theta" "iota" "kappa" "lambda" "mu" "nu" "xi" "pi"
		  "rho" "sigma_final" "sigma" "tau" "upsilon" "phi" "chi" "psi" "omega"))
	 pos word greek-char)
    (dolist (elt greek) 
      
      (if (not (consp elt))		; If not a upper case char
	  (setq pos (1+ pos)
		word elt)
	(setq word (car elt)
	      pos  (cadr elt)))
      
      (if (= pos 111)			; Ignoring omicron 
	  (setq pos 112))
      
      (setq greek-char (make-char 'greek-iso8859-7 pos)) ; getting the char number
      
      (if (= pos 89)			; Done with UC char, moving to sequiential LC
	  (setq pos 96))
      
      (font-lock-add-keywords nil
			      `((,(concat "\\(\\\\" word "\\)[a-zA-Z]") ; Notice the \ prefix, this is for LaTeX 
				 (0 (progn (decompose-region
					    (match-beginning 1)
					    (match-end 1))
					   nil)))))
      (font-lock-add-keywords nil 
			      `((,(concat "\\(\\\\" word "\\)[^a-zA-Z]")
				 (0 (progn (compose-region 
					    (match-beginning 1) 
					    (match-end 1)
					    ,greek-char) 
					   nil))))))))

;; God hjælp (insert (compose-string "." 0 1 '(?+ (tc . bc) ?o)))
(defun pretty-all ()
  (let* ((greek '(
		  
		  ;Set
		  ("cap" "∩") ("cup" "∪") ("forall" "∀") ("exists" "∃")
		  ("subseteq" "⊆") ("supseteq" "⊇") ;; ("in" "∈")
		  ;Symbols
		  ("infty" "∞")
		  ("half" "½") ("frac" '(?Ƒ (Br . cl) ?r))
		  ("dots" "…") ("ldots" "…") ("cdots" "⋯")

		  ;Mathcal
		  ("mathcal{E}" "ℰ") ("cE" "ℰ")
		  ("mathcal{L}" "ℒ")
		  ("mathcal{B}" "ℬ")
		  ("mathcal{F}" "ℱ")
		  ;Operators
		  ("times" "×") ("cdot" "•")
		  ("partial" "∂") ("pdiff" "∂") ("ppdiff" '(?∂ (cr . Bl) ?²)) ;("d" "∂")
		  ("nabla" "∇") ("lap" '(?∇ (Br . Bl) ?²))
		  ("sum" "∑") ("prod" "∏") 
		  ("pm" "±") ("mp" "∓")
		  ("Re" "ℝ")
		  ;Integrals
		  ("int" "∫") ("iint" "∬") ("oint" "∮") ("oiint" "∯")
		  ;Relations
		  ("leq" "≤") ("geq" "≥")
;		  ("ll" "≪" ) ("gg" "≫")
		  ("ll" "«") ("gg" "»")
		  ("sim" "∼") ("approx" "≈") ("simeq" "≃") ("approxeq" "≅")
		  ("propto" "∝") 
		  ("equiv" "≡") ("neq" "≠") 
		  ;Arrows
		  ("Leftarrow" "⇐") ("Rightarrow" "⇒") ("Leftrightarrow" "⇔")
		  ("leftarrow" "←") ("rightarrow" "→") ("leftrightarrow" "↔")

		  ;Physics
		  ("hbar" "ħ")
		  ;Others
		  ("item" "•")
		  ))
	 pos word greek-char)
    (dolist (elt greek) 
      
	(setq word (car elt)
	      pos  (cadr elt))
      
      
      (setq greek-char pos) ; getting the char number
      
      (font-lock-add-keywords nil
			      `((,(concat "\\(\\\\" word "\\)[a-zA-Z]") ; Notice the \ prefix, this is for LaTeX 
				 (0 (progn (decompose-region
					    (match-beginning 1)
					    (match-end 1))
					   nil)))))
      (font-lock-add-keywords nil 
			      `((,(concat "\\(\\\\" word "\\)[^a-zA-Z]")
				 (0 (progn (compose-region 
					    (match-beginning 1) 
					    (match-end 1)
					    ,greek-char) 
					   nil))))))))



(provide 'munk-prettygreek)
