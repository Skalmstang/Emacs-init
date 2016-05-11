(TeX-add-style-hook "EL_master"
 (lambda ()
    (TeX-add-symbols
     '("pddd" 2)
     '("pdd" 2)
     '("pd" 2)
     '("dd" 2)
     '("ott" 1))
    (TeX-run-style-hooks
     "fixme"
     "threeparttable"
     "flushleft"
     "multirow"
     "wasysym"
     "cleveref"
     "microtype"
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
     "EL_abstract"
     "EL_indledning"
     "EL_noter"
     "EL_generator"
     "EL_modulus"
     "EL_syvsegment"
     "EL_data"
     "EL_bilag")))

