(TeX-add-style-hook "autonum"
 (lambda ()
    (TeX-add-symbols
     "string"
     "csxdefaux"
     "csxdefall"
     "vanishprotect"
     "ifcsedef"
     "skipInPDFTOC")
    (TeX-run-style-hooks
     "letltxmacro"
     "textpos"
     "absolute"
     "amsmath"
     "etoolbox")))

