;; LaTeX setup
;; This is a cleaned up version with the thing being used. 
;; See .old for full edition

;; ------------------------------------------------------------- [ LaTeX keybinds ]
;; LaTeX specifikke keybinds
(defun munk-latex-init ()
  (local-set-key [f5] (tex-build-command-function "LaTeX" nil t))  ; f6:  Compile LaTeX file
  
  ;(local-set-key [f5] (tex-build-command-function "TeX-run-compile")) ;th3is hack
  (local-set-key [f6] (tex-build-command-function "View" nil t))   ; f7:  View output
  (local-set-key [f7] (tex-build-command-function "BibTeX" nil t))
  (local-set-key [S-f7] (tex-build-command-function "Nomenclature" nil t))
  (local-set-key "\C-ca" 'align)				     ; Bind align to `C-ca'
  (local-set-key [f11] 'TeX-next-error)                            ; f11: Goto next found LaTeX error
  (local-set-key [f12] 'TeX-previous-error)                            ; f11: Goto next found LaTeX error
  (local-set-key "{" 'TeX-insert-braces)                           ; { :  Indsætter {} med point imellem       
  (local-set-key "$" 'TeX-def-dollar)				   ; Upgraded insert dollar function
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

;; (defun th3is-tex-compile ()
;;   (tex-build-command-function "Nomenclature")
  
;;   (tex-build-command-function "BibTeX"))

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
			(?\C-d "partial_t" "" nil)
			;; (?\C-d "d{}{t}" "" nil)
			;;(?\C-D "mathrm{d}_t" "" nil)
			(?\C-m "mathcal" "" nil)
			(?o "theta" "" nil)
			(?O "Theta" "" nil)
			;;((kbd "M-d") "rightarrow" "" nil)
			(?+ "pm" "" nil)
			)
      )


;; EKSTRA custom commands:
(add-hook 'LaTeX-mode-hook (lambda()
			     ;; (local-set-key (kbd "½ C-S-e") (lambda() (interactive) (LaTeX-math-insert "sqrt")))
			     (local-set-key (kbd "½ M-p") (lambda() (interactive) (LaTeX-math-insert "propto")))
			     (local-set-key (kbd "½ M-h") (lambda() (interactive) (LaTeX-math-insert "hbar")))
			     (local-set-key (kbd "½ M-n") (lambda() (interactive) (LaTeX-math-insert "lap")))
			     (local-set-key (kbd "½ M-d") (lambda() (interactive) (LaTeX-math-insert "d{}{t}")))
			     (local-set-key (kbd "½ M-D") (lambda() (interactive) (LaTeX-math-insert "dd{}{t}")))
			     (local-set-key (kbd "½ <right>") (lambda() (interactive) (LaTeX-math-insert "rightarrow")))
			     (local-set-key (kbd "½ <S-right>") (lambda() (interactive) (LaTeX-math-insert "Rightarrow")))
			     (local-set-key (kbd "½ <left>") (lambda() (interactive) (LaTeX-math-insert "leftarrow")))
			     (local-set-key (kbd "½ <S-left>") (lambda() (interactive) (LaTeX-math-insert "Leftarrow")))
			     (local-set-key (kbd "½ M-<") (lambda() (interactive) (LaTeX-math-insert "ll")))
			     (local-set-key (kbd "½ M->") (lambda() (interactive) (LaTeX-math-insert "gg")))
			     (local-set-key (kbd "½ M-s") (lambda() (interactive) (LaTeX-math-insert "sum")))
			     (local-set-key (kbd "½ M-i") (lambda() (interactive) (LaTeX-math-insert "int")))		    
			     (local-set-key (kbd "½ =") (lambda() (interactive) (LaTeX-math-insert "equiv")))		    
			     ;; The following can be done with ½-c-<letter>
			     ;; (local-set-key (kbd "½ M-a") (lambda() (interactive) (LaTeX-math-insert "mathcal{a}")))
			     ;; (local-set-key (kbd "½ M-A") (lambda() (interactive) (LaTeX-math-insert "mathcal{A}")))
			     ;; (local-set-key (kbd "½ M-b") (lambda() (interactive) (LaTeX-math-insert "mathcal{b}")))
			     ;; (local-set-key (kbd "½ M-B") (lambda() (interactive) (LaTeX-math-insert "mathcal{B}")))
			     ;; (local-set-key (kbd "½ M-c") (lambda() (interactive) (LaTeX-math-insert "mathcal{c}")))
			     ;; (local-set-key (kbd "½ M-C") (lambda() (interactive) (LaTeX-math-insert "mathcal{C}")))
			     ;; (local-set-key (kbd "½ M-d") (lambda() (interactive) (LaTeX-math-insert "mathcal{d}")))
			     ;; (local-set-key (kbd "½ M-D") (lambda() (interactive) (LaTeX-math-insert "mathcal{D}")))
			     ;; (local-set-key (kbd "½ M-e") (lambda() (interactive) (LaTeX-math-insert "mathcal{e}")))
			     ;; (local-set-key (kbd "½ M-E") (lambda() (interactive) (LaTeX-math-insert "mathcal{E}")))
			     ;; (local-set-key (kbd "½ M-f") (lambda() (interactive) (LaTeX-math-insert "mathcal{f}")))
			     ;; (local-set-key (kbd "½ M-F") (lambda() (interactive) (LaTeX-math-insert "mathcal{F}")))
			     ;; (local-set-key (kbd "½ M-g") (lambda() (interactive) (LaTeX-math-insert "mathcal{g}")))
			     ;; (local-set-key (kbd "½ M-G") (lambda() (interactive) (LaTeX-math-insert "mathcal{G}")))
			     ;; (local-set-key (kbd "½ M-h") (lambda() (interactive) (LaTeX-math-insert "mathcal{h}")))
			     ;; (local-set-key (kbd "½ M-H") (lambda() (interactive) (LaTeX-math-insert "mathcal{H}")))
			     ;; (local-set-key (kbd "½ M-i") (lambda() (interactive) (LaTeX-math-insert "mathcal{i}")))
			     ;; (local-set-key (kbd "½ M-I") (lambda() (interactive) (LaTeX-math-insert "mathcal{I}")))
			     ;; (local-set-key (kbd "½ M-j") (lambda() (interactive) (LaTeX-math-insert "mathcal{j}")))
			     ;; (local-set-key (kbd "½ M-J") (lambda() (interactive) (LaTeX-math-insert "mathcal{J}")))
			     ;; (local-set-key (kbd "½ M-k") (lambda() (interactive) (LaTeX-math-insert "mathcal{k}")))
			     ;; (local-set-key (kbd "½ M-K") (lambda() (interactive) (LaTeX-math-insert "mathcal{K}")))
			     ;; (local-set-key (kbd "½ M-l") (lambda() (interactive) (LaTeX-math-insert "mathcal{l}")))
			     ;; (local-set-key (kbd "½ M-L") (lambda() (interactive) (LaTeX-math-insert "mathcal{L}")))
			     ;; (local-set-key (kbd "½ M-m") (lambda() (interactive) (LaTeX-math-insert "mathcal{m}")))
			     ;; (local-set-key (kbd "½ M-M") (lambda() (interactive) (LaTeX-math-insert "mathcal{M}")))
			     ;; (local-set-key (kbd "½ M-n") (lambda() (interactive) (LaTeX-math-insert "mathcal{n}")))
			     ;; (local-set-key (kbd "½ M-N") (lambda() (interactive) (LaTeX-math-insert "mathcal{N}")))
			     ;; (local-set-key (kbd "½ M-o") (lambda() (interactive) (LaTeX-math-insert "mathcal{o}")))
			     ;; (local-set-key (kbd "½ M-O") (lambda() (interactive) (LaTeX-math-insert "mathcal{O}")))
			     ;; (local-set-key (kbd "½ M-p") (lambda() (interactive) (LaTeX-math-insert "mathcal{p}")))
			     ;; (local-set-key (kbd "½ M-P") (lambda() (interactive) (LaTeX-math-insert "mathcal{P}")))
			     ;; (local-set-key (kbd "½ M-q") (lambda() (interactive) (LaTeX-math-insert "mathcal{q}")))
			     ;; (local-set-key (kbd "½ M-Q") (lambda() (interactive) (LaTeX-math-insert "mathcal{Q}")))
			     ;; (local-set-key (kbd "½ M-u") (lambda() (interactive) (LaTeX-math-insert "mathcal{u}")))
			     ;; (local-set-key (kbd "½ M-U") (lambda() (interactive) (LaTeX-math-insert "mathcal{U}")))
			     ;; (local-set-key (kbd "½ M-r") (lambda() (interactive) (LaTeX-math-insert "mathcal{r}")))
			     ;; (local-set-key (kbd "½ M-R") (lambda() (interactive) (LaTeX-math-insert "mathcal{R}")))
			     ;; (local-set-key (kbd "½ M-s") (lambda() (interactive) (LaTeX-math-insert "mathcal{s}")))
			     ;; (local-set-key (kbd "½ M-S") (lambda() (interactive) (LaTeX-math-insert "mathcal{S}")))
			     ;; (local-set-key (kbd "½ M-t") (lambda() (interactive) (LaTeX-math-insert "mathcal{t}")))
			     ;; (local-set-key (kbd "½ M-T") (lambda() (interactive) (LaTeX-math-insert "mathcal{T}")))
			     ;; (local-set-key (kbd "½ M-w") (lambda() (interactive) (LaTeX-math-insert "mathcal{w}")))
			     ;; (local-set-key (kbd "½ M-W") (lambda() (interactive) (LaTeX-math-insert "mathcal{W}")))
			     ;; (local-set-key (kbd "½ M-v") (lambda() (interactive) (LaTeX-math-insert "mathcal{v}")))
			     ;; (local-set-key (kbd "½ M-V") (lambda() (interactive) (LaTeX-math-insert "mathcal{V}")))
			     ;; (local-set-key (kbd "½ M-x") (lambda() (interactive) (LaTeX-math-insert "mathcal{x}")))
			     ;; (local-set-key (kbd "½ M-X") (lambda() (interactive) (LaTeX-math-insert "mathcal{X}")))
			     ;; (local-set-key (kbd "½ M-y") (lambda() (interactive) (LaTeX-math-insert "mathcal{y}")))
			     ;; (local-set-key (kbd "½ M-Y") (lambda() (interactive) (LaTeX-math-insert "mathcal{Y}")))
			     ;; (local-set-key (kbd "½ M-z") (lambda() (interactive) (LaTeX-math-insert "mathcal{z}")))
			     ;; (local-set-key (kbd "½ M-Z") (lambda() (interactive) (LaTeX-math-insert "mathcal{Z}")))
			     (local-set-key (kbd "½ H") (lambda() (interactive) (LaTeX-math-insert "hbar")))
			     ))
;; Don't append extra {} to macros
(setq TeX-insert-braces nil)

;; ------------------------------------------------------------- [ Wcheck language - Auto ]
(add-hook 'TeX-language-dk-hook (lambda () (wcheck-change-language "Danish")))
(add-hook 'TeX-language-en-hook (lambda () (wcheck-change-language "English")))

;; ------------------------------------------------------------- [ Instant compile ]
;(require 'munk-instant-compile)
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

(autoload 'munk-reftype "munk-reftype"
  "Returns t if point is at beginning of line or a period have been set
whitin the last 5 characters.

Returns nil otherwise.

This is used to determine if capitalized version of `munk-reftype'
 should be used in refTeX.")


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

;; (setq LaTeX-command "latex -synctex=1")


;; ------------------------------------------------------------- [ Math macro ]
;; Th3is: Add aditional math enviroments to $-ignore list: http://tex.stackexchange.com/questions/66321/auctex-how-to-enable-auto-expansion-of-sub-and-superscript-in-custom-math-envir
(custom-set-variables '(texmathp-tex-commands (quote (("empheq" env-on)))))
;; (custom-set-variables '(texmathp-tex-commands (quote (("tester" env-on)))))
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

;; Brug XeLaTeX til compiler
(setq TeX-engine 'xetex)

;; Altid PDF mode
(setq TeX-PDF-mode t)

;; Slår mathmode til automatisk
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Extra enviroments
(add-hook 'LaTeX-mode-hook 'add-my-latex-environments)
(defun add-my-latex-environments ()
  (LaTeX-add-environments '("empheq" LaTeX-env-label))
  )

;; Stop making labels for each equations
(defadvice LaTeX-item-equations (around activate)
  (LaTeX-item-equation)
  (indent))

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
