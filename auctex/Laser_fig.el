(TeX-add-style-hook "Laser_fig"
 (lambda ()
    (LaTeX-add-labels
     "cha:ethalon-opstilling"
     "fig:ethalonOpstilling"
     "cha:mult-stral"
     "cha:reflektivitet"
     "fig:reflek"
     "cha:bolg-m.-gitt"
     "fig:wavelength"
     "cha:gitterdata"
     "fig:wavelengthPlot"
     "cha:langdeudviddelse"
     "fig:udv"
     "cha:brydningsindeks"
     "fig:brydningsindeks")
    (TeX-add-symbols
     '("paren" 1)
     '("pddd" 2)
     '("pdd" 2)
     '("pd" 2)
     '("dd" 2))
    (TeX-run-style-hooks
     "threeparttable"
     "flushleft"
     "wasysym"
     "cleveref"
     "microtype"
     "hyperref"
     "mhchem"
     "siunitx"
     "mathtools"
     "graphicx"
     "inputenx"
     "utf8x"
     "babel"
     "latex2e"
     "memoir10"
     "memoir"
     "danish"
     "a4paper"
     "oneside"
     "article"
     "9pt")))

