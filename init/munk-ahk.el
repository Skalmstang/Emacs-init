;; Loading the correct mode when editing ahk scripts
(add-to-list 'auto-mode-alist '("\\.ahk\\'" . xahk-mode))
(autoload 'xahk-mode "xahk-mode" "Mode for editing ahk scripts")

;; ------------------------------------------------------------ [ Extensions ]
(defvar munk-ahk-folder-location "C:\\Program Files (x86)\\AutoHotkey\\"
  "Location of the ahk folder")

(defvar munk-ahk-compile "Compiler\\Ahk2Exe.exe"
  "Location of the ahk compiler relative to `munk-ahk-folder-location'.")

(defvar munk-ahk-exe-name "AutoHotkey.exe"
  "Name of the exe file.")


(defun munk-ahk-run-script (&optional script-path)
  "Launches the ahk-script"
  (interactive)
  (unless script-path
    (setq script-path (buffer-file-name)))
  
  (let ((exe-path (concat munk-ahk-folder-location munk-ahk-exe-name)))
    (set-process-query-on-exit-flag
     (start-process "ahk-script" nil exe-path script-path) nil))
  (message "Launched '%s'." script-path))

(defun munk-ahk-compile-script (&optional script-path)
  "Launches the ahk-script"
  (interactive)
  (unless script-path
    (setq script-path (buffer-file-name)))
  
  (let ((exe-path (concat munk-ahk-folder-location munk-ahk-compile)))
    (set-process-query-on-exit-flag
     (start-process "ahk-script" nil exe-path "/in" script-path) nil))
  (message "Compiled '%s'." script-path))

;; ------------------------------------------------------------ [ Key Binds ]

(eval-after-load "xahk-mode"
  '(progn
     (add-hook 'xahk-mode-hook (lambda ()
				 (local-set-key "\C-c\C-c" 'munk-ahk-run-script)))))



(provide 'munk-ahk)
