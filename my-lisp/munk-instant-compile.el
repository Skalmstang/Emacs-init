(define-minor-mode instant-compile-mode
  "Toggle Hungry mode.
     With no argument, this command toggles the mode.
     Non-null prefix argument turns on the mode.
     Null prefix argument turns off the mode.
     
     When Hungry mode is enabled, the control delete key
     gobbles all preceding whitespace except the last.
     See the command \\[hungry-electric-delete]."
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " iCompile"
  (if instant-compile-mode
      (if (eq major-mode 'latex-mode)
	  (add-hook 'after-save-hook 'instant-compile-master t t)
	(setq instant-compile-mode nil)
	(error "Instant compile not avaiable for other than LaTeX-mode"))

    (remove-hook 'after-save-hook 'instant-compile-master t)))


(defun instant-compile-master ()
  "Compile the master file"
  (unless (TeX-active-process)
    (TeX-command "LaTeX" 'TeX-master-file)))


(provide 'munk-instant-compile)
