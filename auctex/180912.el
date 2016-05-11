(TeX-add-style-hook "180912"
 (lambda ()
    (LaTeX-add-environments
     "nadaindent")
    (LaTeX-add-labels
     "sec:modeling-choices")
    (TeX-add-symbols
     '("executeiffilenewer" 3)
     '("pdd" 2)
     '("pd" 2)
     '("dd" 2)
     '("paren" 1)
     '("abs" 1)
     '("stext" 1)
     "inv"
     "real"
     "complex"
     "integer"
     "includesvg"
     "fref"
     "oldphi"
     "oldepsilon"
     "svgwidth")
    (TeX-run-style-hooks
     "listings"
     "fancyref"
     "varioref"
     "xspace"
     "booktabs"
     "fixme"
     "draft"
     "siunitx"
     "mathtools"
     "amsfonts"
     "amssymb"
     "amsmath"
     "microtype"
     "soul"
     "graphicx"
     "inputenc"
     "UTF8"
     "fontenc"
     "T1"
     "babel"
     "english"
     "latex2e"
     "memoir12"
     "memoir"
     "a4paper"
     "12pt"
     "oneside"
     "openany"
     "onecolumn"
     "danish"
     "article")))

