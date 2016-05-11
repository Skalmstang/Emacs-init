(TeX-add-style-hook "microwave_master"
 (lambda ()
    (TeX-add-symbols
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
     "twocolumn"
     "article"
     "9pt"
     "microwave_abstract"
     "microwave_indledning"
     "microwave_tykkelse"
     "microwave_frekvens")))

