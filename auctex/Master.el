(TeX-add-style-hook "Master"
 (lambda ()
    (LaTeX-add-bibliographies
     "Bachelor")
    (LaTeX-add-labels
     "cha:introduction"
     "cha:theory"
     "cha:experimental"
     "cha:experimental-results"
     "cha:evaluation"
     "app:c++"
     "app:labview")
    (TeX-run-style-hooks
     "preamble"
     "Frontpage"
     "Abstract"
     "Introduction"
     "BEC"
     "twolevel"
     "DDS"
     "ExpInt"
     "Software"
     "ExpRes"
     "Outlook")))

