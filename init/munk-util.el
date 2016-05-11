;; ------------------------------------------------------------- [ Save-excursion ]
(defmacro limited-save-excursion (&rest subexprs)
  "Like save-excursion, but only restores point."
  (let ((orig-point-symbol (make-symbol "orig-point")))
    `(let ((,orig-point-symbol (point-marker)))
       (unwind-protect
	   (progn ,@subexprs)
	 (goto-char ,orig-point-symbol)))))

;; ------------------------------------------------------------- [ Parent dir ]
(defun parent-dir (dir &optional N)
  "Return the N'th parent directory of DIR.
If N isn't provided just return the parent directory."
  (if (not N)
      (file-name-directory (substring dir 0 -1))
    (dotimes (i N dir)
      (setq dir (file-name-directory (substring dir 0 -1))))))


;; ------------------------------------------------------------- [ init-compile ]
;; Compiler automatisk .emacs. Tjekker kun buffer i emacs-lisp-mode om filen er init.
;; Der bruges to hooks, så kun elisp filer tjekkes

;; Loader kun byte-compileren, hvis der skal compiles.
(autoload 'byte-compile-file "bytecomp")

;; Er det init-filen eller en fra init mappen så compile når bufferen lukkes og slet .elc file når der gemmes
(defun munk-emacs-lisp-mode-hook ()
  "If it's the init-file, then hook byte-compile-user-init-file to kill-buffer-hook
and munk-delete-init-elc to after-save-hook"
  (when (and (and buffer-file-name (string-match "el$" buffer-file-name))
	     (or (equal buffer-file-name user-init-file)
		 (member buffer-file-name (directory-files "~/.emacs.d/init" t))))
    (add-hook 'kill-buffer-hook 'byte-compile-user-init-file t t)
    (add-hook 'after-save-hook  'munk-delete-init-elc t t)))

;; Hvis jeg er i elisp-mode slå custom hook til.
(add-hook 'emacs-lisp-mode-hook 'munk-emacs-lisp-mode-hook)

(defun munk-delete-init-elc ()
  "If there exist a compiled init-file - delete it."
  (when (and (file-exists-p (concat buffer-file-name "c"))
	     (or (equal buffer-file-name user-init-file)
		 (member buffer-file-name (directory-files "~/.emacs.d/init" t))))
    (delete-file (concat buffer-file-name "c"))))

(defun  byte-compile-user-init-file ()
  "Tjekker om .emacs er nyere end .emacs.elc og compiler i såfald"
  (interactive)
  (if (and (or (string-equal buffer-file-name user-init-file)       ;; Nødvendig ellers uendeligt loop
	       (member buffer-file-name (directory-files "~/.emacs.d/init" t)))
	   (file-newer-than-file-p buffer-file-name (concat buffer-file-name "c")))
      (let ((byte-compile-warnings '(unresolved)) ;; Shh...
	    (font-lock-verbose nil)               ;; Slår font-locking fra i compile loggen
	    (byte-compile-verbose nil))           ;; Noget der optimerer
	(byte-compile-file buffer-file-name))))

;; Bruges af startup message
(defun munk-compile-init-files-maybe ()
  "Compiles `user-init-file' and the .el files in ~/.emacs.d/init if they are not
the latest version.
Returns nil if not all are compiled. Returns t otherwise"
  (interactive)
  (let ((byte-compile-warnings '(unresolved)) ;; Shh...
	(font-lock-verbose nil)               ;; Slår font-locking fra i compile loggen
	(byte-compile-verbose nil)            ;; Noget der optimerer
	(compiled t))
    (dolist (file (append (directory-files "~/.emacs.d/init" t "\\.el$") (list user-init-file)) compiled)
      (when (or (not (file-exists-p (concat file "c")))
		(file-newer-than-file-p file (concat file "c")))
	(setq compiled nil)
	(byte-compile-file file)))))


;; ------------------------------------------------------------- [ Diminish ]
(require 'diminish)


(provide 'munk-util)
