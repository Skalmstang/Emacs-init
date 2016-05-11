(TeX-add-style-hook "Rapport"
 (lambda ()
    (LaTeX-add-labels
     "eq:provespole"
     "sec:enkeltspole"
     "eq:enkeltspole"
     "sec:helmholtzspole"
     "sec:anti-helmholtzspole"
     "fig:opstilling"
     "tab:afledte"
     "fig:helm")
    (TeX-run-style-hooks
     "preamble"
     "Abstract"
     "../Matlab/Enkeltspole"
     "../Matlab/Helmholtz"
     "../Matlab/Anti-Helmholtz")))

