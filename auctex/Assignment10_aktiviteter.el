(TeX-add-style-hook "Assignment10_aktiviteter"
 (lambda ()
    (LaTeX-add-labels
     "cha:aktiviteter"
     "sec:stack-aktivitet"
     "sec:fysisk-aktivitet"
     "sec:Observationer")
    (TeX-run-style-hooks
     "Assignment10_aktivitet_papir"
     "Assignment10_aktivitet_fysisk")))

