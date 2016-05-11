;; Bruger begge windows-taster som super modifiers. De tilg�es med
(setq w32-pass-lwindow-to-system nil
      w32-pass-rwindow-to-system nil
      w32-pass-apps-to-system nil
      w32-apps-modifier 'hyper
      w32-lwindow-modifier 'super ; Left Windows key
      w32-rwindow-modifier 'super ; Right Windows key
      )

;; Bruger meta til at skifte buffer
(windmove-default-keybindings 'meta)

;; Gem minibufferens "historie"
(savehist-mode 1)

;; don't use dialog boxes to ask questions
(setq use-dialog-box nil)

;; Create new file/buffer no questions asked
(setq confirm-nonexistent-file-or-buffer nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; ------------------------------------------------------------- [ IDO ]
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always
      ido-save-directory-list-file "~/.emacs.d/.ido.last")
(ido-mode 1)

;; ------------------------------------------------------------- [ SMEX ]
;; IDO for `M-x'
(autoload 'smex "smex" "" t)
(autoload 'smex-major-mode-commands "smex" "" t)
(setq smex-history-length 10)
(eval-after-load 'smex
  '(smex-initialize))
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands) 

;; ------------------------------------------------------------- [ Search ]
;; Binder regexps s�gning til h�ndvenlig genveje
;; `M-s' regexps s�gning fremad
(global-set-key "\M-s" 'isearch-forward-regexp)

;; `M-s' regexps s�gning bagl�ns
(global-set-key "\M-r" 'isearch-backward-regexp)

;; Regexps s�gning kan n�s med `M-x' qrr isted for `C-M-%'
(defalias 'qrr 'query-replace-regexp)
(defalias 'qqr 'query-replace-regexp)


;; Almindelig og regexp erstat lige under fingrene
(global-set-key (kbd "s-j") 'query-replace)
(global-set-key (kbd "s-k") 'query-replace-regexp)

;; ------------------------------------------------------------- [ Diverse ]
;; wrap long lines in text mode
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Enable narrowing `C-xnn' begr�nser til regionen. `C-xnw' udvider igen
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

;; Slet hvad der st�r under markeringen ved inds�ttelse af tekst
(delete-selection-mode t)

;; Turn on eldoc mode. Prints doc string while typing.
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

(provide 'munk-interaction)
