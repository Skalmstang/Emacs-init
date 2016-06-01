;; Font
;; Sætter std. font til 10.5pt Consolas istedet for Courier
;;(set-face-attribute 'default nil :font "Consolas-10")


;; Ingen scrollbar
(set-scroll-bar-mode nil)
(tool-bar-mode -1)

;; Scrollbar in mode line
(try-require 'sml-modeline)
(sml-modeline-mode)

;; Linienumre i passende modes
(add-hook	'emacs-lisp-mode-hook	'linum-mode)
(add-hook	'LaTeX-mode-hook	'linum-mode)
(add-hook	'xahk-mode-hook		'linum-mode)
(add-hook	'matlab-mode-hook       'linum-mode)

;; Fringe halv størrelse og kun i venstre side. Tallene angives i px.
(set-fringe-mode '(5 . 0))

;; auto-fit the *Help* buffer to its content
(temp-buffer-resize-mode t)

;; Global syntax highlight
(global-font-lock-mode t)

;; Vis taster i key-combo med det samme
(setq echo-keystrokes 0.01)

;; match parentheses
(show-paren-mode t)

;; Don't fucking blink the cursor
(blink-cursor-mode 0)

;; Antal linier før den wrapper
(setq-default fill-column 75)

;; Ingen splashscreen
(setq inhibit-splash-screen t)

;; Ingen besked i `*scratch*'
(setq initial-scratch-message nil)

;; Start elisp mode
(setq initial-major-mode 'emacs-lisp-mode)

;; don't truncate the message log buffer when it becomes large
(setq message-log-max t)

;; Slår toolbar fra og maksimer
(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a 'WM_SYSCOMMAND' message to the active frame with the
  ;; 'SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)

;; Adding custom themes
(load-theme 'zenburn t)



(provide 'munk-looks)
