(prefer-coding-system 'utf-8)
(electric-pair-mode)


;; ------------------------------------------------------------- [ små keybinds ]
;; `C-hy' bindes til describe-function. Undgår fejl ved `C-hf'
(global-set-key "\C-hy" 'describe-function)

;; `C-cC-c' evaluerer funktionen under point i elisp
(define-key emacs-lisp-mode-map "\C-c\C-c" 'eval-defun)

;; `C-ce' bindes til eval-buffer
(define-key emacs-lisp-mode-map "\C-ce" 'eval-buffer)

;; `C-ci' bindes til indent-region
(global-set-key "\C-ci" 'indent-region)

;; Auto indent ved enter
(global-set-key (kbd "RET") 'newline-and-indent)

;; `Alt-f4' as usual
(global-set-key (kbd "<M-f4>") 'save-buffers-kill-emacs)

;; `Ctrl-f4' close buffer
(global-set-key (kbd "<C-f4>") (lambda() (interactive) (kill-buffer (current-buffer))))

;; open my Emacs init file
(defun munk-open-dot-emacs ()
  "Opens `.emacs'."
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "<S-f3>") 'munk-open-dot-emacs)

;; ------------------------------------------------------------- [ Delete line ]
;; `M-k' sletter linien uden at gemme
(global-set-key "\M-k" 'munk-delete-line)

(defun munk-delete-line ()
  "Delete text from current position to end of line char."
  (interactive)
  (delete-region
   (save-excursion (move-beginning-of-line 1) (point))
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1))

;; ------------------------------------------------------------- [ Undo ]
(require 'undo-tree)
(global-undo-tree-mode)
(global-unset-key "\C-z")
(global-set-key "\C-z" 'undo-tree-undo)
(global-set-key "\M-z" 'undo-tree-redo)

(eval-after-load 'diminish
  '(diminish 'undo-tree-mode ""))

;; `C-xu' bindes til åben fil. Tidligere undo
(global-unset-key "\C-xu") (global-set-key "\C-xu" 'find-file)

;; ------------------------------------------------------------- [ Klip og kopier ]
;; Change cutting behavior:
;; "Many times you'll do a kill-line command with the only intention of
;; getting the contents of the line into the killring. Here's an idea stolen
;; from Slickedit, if you press copy or cut when no region is active, you'll
;; copy or cut the current line."
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy the
     current line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill the
     current line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

;; ------------------------------------------------------------- [ Autoindent ]
;; auto-indent pasted code
(defadvice yank (after indent-region activate)
  "Indent the yanked content according to mode"
  (if (member major-mode
	      '(emacs-lisp-mode scheme-mode lisp-mode c-mode c++-mode jde-mode
				objc-mode latex-mode plain-tex-mode python-mode))
      (indent-region (region-beginning) (region-end) nil)))

(defadvice yank-pop (after indent-region activate)
  "Indent the yanked content according to mode"
  (if (member major-mode
	      '(emacs-lisp-mode scheme-mode lisp-mode c-mode c++-mode jde-mode
				objc-mode latex-mode plain-tex-mode python-mode))
      (indent-region (region-beginning) (region-end) nil)))

;; ------------------------------------------------------------- [ uncomment dwim ]
;; Enhances commend-dwim
;;  - Uncomment if on a line only containing a comment
;;  - If I did that last time comment the line again

(defadvice comment-dwim (around uncomment activate)
  (cond
   ;; region active
   ((and mark-active transient-mark-mode)
    ad-do-it)
   
   ;; last time I uncommented
   ((equal last-command 'dwim-uncomment)
    (comment-or-uncomment-region (line-beginning-position) (line-end-position) arg))

   ;; If on a line only containing a comment - uncomment it
   ((limited-save-excursion (beginning-of-line) (looking-at "\\s-*\\s<"))
    (uncomment-region (line-beginning-position) (line-end-position))
    (setq this-command 'dwim-uncomment))

   ;; Dunno what to do - default behaviour
   (t
    ad-do-it)))


;; ---------------------------
(provide 'munk-edit)
;; End of file
