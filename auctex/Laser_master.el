(TeX-add-style-hook "Laser_master"
 (lambda ()
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
     "twocolumn"
     "article"
     "9pt"
     "Laser_abstract"
     "Laser_Indledning"
     "Laser_Ethalon"
     "Laser_WaveLength"
     "Laser_Michelsson"
     "Laser_OpticalMedia")))

