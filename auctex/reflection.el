(TeX-add-style-hook "reflection"
 (lambda ()
    (LaTeX-add-labels
     "sec:benefits"
     "sec:liabilities"
     "sec:interfaces")
    (TeX-run-style-hooks
     "Interfaces")))

