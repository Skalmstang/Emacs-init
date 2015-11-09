(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/init")
(add-to-list 'load-path "~/.emacs.d/my-lisp")
(add-to-list 'load-path "~/.emacs.d/lisp")


(setq debug-on-error nil)


(require 'munk-util)
(try-require 'munk-server)
(try-require 'munk-looks)
(try-require 'munk-edit)
(try-require 'munk-backup)
(try-require 'munk-interaction)
(try-require 'munk-tiny)

(try-require 'munk-instantsearch)
(try-require 'munk-recentf)
(try-require 'munk-unscroll)
(try-require 'munk-yas)
;;(try-require 'munk-ac)

(try-require 'munk-elisp)
(try-require 'munk-latex)
(try-require 'munk-wcheck)
(try-require 'munk-diff)


;(try-require 'munk-custom)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
