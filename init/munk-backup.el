;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; always use copying to create backup files (don't clobber symlinks)
(setq backup-by-copying t)

;; number of newest versions to keep when a new numbered backup is made
(setq kept-new-versions 20)  ; Gemmer 20 nyeste kopier

;; Delete excess backups without confirmation
(setq delete-old-versions t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/.emacs_backups/")))
					; Skriver autosave fil til temp dir
					;"c:/Users/Munk/AppData/Local/Temp/" i skrivende stund
      auto-save-file-name-transforms  `((".*" ,temporary-file-directory t)))

;; auto-save every 200 input events
(setq auto-save-interval 200)

;; auto-save after 2 minutes seconds idle time
(setq auto-save-timeout 120)

(provide 'munk-backup)
