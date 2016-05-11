(TeX-add-style-hook "Assignment10_evaluering"
 (lambda ()
    (LaTeX-add-labels
     "cha:evaluering"
     "sec:diskussion"
     "sec:konklusion")
    (TeX-run-style-hooks
     "Assignment10_diskussion"
     "Assignment10_konklusion")))

