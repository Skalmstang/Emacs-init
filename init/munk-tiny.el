;; ------------------------------------------------------------- [ tinyeat ]


(add-to-list 'load-path "~/.emacs.d/lisp/tiny/lisp/tiny")

;; ------------------------------------------------------------- [ tinyeat ]

(autoload 'tinyeat-delete-whole-word           "tinyeat" "" t)
(autoload 'tinyeat-yank-overwrite              "tinyeat" "" t)
(autoload 'tinyeat-forward-preserve            "tinyeat" "" t)
(autoload 'tinyeat-backward-preserve           "tinyeat" "" t)
(autoload 'tinyeat-delete-paragraph            "tinyeat" "" t)
(autoload 'tinyeat-join-lines                  "tinyeat" "" t)

;; Indsætter men der overskrives (brugbart ved tabeller
(global-set-key (kbd "C-S-y")         'tinyeat-yank-overwrite)

;; Well... it joins lines
(global-set-key (kbd "C-S-SPC")	'tinyeat-join-lines)

;; Sletter hele ord af mod venstre (baglæns)
(global-set-key (kbd "<C-backspace>") 'tinyeat-backward-preserve)
;; Mod højre
(global-set-key (kbd "<M-backspace>") 'tinyeat-forward-preserve)

;; Sletter ordet under point.
(global-set-key (kbd "<S-backspace>") 'tinyeat-delete-whole-word)

;; Sletter afsnittet dvs. adskilt af mellemrum
(global-set-key "\C-\M-d"               'tinyeat-delete-paragraph)

;; Indenterer efter linier samles
;; (defadvice tinyeat-join-lines (after tiny-indent activate)

;;   (indent-according-to-mode))

(defadvice tinyeat-join-lines (after tiny-indent activate)
  "Indent the paragraph following point when joining lines."
  (indent-region
   (point)
   (limited-save-excursion (forward-paragraph) (point))))

(provide 'munk-tiny)
