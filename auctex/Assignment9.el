(TeX-add-style-hook "Assignment9"
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
     "Assignment9_ramme"
     "Assignment9_peerSupervision"
     "Assignment9_erfaringer")))

