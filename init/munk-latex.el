;; LaTeX setup
;; This is a cleaned up version with the thing being used. 
;; See .old for full edition

;; ------------------------------------------------------------- [ LaTeX keybinds ]
;; LaTeX specifikke keybinds
(defun munk-latex-init ()
  (local-set-key [f5] (tex-build-command-function "LaTeX" nil t))  ; f6:  Compile LaTeX file
  (local-set-key [f6] (tex-build-command-function "View" nil t))  ; f6:  Compile LaTeX file
  (local-set-key [f7] (tex-build-command-function "BibTeX" nil t))   ; f7:  View output
  (local-set-key [S-f7] (tex-build-command-function "Nomenclature" nil t))
  (local-set-key "\C-ca" 'align)				     ; Bind align to `C-ca'
  (local-set-key [f11] 'TeX-next-error)                            ; f11: Goto next found LaTeX error
  (local-set-key [f12] 'TeX-previous-error)                            ; f11: Goto next found LaTeX error
  (local-set-key "{" 'TeX-insert-braces)                           ; { :  Indsætter {} med point imellem       
  (local-set-key "$" 'TeX-def-dollar)				   ; Upgraded insert dollar function
  (local-set-key "*" 'munk-latex-star)                             ; \cdot first then a *
  (local-set-key "\C-c\C-p\C-p" 'preview-under-point)		   ; dwim whit preview at point
  (when TeX-PDF-mode
    (local-set-key [f8]  'sumatra-jump-to-line))                  ; f8:  Forwardsearch hvis PDF mode aktivt
  ;; Unbinds
  ;; C-c C-r: Tidligere bundet til TeX-command-region. Frigør pladsen til recentf
  (local-unset-key "\C-c\C-r"))

;; Definer binds, når LaTeX-mode starter. Lavet sådan pga. AUCTeX autoloader

(add-hook 'LaTeX-mode-hook 'munk-latex-init)

;; Th3is hack
;;nomenclature for latex
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list 
                '("Nomenclature" "makeindex %s.nlo -s nomencl.ist -o %s.nls"
                  (lambda (name command file)
                    (TeX-run-compile name command file)
                    (TeX-process-set-variable file 'TeX-command-next TeX-command-default))
                  nil t :help "Create nomenclature file")))

;; ------------------------------------------------------------- [ Math mode ]

;; Ændrer math-prefix til ½
(setq LaTeX-math-abbrev-prefix "½")

;; Indsætter frac{}{} med `½-f'
(setq LaTeX-math-list '((?7 "frac" "" nil) 
			(?/ "frac" "" nil) 
                        (?\C-a "sqrt" "" nil) 
			;; (
			;; (?, "phi" "" nil) 
			(?\C-k "ket" "" nil)
			(?\C-b "bra" "" nil)
			((kbd "C-S-d") "partial" "" nil)
			(?+ "pm" "" nil)
			)
      )

(add-hook 'LaTeX-mode-hook (lambda()
			     ;; (local-set-key (kbd "½ H-e") (lambda() (interactive) (LaTeX-math-insert "partial")))
			     (local-set-key (kbd "½ M-h") (lambda() (interactive) (LaTeX-math-insert "hbar")))
			     (local-set-key (kbd "½ M-a") (lambda() (interactive) (LaTeX-math-insert "approx")))
			     (local-set-key (kbd "½ <right>") (lambda() (interactive) (LaTeX-math-insert "rightarrow")))
			     (local-set-key (kbd "½ <S-right>") (lambda() (interactive) (LaTeX-math-insert "Rightarrow")))
			     (local-set-key (kbd "½ <left>") (lambda() (interactive) (LaTeX-math-insert "leftarrow")))
			     (local-set-key (kbd "½ <S-left>") (lambda() (interactive) (LaTeX-math-insert "Leftarrow")))
			     (local-set-key (kbd "½ M-<right>") (lambda() (interactive) (LaTeX-math-insert "Leftrightarrow")))
			     (local-set-key (kbd "½ M-<left>") (lambda() (interactive) (LaTeX-math-insert "Leftrightarrow")))
			     (local-set-key (kbd "½ M-d") (lambda() (interactive) (LaTeX-math-insert "partial")))
			     (local-set-key (kbd "½ M-t") (lambda() (interactive) (LaTeX-math-insert "dagger")))
			     (local-set-key (kbd "½ M-s") (lambda() (interactive) (LaTeX-math-insert "sum")))
			     ))


;; Don't append extra {} to macros
(setq TeX-insert-braces nil)

;; ------------------------------------------------------------- [ Super star ]
(defun munk-latex-star ()
  "Inserts \\cdot when issued once, else it inserts a *"
  (interactive)
  (if (and (equal this-command last-command)
	   (looking-back "\\\\cdot" (- (point) 5)))
      (progn (delete-char -5)
	     (insert "*"))
    (insert "\\cdot")))

;; ------------------------------------------------------------- [ Instant compile ]
;(try-require 'munk-instant-compile)
;(add-hook 'LaTeX-mode-hook 'instant-compile-mode)

;; ------------------------------------------------------------- [ Font locking ]
(setq font-latex-match-warning-keywords '("fixme" "fxfatal"))

(add-hook 'TeX-update-style-hook 'pretty-greek)

(autoload 'pretty-greek "munk-prettygreek"
  "Display greek letter macros as greek letters")

;; ------------------------------------------------------------- [ Def dollar ]
;; Udvider AUCTeX så når der trykkes $ indsættes $$ med musen imellem.
(autoload 'TeX-def-dollar "munk-def-dollar" "" t)

;; ------------------------------------------------------------- [ R/r-ef check ]
;; Afgør om point er i begyndelsen af en sætning
(defvar munk-forkort
  '("etc" "ca" "mm" "osv" "bla" "evt" "f.eks" "dvs" "vha" "mht" "fx" "bl.a" "fx")
  "The abbrevations that `munk-capital-ref' should recognize.")

(defvar munk-reftype
  "cref"
  "The reference macro to use")

(autoload 'munk-format-ref "munk-reftype"
  "Returns t if point is at beginning of line or a period have been set
whitin the last 5 characters.

Returns nil otherwise.

This is used to determine if capitalized version of `munk-reftype'
 should be used in refTeX.")

(setq reftex-format-ref-function 'munk-format-ref)




;; ------------------------------------------------------------- [ Find master ]
;; Find the master file

(add-hook 'LaTeX-mode-hook 'munk-master)
(autoload 'munk-master "munk-findmaster"
  "Returns the master-file for this LaTeX document.
If document contains \\documentclass{ it is considered the masterfile.
Else find the .tex file no else is linking to.")

;; ------------------------------------------------------------- [ Fast build ]
;; Compiler Latex filen uden at spørge om man vil gemme
(defun tex-build-command-function (cmd &optional recenter-output-buffer
				       save-buffer override-confirm)
  "Build a TeX-command function."
  
  ` (lambda()
      (interactive)
      (when , save-buffer (save-buffer))
      (when , recenter-output-buffer (TeX-recenter-output-buffer nil))
      (TeX-command , cmd 'TeX-master-file (if , override-confirm 1 -1))))

;; ------------------------------------------------------------- [ Forward search ]
;; Loader forward-search første gang der trykkes f8
(autoload 'sumatra-jump-to-line "sumatra-forward" t)

;; (setenv "PATH" (concat (getenv "PATH") path-separator "C:/Program Files (x86)/SumatraPDF"))
;; (setq exec-path (add-to-list 'exec-path "C:/Program Files (x86)/SumatraPDF"))

(setq LaTeX-command "latex -synctex=-1")

;; ------------------------------------------------------------- [ Math macro ]
;; Insert $ when inserting from the math menu outside math environment.
(setq TeX-insert-braces nil)

(eval-after-load 'latex
  '(defun LaTeX-math-insert (string &optional dollar)
     "Insert \\STRING{}. Put $'s around it if not in mathmode."
     (let* ((math-p (texmathp))
	    (region-p (region-active-p))
	    (region-lr (and region-p (equal (point) (region-end)))))
       (unless  math-p
	 (unless region-lr
	   (insert "$")))
       (funcall LaTeX-math-insert-function string)
       (unless  math-p
	 (when region-lr
	   (goto-char (prog1
			  (point)
			(search-backward "\\")
			(insert "$"))))
	 (cond
	  ((looking-at "}")
	   (goto-char (prog1
			  (point)
			(skip-syntax-forward "()" (+ (point) 3))
			(insert "$"))))
	  (t
	   (insert "$"))))
       (when (and region-p (looking-back "\\$\\|}"))
	 (skip-syntax-backward "$)"))))
  )

(defadvice LaTeX-item-equations (around activate)
  (LaTeX-item-equation)
  (indent))
;; ---------------------------------------------------------------------------------
;; ------------------------------------------------------------- [ AUCTeX & RefTeX ]
;; ---------------------------------------------------------------------------------

;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)

;; Customization for a Directory directory containing automatically generated TeX information. Must
;; end with a slash
(setq TeX-auto-global
      "~/.emacs.d/auctex/")

;; Customization for a Directory directory containing automatically generated TeX information. Must
;; end with a slash
(setq TeX-auto-local
      "~/.emacs.d/auctex/")

;; Turn on RefTeX for LaTeX documents.
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; Just append the Ref minor to the main mode
(eval-after-load 'reftex
  '(diminish 'reftex-mode "R"))

;; Til AUCTeX autocomplete
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; Slår automatisk reftex til
(setq reftex-plug-into-AUCTeX t)

;; Altid PDF mode
(setq TeX-PDF-mode t)

;; Slår mathmode til automatisk
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Equation er default
(setq LaTeX-default-environment "equation")

;; Korrekt filling
(setq LaTeX-fill-break-at-separators (quote ({ } \[ \\\( \\\) \\\[ \\\])))


;; Leder kun efter billeder masterfilens undermapper
(setq LaTeX-includegraphics-read-file 'LaTeX-includegraphics-read-file-relative)

;; Indsætter automatisk {} når der indsættes ^ eller _ i math.
(setq TeX-electric-sub-and-superscript t)

;; Indsætter {} efter en indsat macro
(setq TeX-insert-braces t)

;; Størrelse af formler
(setq preview-scale-function 1.75)

(eval-after-load 'preview
  '(add-to-list 'preview-inner-environments "tabular"))

;; Enter laver ny linie og indrykker den
(setq TeX-newline-function (quote newline-and-indent))


(provide 'munk-latex)
