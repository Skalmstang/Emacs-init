(TeX-add-style-hook "cd"
 (lambda ()
    (LaTeX-add-labels
     "sec:crystal-structures"
     "sec:mech-prop-solids"
     "sec:therm-prop-latt"
     "sec:electr-prop-metals"
     "sec:electr-prop-metals-1"
     "sec:semiconductors"
     "sec:magnetism"
     "sec:dielectrics"
     "sec:superconductivity")
    (TeX-run-style-hooks
     "Preamble"
     "cs")))

