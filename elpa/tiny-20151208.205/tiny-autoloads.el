;;; tiny-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (tiny-replace-this-sexp tiny-expand) "tiny" "tiny.el"
;;;;;;  (22330 8650 0 0))
;;; Generated autoloads from tiny.el

(autoload 'tiny-expand "tiny" "\
Expand current snippet.
It polls the expander functions one by one
if they can expand the thing at point.
First one to return a string succeeds.
These functions are expected to set `tiny-beg' and `tiny-end'
to the bounds of the snippet that they matched.
At the moment, only `tiny-mapconcat' is supported.
`tiny-mapconcat2' should be added to expand rectangles.

\(fn)" t nil)

(autoload 'tiny-replace-this-sexp "tiny" "\
Eval and replace the current sexp.
On error go up list and try again.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("tiny-pkg.el") (22330 8650 944000 0))

;;;***

(provide 'tiny-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; tiny-autoloads.el ends here
