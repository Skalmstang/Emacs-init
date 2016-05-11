(TeX-add-style-hook "AMOII_Disp-Layout"
 (lambda ()
    (LaTeX-add-labels
     "cha:interaction-weak-rates"
     "cha:interaction-selection")
    (TeX-run-style-hooks
     "AMOII_Disp-Frontpage"
     "AMOII_Disp-InteractionWeakRates"
     "AMOII_Disp-InteractionSelection")))

