(TeX-add-style-hook "mangan_master"
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
     "mangan_abstract"
     "mangan_indledning"
     "mangan_kalib_e"
     "mangan_kalib_i"
     "mangan_produkt"
     "mangan_vanadium"
     "mangan_mn56")))

