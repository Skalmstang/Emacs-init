;; Config og yderligere sources til ac
;; (add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(global-auto-complete-mode t) ;; For now make sure ac works!


;; ------------------------------------------------------------- [ Autocomplete mode ]
;; Visiual autocompletion 

(try-require 'auto-complete-config)
(add-to-list 'ac-modes 'latex-mode)
(ac-config-default)
(global-auto-complete-mode 1)

;; --------------------------------------------------------------[ LaTeX completion ]
(add-hook 'LaTeX-mode-hook (lambda ()
			     (setq ac-sources (append '(ac-source-yasnippet ac-source-LaTeX ac-source-math-LaTeX)
						      ac-sources))))

;; ------------------------------------------------------------- [ Sources for autocomplete ]
(try-require 'munk-math-complete)


;;
;; LaTeX completion
;;
(defvar ac-source-LaTeX
  '((candidates . (remove "alph" (mapcar 'car (TeX-symbol-list))))
    (action . munk-insert-bslash)
    (symbol . "L")
    (cache))
  "The macros AUCTeX have recorded.")

(defvar ac-source-math-LaTeX
  '((candidates . (when (ac-math-latex-math-face-p)
		    munk-LaTeX-completions))
    (action . munk-insert-bslash)
    (candidate-face . ac-math-candidate-face)
    (selection-face . ac-math-selection-face)
    (requires . 1) 
    (symbol . "m"))
  "Oftest brugte math kommandoer i LaTeX.")

;; Faces
(defface ac-math-candidate-face
  '((t (:background "ForestGreen" :foreground "white")))
  "Face for gtags candidate"
  :group 'auto-complete)

(defface ac-math-selection-face
  '((t (:background "DarkGreen" :foreground "white")))
  "Face for the gtags selected candidate."
  :group 'auto-complete)

;; LaTeX complete støttefunktioner
(defun munk-insert-bslash ()
  "If there's no backslash before word, insert one."
  (limited-save-excursion
   (skip-syntax-backward "w_")
   (unless (looking-back "\\\\")
     (insert "\\"))))

(defun ac-math-latex-math-face-p ()
  (let ((face (get-text-property (point) 'face)))
    (if (consp face)
        (eq  (car face) 'font-latex-math-face)
      (eq face 'font-latex-math-face)
      )))

(provide 'munk-ac)
