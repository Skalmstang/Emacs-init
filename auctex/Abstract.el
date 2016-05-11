(TeX-add-style-hook "Abstract"
 (lambda ()
    (LaTeX-add-labels
     "cha:abstract"
     "cha:resume")
    (TeX-run-style-hooks
     "danish")))

