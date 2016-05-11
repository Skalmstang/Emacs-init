;; Setup the system enviroments depending on dropbox or google drive location
; Set "HOME" enviroment
(setenv "HOME" (substring data-directory 0 -4))
(message "HOME set to: %s" (substring data-directory 0 -4)) 

; Search for system folder where all my portable programs are located
(defvar Theis-PATH (substring data-directory 0 (string-match "/System/" data-directory)))

; Define function that add the previously forund dir prefix to a list of program directories
(defun Theis-add-dir-prefix (list)
  (mapcar #'(lambda (x) (concat Theis-PATH x)) list)
  )

; Define my list of programs that is portable
(setq Theis-dir-list (list
		      "/System/Programmer/gs/gs8.64/bin"
		      "/System/Programmer/GNU/diff/bin"
		      "/System/Programmer/SumatraPDF"
		      "/System/Programmer/InkscapePortable/App/Inkscape"
		      "/System/Programmer/GNU/gnutls/bin"
		      "/System/Programmer/GNU/gnupg"
		      "/System/Programmer/7-Zip/App/7-Zip64"
		      "/System/Programmer/MikTex/miktex/bin"))

; Make a whole list of the portable programs with directory prefix and programs with static directory
(setq Theis-dir-list (append (Theis-add-dir-prefix Theis-dir-list) (list
							      "C:/texlive/2011/bin/win32" ;Not nesessary when using MikTex
							      "C:/Program Files/Java/jdk1.7.0_03/bin")))

; Make one string of the directories seperated by ";"
(let ((result ""))
  (dolist (item Theis-dir-list)
    (setq result (concat result item ";"))
    )
  (setq Theis-PATH result)
  )

; Set "PATH" enviroment
(setenv "PATH" Theis-PATH)

(message "PATH set to: %s" Theis-PATH) 

(provide theis-site-start)
