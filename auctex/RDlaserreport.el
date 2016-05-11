(TeX-add-style-hook "RDLaserreport"
 (lambda ()
    (LaTeX-add-bibliographies
     "RDLaserReport")
    (TeX-run-style-hooks
     "RDlaserreport_Preamble"
     "RDLaserReport_Introduction"
     "RDLaserReport_Characteristics"
     "RDLaserReport_SpectroscopyDoppler"
     "RDLaserReport_SpectroscopyBeat"
     "RDLaserReport_Damage")))

