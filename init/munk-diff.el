(setenv "PATH" (concat (getenv "PATH") path-separator "C:/Program Files (x86)/GnuWin32/bin"))
(setq exec-path (add-to-list 'exec-path "C:/Program Files (x86)/GnuWin32/bin"))


(global-set-key "\C-cd" 'ediff-current-file)

(provide 'munk-diff)
