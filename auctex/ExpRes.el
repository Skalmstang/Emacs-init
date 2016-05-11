(TeX-add-style-hook "ExpRes"
 (lambda ()
    (LaTeX-add-labels
     "sec:final-setup-output"
     "pics:DDS"
     "pics:Marc"
     "fig:setup-pics"
     "dependence:amplitude"
     "dependence:frequency"
     "fig:dependence"
     "sec:normalization"
     "fig:non-norm"
     "sec:mw-spectrum"
     "eq:fit:MWSpectrum"
     "MW:early"
     "MW:final"
     "fig:MW1A"
     "fig:MW1a_dephased"
     "sec:rabi"
     "fig:Rabi:MW2"
     "fig:Rabi:dephasing"
     "sec:adiabatic-transfer"
     "fig:Adiabatic")
    (TeX-run-style-hooks
     "MWTable")))

