(TeX-add-style-hook "pdfeasy"
 (lambda ()
    (TeX-add-symbols
     '("DOI" 1)
     '("myaddlinetocontents" 3)
     '("myaddtocontents" 5)
     '("mymapleplot" 1)
     "pdfoutput")
    (TeX-run-style-hooks
     "hyperref"
     "linktocpage"
     "colorlinks")))

