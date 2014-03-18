;; Start server
(server-start)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; ------------------------------------------------------------- [ kill %1 ]
;; Lukker automatisk bufferen %1, der åbnes når emacs åbnes normalt pga. genveje.
(defun munk-kill-newfile ()
  "Kills the buffer if named %1, returning to the current buffer."
  (when (equal (buffer-name) "%1")
    (kill-buffer (buffer-name))
    (if (minibufferp (car (buffer-list)))
	(switch-to-buffer (cadr (buffer-list)))
      (switch-to-buffer (car (buffer-list))))))

;; ------------------------------------------------------------- [ default directory ]
;; correct default dir at startup
(add-hook 'after-init-hook (lambda ()
			     (if (string= default-directory "C:\\Program Files\\Logitech\\SetPointP/") 
				 (setq default-directory "~/"))))

(provide 'munk-server)
