(TeX-add-style-hook "tex"
 (lambda ()
    (TeX-add-symbols
     "firma")
    (TeX-run-style-hooks
     "hyperref"
     "booktabs"
     "multicol"
     "luatextra"
     "unicode-math"
     "lmodern"
     "fontenc"
     "T1"
     "inputenc"
     "utf8"
     "iftex"
     "babel"
     "latex2e"
     "letter10"
     "letter"
     "danish"
     "10pt")))

