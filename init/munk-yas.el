;; (add-hook 'LaTeX-mode-hook (lambda ()
;; 			     (try-require 'yasnippet)
;; 			     (yas/load-directory "~/.emacs.d/snippets")))
;; (require 'yas-jit)
;; (setq yas/root-directory "~/.emacs.d/snippets")
;; (yas/jit-load)

(try-require 'yasnippet)
;; (yas/load-directory "~/.emacs.d/snippets")
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))
(yas-global-mode 1)
(provide 'munk-yas)
