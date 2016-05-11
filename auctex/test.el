(TeX-add-style-hook "test"
 (lambda ()
    (LaTeX-add-labels
     "cha:interaction-one-many")
    (TeX-add-symbols
     '("mybluebox" 1))
    (TeX-run-style-hooks
     "braket"
     "listliketab"
     "siunitx"
     "natbib"
     "square"
     "sort"
     "comma"
     "numbers"
     "nomencl"
     "nath"
     "unicode-math"
     "latex2e"
     "memoir11"
     "memoir"
     "english"
     "a4paper"
     "twoside"
     "article"
     "11pt"
     "fleqn")))

