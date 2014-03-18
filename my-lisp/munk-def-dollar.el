;; ------------------------------------------------------------- [ Def dollar ]
;; Udvider AUCTeX så når der trykkes $ indsættes $$ med musen imellem.
(defun TeX-def-dollar ()
  (interactive)
  (cond
   ((TeX-escaped-p)
    ;; This is escaped with `\', so just insert one.    
    (insert "$"))
   ((region-active-p)
    ;; When region is selected insert $ around
    (let ((start (region-beginning))
	  (end (region-end)))
      (goto-char start)
      (skip-syntax-forward " ")
      (insert "$")
      (goto-char (1+ end))
      (skip-syntax-backward " ") 
      (insert "$")))
   ((texmathp)
    ;; We are inside math mode
    (if (and (stringp (car texmathp-why))
	     (string-equal (substring (car texmathp-why) 0 1) "\$"))
	(insert "$")
      (message "Math mode started with `%s' cannot be closed with dollar"
	       (car texmathp-why))))
   (t
    ;; In all other scenarios insert $$ and set between.
    (insert "$$")
    (backward-char 1))))

(provide 'munk-def-dollar)