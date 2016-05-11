(TeX-add-style-hook "nonlinearslides"
 (lambda ()
    (TeX-add-symbols
     '("ppdiff" ["argument"] 2)
     '("pdiff" ["argument"] 2)
     '("order" 1)
     '("idx" 1)
     '("paren" 1)
     '("dddiff" 2)
     '("ddiff" 2)
     "inv"
     "half")
    (TeX-run-style-hooks
     "listliketab"
     "url"
     "mathpazo"
     "sc"
     "pgfplots"
     "tikz"
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

