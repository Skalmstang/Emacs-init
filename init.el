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
(try-require 'munk-ange-ftp)

(try-require 'munk-instantsearch)
(try-require 'munk-recentf)
(try-require 'munk-unscroll)
(try-require 'munk-yas)
(try-require 'munk-ac)

(try-require 'munk-elisp)
(try-require 'munk-latex)
(try-require 'munk-wcheck)
(try-require 'munk-ahk)
(try-require 'munk-diff)


(try-require 'munk-custom)



