;; Setup a menu of recently opened files
(require 'recentf)
(eval-after-load "recentf"
  '(progn

     ;; file to save the recent list into
     (setq recentf-save-file "~/.emacs.d/.recentf")

     ;; maximum number of items in the recentf menu
     (setq recentf-max-menu-items 40)

     ;; maximum number of items saved
     (setq recentf-max-saved-items 50)

     ;; save file names relative to my current home directory
     (setq recentf-filename-handlers '(abbreviate-file-name))

     ;; toggle `recentf' mode
     (recentf-mode 1)

     ;; add key binding
     (global-set-key (kbd "C-c C-r") 'recentf-open-files)

     ;; husker kun p� .txt .tex .emacs .ahk og .el filer
     (setq recentf-exclude '("_region_.tex")
	   recentf-keep '("\\.t\\(ex\\|xt\\)\\'" "\\.emacs\\'" "\\.el\\'" "\\.ahk\\'" "\\.java\\'"  "\\.org\\'" "\\.m\\'"))
     ))

;; `C-g' annullerer recentf dialog
;; `RET' afslutter f�rst isearch og sender dern�st et RET til recentf
(add-hook 'recentf-dialog-mode-hook (lambda ()
				      (local-set-key "\C-g" 'recentf-cancel-dialog)
				      (local-set-key "\C-k" 'munk-remove-from-recentf-list)
				      (define-key isearch-mode-map (kbd "<return>") 'recentf-double-return)))


(defun recentf-double-return ()
  "Exits isearch and send RETURN to recentf."
  (interactive)
  (isearch-exit)
  (widget-button-press (point))
  (define-key isearch-mode-map (kbd "<return>") 'isearch-other-control-char))

(defun munk-remove-from-recentf-list ()
  "Remove the entry under point in the `recentf-dialog' from the `recentf-list'"
  (interactive)
  (let ((str (car (cddr (widget-at))))
	(opoint (point)))
    (when (string-match "^\\[" str)
      (setq str (substring str 4)))
    (setq recentf-list (remove str recentf-list))
    (recentf-open-files)
    (goto-char opoint)))

(defun recentf-local-keys ()
  "a-�\\q and -.:~/ starts an incremental search."
  (mapc (lambda (K)
	  (let* ((key (car K)) (fun (cdr K)))
	    (local-set-key  (edmacro-parse-keys key) fun)))
	'(("a"  . isearch-search-char) ; Brug prim�rt disse da de ligger p� homerow
	  ("b"  . isearch-search-char)
	  ("c"  . isearch-search-char)
	  ("d"  . isearch-search-char)
	  ("e"  . isearch-search-char)
	  ("f"  . isearch-search-char)
	  ("g"  . isearch-search-char)
	  ("h"  . isearch-search-char)
	  ("i"  . isearch-search-char)
	  ("j"  . isearch-search-char)
	  ("k"  . isearch-search-char)
	  ("l"  . isearch-search-char)
	  ("m"  . isearch-search-char)
	  ("n"  . isearch-search-char)
	  ("o"  . isearch-search-char)
	  ("p"  . isearch-search-char)
	  ;; ("q"  . isearch-search-char) Mere v�rd som shurtcut
	  ("r"  . isearch-search-char)
	  ("s"  . isearch-search-char)
	  ("t"  . isearch-search-char)
	  ("u"  . isearch-search-char)
	  ("v"  . isearch-search-char)
	  ("x"  . isearch-search-char)
	  ("y"  . isearch-search-char)
	  ("z"  . isearch-search-char)
	  ("�"  . isearch-search-char)
	  ("�"  . isearch-search-char)
	  ("�"  . isearch-search-char)
	  ("-"  . isearch-search-char)
	  ("_"  . isearch-search-char)
	  ("~"  . isearch-search-char)
	  (":"  . isearch-search-char)
	  ("."  . isearch-search-char)
	  ("/"  . isearch-search-char))))



(add-hook 'recentf-dialog-mode-hook 'recentf-local-keys)

(provide 'munk-recentf)
