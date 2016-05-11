(TeX-add-style-hook "_region_"
 (lambda ()
    (LaTeX-add-labels
     "sec:Mec-Prop"
     "fig:StrStr"
     "fig:stressStrain"
     "fig:shear")
    (TeX-run-style-hooks
     "Preamble")))

