(setq custom-file "~/.emacs.d/init/munk-custom.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-default-position nil)
 '(LaTeX-float nil)
 '(LaTeX-includegraphics-options-alist
   (quote
    ((0)
     (4)
     (5 trim)
     (16 height totalheight width scale angle origin bb viewport trim clip keepaspectratio page))))
 '(LaTeX-top-caption-list (quote ("table")))
 '(font-latex-match-function-keywords (quote (("includegraphics" "[{"))))
 '(font-latex-match-math-command-keywords
   (quote
    (("dmath" "{")
     ("dmath*" "{")
     ("dgroup" "{")
     ("dgroup*" "{"))))
 '(font-latex-match-reference-keywords
   (quote
    (("Fref" "{")
     ("fref" "{")
     ("cref" "{")
     ("Cref" "{")
     ("Vref" "{"))))
 '(font-latex-user-keyword-classes
   (quote
    (("Egne"
      (("fxfatal" "{")
       ("fixme" "{")
       ("fxnote" "{"))
      (:foreground "red")
      command))))
 '(ido-ignore-buffers (quote ("\\` " "output*" "*RefTex select*" "*fsm-debug*")))
 '(ido-ignore-directories
   (quote
    ("\\`CVS/" "\\`\\.\\./" "\\`\\./" "\\.git" "_region_\\.prv")))
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.aux" "\\.out" "\\.synctex" "_region_" "desktop\\.ini")))
 '(ido-work-directory-list-ignore-regexps (quote ("SetPointP")))
 '(preview-default-option-list (quote ("displaymath" "floats" "textmath" "footnotes")))
 '(safe-local-variable-values
   (quote
    ((TeX-engine . pdfLaTeX)
     (TeX-master . "Master")
     (TeX-master . "Masters")
     (TeX-master . t)
     (wcheck-language . "English")
     (eval munk-kill-newfile)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default)))
 '(font-latex-math-face ((((class color) (background dark)) (:foreground "SandyBrown"))))
 '(font-latex-sectioning-5-face ((t (:inherit variable-pitch :weight bold))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "green"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "red" :weight bold))))
 '(linum ((t (:inherit (shadow default) :background "gray10")))))

(provide 'munk-custom)
