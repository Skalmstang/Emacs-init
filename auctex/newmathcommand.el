(TeX-add-style-hook "newmathcommand"
 (lambda ()
    (TeX-add-symbols
     '("ground" 1)
     '("newmathcommand" 2)
     "transone"
     "transtwo"
     "transfull"
     "exited")
    (TeX-run-style-hooks
     "braket"
     "xspace"
     "amsmath"
     "luatextra"
     "xltxtra"
     "lmodern"
     "fontenc"
     "T1"
     "inputenc"
     "utf8"
     "iftex"
     "latex2e"
     "memoir11"
     "memoir"
     "english"
     "a4paper"
     "twoside"
     "article"
     "11pt")))

