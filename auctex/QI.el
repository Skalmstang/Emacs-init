(TeX-add-style-hook "QI"
 (lambda ()
    (TeX-add-symbols
     '("ppdiff" ["argument"] 2)
     '("pdiff" ["argument"] 2)
     '("order" 1)
     '("idx" 1)
     '("paren" 1)
     '("ketbra" 2)
     '("sqparen" 1)
     '("dddiff" 2)
     '("ddiff" 2)
     '("slfrac" 2)
     "starbreak"
     "inv"
     "half"
     "ORIincludegraphics")
    (TeX-run-style-hooks
     "biblatex"
     "csquotes"
     "fourier-orns"
     "mathpazo"
     "sc"
     "libertine"
     "sf"
     "autonum"
     "braket"
     "graphicx"
     "pgfplots"
     "tikz"
     "url"
     "cleveref"
     "siunitx"
     "mhchem"
     "microtype"
     "booktabs"
     "bm"
     "mathtools"
     "amsthm"
     "amsmath"
     "xspace"
     "babel"
     "english"
     "fontenc"
     "T1"
     "inputenc"
     "utf8"
     "latex2e"
     "beamer10"
     "beamer"
     "smaller")))

