(defalias 'elisp-mode 'emacs-lisp-mode)

;; ------------------------------------------------------------- [ Keybinds ]
;; `C-cC-c' evaluerer funktionen under point i elisp
(define-key emacs-lisp-mode-map "\C-c\C-c" 'eval-defun)

;; `C-ce' bindes til eval-buffer
(define-key emacs-lisp-mode-map "\C-ce" (lambda ()
					  (interactive)
					  (eval-buffer)
					  (message "Buffer evaluated")))


;; ------------------------------------------------------------- [ Compile this file ]
;; `C-cb' gemmer og compiler den aktive buffer, hvis elisp mode aktivt
(defun munk-bytecompile-this ()
  (interactive)
  (if (and
       (file-newer-than-file-p buffer-file-name (concat buffer-file-name "c")))
      (progn
	(save-buffer)
	(byte-compile-file buffer-file-name))))
(define-key emacs-lisp-mode-map "\C-cb" 'munk-bytecompile-this)


;; ------------------------------------------------------------- [ Font locking ]
;; Emacs lisp mode
(font-lock-add-keywords 'emacs-lisp-mode
			'(("(\\(limited-save-excursion\\|try-require\\|and\\|or\\|not\\|null\\|autoload\\)\\>" 1 font-lock-keyword-face)))

;; Pretty lambda
(font-lock-add-keywords 'emacs-lisp-mode 
			'(("(\\(lambda\\)\\>" (0 (prog1 ()
					      (compose-region (match-beginning 1)
							      (match-end 1)
							      (make-char 'greek-iso8859-7 107)))))))

(provide 'munk-elisp)
