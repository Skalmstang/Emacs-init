(TeX-add-style-hook "modeller"
 (lambda ()
    (LaTeX-add-labels
     "sec:modeller"
     "fig:lorentz"
     "fig:refractive"
     "sec:repair"
     "fig:twolevel"
     "fig:rabi")
    (TeX-run-style-hooks
     "./Figures/RabiFlopping")))

