(package-initialize)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/init")
(add-to-list 'load-path "~/.emacs.d/my-lisp")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/cc-mode")



(setq debug-on-error nil)

;(require 'theis-site-start)
(require 'munk-util)
(require 'munk-server)
(require 'munk-looks)
(require 'munk-edit)
(require 'munk-backup)
(require 'munk-interaction)
(require 'munk-tiny)

(require 'munk-instantsearch)
(require 'munk-recentf)
(require 'munk-unscroll)
(require 'munk-yas)
(require 'munk-ac)

(require 'munk-elisp)
(require 'munk-latex)
(require 'munk-wcheck)

(require 'munk-custom)











