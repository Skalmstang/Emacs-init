(TeX-add-style-hook "software"
 (lambda ()
    (LaTeX-add-labels
     "sec:software"
     "fig:softArch"
     "sec:labview"
     "sec:c++-interface"
     "fig:UML"
     "sec:simple-use"
     "sec:advanced-use"
     "sec:algorithms"
     "eq:deltaAmp:round"
     "eq:deltaTime:round"
     "eq:deltaFreq:round"
     "sec:issues"
     "sec:profiles-sweeps")
    (TeX-run-style-hooks
     "sweepAlg")))

