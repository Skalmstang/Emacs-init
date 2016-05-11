(TeX-add-style-hook "LaserDisp-Layout"
 (lambda ()
    (TeX-add-symbols
     '("order" 1))
    (TeX-run-style-hooks
     "LaserDisp-Frontpage"
     "LaserDisp-Modeller"
     "LaserDisp-CW"
     "LaserDisp-PL"
     "LaserDisp-DL"
     "LaserDisp-BeamProp"
     "LaserDisp-Resonator"
     "LaserDisp-Nonlinear")))

