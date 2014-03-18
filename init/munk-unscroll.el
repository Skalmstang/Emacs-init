;; Husk hvor point er placeret ved scroll og restore ved at kalde unscroll
(defvar unscroll-point (make-marker)
  "Cursor position for next call to 'unscroll'.")
(defvar unscroll-window-start (make-marker)
  "Window start for next call to 'unscroll'.")

;; Add symbol properties the three functions.
(add-hook 'after-init-hook (lambda ()
			     (put 'scroll-up 'unscrollable t)
			     (put 'scroll-up-command 'unscrollable t)
			     (put 'scroll-down 'unscrollable t)
			     (put 'scroll-down-command 'unscrollable t)
			     (put 'mwheel-scroll 'unscrollable t)
			     (put 'end-of-buffer 'unscrollable t)
			     (put 'beginning-of-buffer 'unscrollable t)))


(defun unscroll-maybe-remember ()
  "Saves data to restore the buffer position to before the last scroll sequence.
The data is only saved if last command wasn't a scroll-command."
  (if (not (and (symbolp last-command)
		(get last-command 'unscrollable)))
      (progn
	(set-marker unscroll-point (point))
	(set-marker unscroll-window-start (window-start)))))

(defun unscroll ()
  "Revert to 'unscroll-point' and 'unscroll-window-start'."
  (interactive)
  (condition-case msg
      (progn
	(goto-char unscroll-point)
	(set-window-start nil unscroll-window-start)
	(set-marker unscroll-window-start nil)
	(set-marker unscroll-point nil))
    (error (message "%s" (cadr msg)))))

(global-set-key "\C-cu" 'unscroll)

;; Advicer scroll med taster og mus
(defadvice scroll-up (before remember-for-unscroll activate compile)
  "Remember where we started from, for `unscroll'."
  (unscroll-maybe-remember))

(defadvice scroll-down (before remember-for-unscroll activate compile)
  "Remember where we started from, for `unscroll'."
  (unscroll-maybe-remember))

(defadvice mwheel-scroll (before remember-for-unscroll
				 activate compile)
  "Remember where we started from, for `unscroll'."
  (unscroll-maybe-remember))

(defadvice end-of-buffer (before remember-for-unscroll
				 activate compile)
  "Remember where we started from, for `unscroll'."
  (unscroll-maybe-remember))

(defadvice beginning-of-buffer (before remember-for-unscroll
				       activate compile)
  "Remember where we started from, for `unscroll'."
  (unscroll-maybe-remember))

(provide 'munk-unscroll)
