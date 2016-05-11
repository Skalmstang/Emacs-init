(TeX-add-style-hook "mathtools"
 (lambda ()
    (LaTeX-add-environments
     '("spreadlines" 1)
     "multlined"
     "matrix"
     "pmatrix"
     "bmatrix"
     "Bmatrix"
     "vmatrix"
     "Vmatrix"
     "smallmatrix"
     "MT")
    (TeX-add-symbols
     '("crampedrlap" ["argument"] 0)
     '("crampedclap" ["argument"] 0)
     '("crampedllap" ["argument"] 0)
     '("cramped" ["argument"] 0)
     '("mathclap" ["argument"] 0)
     '("mathrlap" ["argument"] 0)
     '("mathllap" ["argument"] 0)
     '("MoveEqLeft" ["argument"] 0)
     '("smashoperator" ["argument"] 1)
     '("xmapsto" ["argument"] 1)
     '("xhookrightarrow" ["argument"] 1)
     '("xhookleftarrow" ["argument"] 1)
     '("xrightleftharpoons" ["argument"] 1)
     '("xleftrightharpoons" ["argument"] 1)
     '("xleftharpoonup" ["argument"] 1)
     '("xleftharpoondown" ["argument"] 1)
     '("xrightharpoonup" ["argument"] 1)
     '("xrightharpoondown" ["argument"] 1)
     '("xLeftrightarrow" ["argument"] 1)
     '("xRightarrow" ["argument"] 1)
     '("xLeftarrow" ["argument"] 1)
     '("xleftrightarrow" ["argument"] 1)
     '("splitdfrac" 2)
     '("splitfrac" 2)
     '("renewgathered" 4)
     '("newgathered" 4)
     '("prescript" 3)
     '("clap" 1)
     '("vdotswithin" 1)
     '("Aboxed" 1)
     '("adjustlimits" 6)
     '("renewcases" 6)
     '("newcases" 6)
     '("DeclarePairedDelimiter" 3)
     '("reDeclarePairedDelimiterInnerWrapper" 3)
     '("noeqref" 1)
     '("refeq" 1)
     '("usetagform" 1)
     '("renewtagform" 1)
     '("newtagform" 1)
     '("mathtoolsset" 1)
     "underbracket"
     "overbracket"
     "lparen"
     "rparen"
     "dblcolon"
     "coloneqq"
     "Coloneqq"
     "coloneq"
     "Coloneq"
     "eqqcolon"
     "Eqqcolon"
     "eqcolon"
     "Eqcolon"
     "colonapprox"
     "Colonapprox"
     "colonsim"
     "Colonsim"
     "g"
     "SwapAboveDisplaySkip"
     "MTFlushSpaceAbove"
     "MTFlushSpaceBelow"
     "nuparrow"
     "ndownarrow"
     "bigtimes"
     "mathmbox"
     "mathmakebox"
     "EQ"
     "forced"
     "upbracketfill"
     "upbracketend"
     "downbracketfill"
     "downbracketend"
     "underbrace"
     "overbrace"
     "vcentcolon"
     "ordinarycolon"
     "l"
     "DeclarePairedDelimiterX"
     "delimsize"
     "MHempty"
     "bgroup"
     "ArrowBetweenLines"
     "shortvdotswithin"
     "MH"
     "intertext"
     "MT")
    (TeX-run-style-hooks
     "graphicx"
     "amsmath"
     "mhsetup"
     "calc"
     "keyval")))

