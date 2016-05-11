(setq custom-file "~/.emacs.d/init/munk-custom.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-amsmath-label "eq:")
 '(LaTeX-default-position nil)
 '(LaTeX-float nil)
 '(LaTeX-includegraphics-options-alist (quote ((0) (4) (5 trim) (16 height totalheight width scale angle origin bb viewport trim clip keepaspectratio page))))
 '(LaTeX-math-abbrev-prefix "½")
 '(LaTeX-top-caption-list (quote ("table")))
 '(TeX-command-list (quote (("Nomenclature" "makeindex %s.nlo -s nomencl.ist -o %s.nls" (lambda (name command file) (TeX-run-compile name command file) (TeX-process-set-variable file (quote TeX-command-next) TeX-command-default)) nil t :help "Create nomenclature file") ("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (plain-tex-mode texinfo-mode ams-tex-mode) :help "Run plain TeX") ("LaTeX" "%`%l%(mode)%' %t -synctex=1" TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX") ("Makeinfo" "makeinfo %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with Info output") ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil (texinfo-mode) :help "Run Makeinfo with HTML output") ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil (ams-tex-mode) :help "Run AMSTeX") ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt once") ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil (context-mode) :help "Run ConTeXt until completion") ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX") ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer") ("Print" "%p" TeX-run-command t t :help "Print the file") ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command) ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file") ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file") ("Check" "lacheck %s" TeX-run-compile nil (latex-mode) :help "Check LaTeX file for correctness") ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document") ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files") ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files") ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(TeX-view-program-list (quote (("SumatraPDF" "SumatraPDF -reuse-instance %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and start") (output-dvi "Yap") (output-pdf "SumatraPDF") (output-html "start"))))
 '(font-latex-match-function-keywords (quote (("includegraphics" "[{"))))
 '(font-latex-match-math-command-keywords (quote (("dmath" "{") ("dmath*" "{") ("dgroup" "{") ("dgroup*" "{"))))
 '(font-latex-match-reference-keywords (quote (("Fref" "{") ("fref" "{") ("cref" "{") ("Cref" "{") ("Vref" "{"))))
 '(font-latex-math-environments (quote ("display" "displaymath" "equation" "eqnarray" "gather" "multline" "align" "alignat" "xalignat" "empheq")))
 '(font-latex-user-keyword-classes (quote (("Egne" (("fxfatal" "{") ("fixme" "{")) (:foreground "red") command))))
 '(ido-ignore-buffers (quote ("\\` " "output*" "*RefTex select*" "*fsm-debug*")))
 '(ido-ignore-directories (quote ("\\`CVS/" "\\`\\.\\./" "\\`\\./" "\\.git" "_region_\\.prv")))
 '(ido-ignore-files (quote ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.aux" "\\.out" "\\.synctex" "_region_" "desktop\\.ini")))
 '(ido-work-directory-list-ignore-regexps (quote ("SetPointP")))
 '(preview-default-option-list (quote ("displaymath" "floats" "textmath" "footnotes")))
 '(safe-local-variable-values (quote ((TeX-master . true) (TeX-Engine . default) (wcheck-mode . "English") (wcheck-mode . t) (wcheck-mode . true) (wcheck-mode . 1) (wcheck-mode . on) (wcheck-mode . enabled) (wcheck-language . "English") (TeX-master . master) (eval prefer-coding-system (quote utf-8)) (wcheck-language . "Danish") (eval munk-kill-newfile))))
 '(texmathp-tex-commands (quote (("empheq" env-on)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-math-face ((((class color) (background dark)) (:foreground "SandyBrown"))))
 '(font-latex-sectioning-5-face ((t (:inherit variable-pitch :weight bold))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "green"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "red" :weight bold))))
 '(linum ((t (:inherit (shadow default) :background "gray10")))))

(provide 'munk-custom)
