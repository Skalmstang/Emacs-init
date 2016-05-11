;; (add-hook 'LaTeX-mode-hook (lambda ()
;; 			     (try-require 'yasnippet)
;; 			     (yas/load-directory "~/.emacs.d/snippets")))
;; (require 'yas-jit)
;; (setq yas/root-directory "~/.emacs.d/snippets")
;; (yas/jit-load)

(require 'yasnippet)
(yas/load-directory "~/.emacs.d/snippets")

(provide 'munk-yas)
