(TeX-add-style-hook "DSD2"
 (lambda ()
    (TeX-add-symbols
     '("ppdiff" ["argument"] 2)
     '("pdiff" ["argument"] 2)
     '("order" 1)
     '("idx" 1)
     '("paren" 1)
     '("dddiff" 2)
     '("ddiff" 2)
     "starbreak"
     "inv"
     "half"
     "ORIincludegraphics")
    (TeX-run-style-hooks
     "fourier-orns"
     "listings"
     "siunitx"
     "microtype"
     "mathpazo"
     "sc"
     "libertine"
     "sf"
     "graphicx"
     "pgfplots"
     "tikz"
     "url"
     "cleveref"
     "fixme"
     "draft"
     "xparse"
     "mathtools"
     "amssymb"
     "amsmath"
     "babel"
     "fontenc"
     "T1"
     "inputenc"
     "utf8"
     "latex2e"
     "memoir10"
     "memoir"
     "a4paper"
     "oneside"
     "article"
     "danish"
     "DSD2_Opgave5"
     "DSD2_Opgave6"
     "DSD2_Opgave7"
     "DSD2_Opgave8")))

