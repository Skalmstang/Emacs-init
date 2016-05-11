(TeX-add-style-hook "QKD"
 (lambda ()
    (TeX-add-symbols
     '("green" 1)
     '("red" 1)
     '("blue" 1))
    (TeX-run-style-hooks
     "multirow"
     "bm"
     "amssymb"
     "amsmath"
     "mathrsfs"
     "pifont"
     "pgfarrows"
     "pgfnodes"
     "pgf"
     "color"
     "hyperref"
     "multimedia"
     "fontenc"
     "T1"
     "times"
     "inputenc"
     "latin1"
     "babel"
     "bbm"
     "graphicx"
     "latex2e"
     "beamer10"
     "beamer"
     "english"
     "compress"
     "fleqn")))

