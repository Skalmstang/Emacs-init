;; Setup af wcheck



;; Loader wcheck-mode når der er brug for dem
(autoload 'wcheck-mode "wcheck-mode"
  "Toggle wcheck-mode." t)
(autoload 'wcheck-change-language "wcheck-mode"
  "Switch wcheck-mode languages." t)
(autoload 'wcheck-actions "wcheck-mode"
  "Spelling suggestions." t)
(autoload 'wcheck-jump-forward "wcheck-mode"
  "Move point forward to next marked text area." t)
(autoload 'wcheck-jump-backward "wcheck-mode"
  "Move point backward to previous marked text area." t)

;; Start wcheck with LaTeX automatic
(add-hook 'LaTeX-mode-hook 'wcheck-mode)

;; ------------------------------------------------------------- [ Sprog config ]
(setq wcheck-enchant-path (concat (substring data-directory 0 (string-match "/Programmer/" data-directory)) "/Programmer/Enchant/enchant.exe")
      wcheck-language "English"
      wcheck-language-data
      `(("Danish"
	 (program . ,wcheck-enchant-path)
	 (args "-l" "-d" "da_DK")
	 (action-program . ,wcheck-enchant-path)
	 (action-args "-a" "-d" "da_DK")
	 (action-parser . (lambda (marked-text)
			    (cons (cons "[Add to dictionary]"
					'wcheck-parse-to-pwl)
				  (wcheck-parser-ispell-suggestions)))))
	("English"
	 (program . ,wcheck-enchant-path)
	 (args "-l" "-d" "en_US")
	 (action-program . ,wcheck-enchant-path)
	 (action-args "-a" "-d" "en_US")
	 (action-parser . (lambda (marked-text)
			    (cons (cons "[Add to dictionary]"
					'wcheck-parse-to-pwl)
				  (wcheck-parser-ispell-suggestions)))))
	("Repeated words"
	 (program . identity)
	 (case-fold . t)
	 (action-program . (lambda (word) (list (car (split-string (aref word 0))))))
	 (regexp-body . "\\(\\<\\w+\\>\\)\\(?:\\(?:\\s-\\|\\n\\)+\\<\\2\\>\\)+"))
	)
      wcheck-language-data-defaults
      '((parser . wcheck-parser-lines)
	(action-parser . wcheck-parser-ispell-suggestions)
	(connection . nil)
	(face . wcheck-default-face)
	(syntax . text-mode-syntax-table)
	(regexp-start . "\\<'*")
	(regexp-body . "\\w+?")
	(regexp-end . "'*\\>")
	(regexp-discard . "\\`'+\\'") 	
	(case-fold . nil)
	(read-or-skip-faces
	 (emacs-lisp-mode read
			  font-lock-comment-face font-lock-doc-face)
	 (latex-mode read                     ; "read" the following faces
		     nil                      ; nil means normal text
		     font-latex-sectioning-1-face
		     font-latex-sectioning-2-face 
		     font-latex-sectioning-3-face
		     font-latex-sectioning-4-face
		     font-latex-string-face
		     font-latex-bold-face
		     font-latex-italic-face
		     font-lock-type-face))))

;; ------------------------------------------------------------- [ PWL funktioner ]
;; Location of the pwls
(defvar wcheck-pwl-loc
  (concat (getenv "APPDATA") "\\enchant\\"))

(defvar wcheck-mode nil "wcheck-mode not enabled from start.")

(defun wcheck-maybe-started ()
  "If wcheck-mode enabled spell check word under point else enable wcheck-mode"
  (interactive)
  (if wcheck-mode
      (call-interactively 'wcheck-actions)
    (call-interactively 'wcheck-mode)))

;; (defadvice wcheck-mode-turn-on (before language activate)
;;   "Try to guess the language to use for this buffer if `wcheck-language' have the default value.

;; Current supported modes is:
;;   - LaTeX mode (AUCTeX) [assumes that you're using the babel packages]"
;;   ;; When we haven't selected a specific lang for this buffer
;;   ;; Note that wcheck-language is always a buffer-local var
;;   (when (equal wcheck-language (default-value 'wcheck-language))
;;     ;; Mode-specific behaviour
;;     (cond
;;      ;; LaTeX mode
;;      ((eq major-mode 'latex-mode)
;;       (let ((language (caar (last (LaTeX-babel-active-languages)))))
;; 	(and language			;When language is not nil
;; 	     (setq wcheck-language (capitalize language)))))
;;      ((eq major-mode 'emacs-lisp-mode)
;;       (setq wcheck-language "English")))))

(defun wcheck-parse-to-pwl (data)
  "Writes the marked word to the pwl"
  (let* ((word (aref data 0))
	 (language (aref data 4))
	 (lang-code (nth 1 (member "-d" (wcheck-query-language-data
					 language 'action-args)))))
    (with-temp-buffer
      (newline)
      (insert word)
      (when (and (stringp lang-code)
		 (file-writable-p wcheck-pwl-loc))
	(append-to-file
	 (point-min) (point-max)
	 (concat (file-name-as-directory wcheck-pwl-loc)
		 lang-code ".dic"))))
    (message "Added word \"%s\" to %s dictionary" (downcase word) (downcase language))))

(defun wcheck-edit-pwl ()
  "Opens the pwl in a new buffer and switches focus to it."
  (interactive)
  (let ((lang-code (nth 1 (member "-d" (wcheck-query-language-data
					wcheck-language 'action-args)))))
    (if (string-equal lang-code "nil")
	(message "Language not configured, start wcheck first.")
      (switch-to-buffer (find-file-noselect
			 (concat (file-name-as-directory wcheck-pwl-loc)
				 lang-code ".dic") nil nil)))))

;; Gør sproget til file-var eller dir-var
(defun wcheck-file-language (&optional arg)
  "Add the current value of `wcheck-language' to the file local variables
With ARG or prefix argument, make it dir local variable instead.
NOTE: Effort should be made, to guess the language instead of setting it.
      Such functionality should be added to the defadvice of `wcheck-mode-turn-on'."
  (interactive "P")
  (if (and arg (y-or-n-p (concat "Add " (downcase wcheck-language)
				 " as standard dictionary for all files in this dir? ")))
      (progn
	(add-dir-local-variable nil 'wcheck-language wcheck-language)
	(save-buffer)
	(kill-buffer))
    (add-file-local-variable 'wcheck-language wcheck-language))) 

;; Binder `C-S-f9' til on/off wcheck-mode og aktiverer først keys
;; når wcheck mode har været slået til
(global-set-key (kbd "<C-S-f9>")      'wcheck-mode)

;; `f9' viser en minibuffer med staveforslag eller starter wcheck-mode
;; hvis det ikke er slået til.
(global-set-key [f9]           'wcheck-maybe-started)

(add-hook 'wcheck-mode-hook 'wcheck-keybinds)

(defun wcheck-keybinds ()
  ;; `M-f9' skifter sprog
  (local-set-key (kbd "<S-f9>") 'wcheck-change-language)
  ;; `C-f9' næste fejlstavede ord
  (local-set-key (kbd "<M-f9>") 'wcheck-jump-forward)
  ;; `S-f9' forrige fejlstavede ord
  (local-set-key (kbd "<C-f9>") 'wcheck-jump-backward)
  ;; `M-S-f9' ændre i pwl'en
  (local-set-key (kbd "<M-S-f9>") 'wcheck-edit-pwl)
  ;; `M-C-f9' tilføj sprong som file-var
  (local-set-key (kbd "<M-C-f9>") 'wcheck-file-language)
  )

;; ----------------------------------------------------- [ HOOKS ]
;; Hooks into other modes so they switch accordingly

(add-hook 'TeX-language-dk-hook
	  (lambda () (wcheck-change-language "Danish")))


(provide 'munk-wcheck)

