;;; env-extend.el --- environment
;;; Commentary:
;;;
;;; Code:

;;------------------------------------------------------------------------------
;; Add load-path
;;------------------------------------------------------------------------------
(add-to-list 'load-path (setq extend-directory
			      (expand-file-name "extend" user-emacs-directory)));; extend root
(add-to-list 'load-path (setq extend-lisp-directory
			      (expand-file-name "lisp"	extend-directory)))	;; extend/lisp

(add-to-list 'load-path (expand-file-name "appearance"	extend-lisp-directory))	;; lisp/appearance
(add-to-list 'load-path (expand-file-name "code"	extend-lisp-directory))	;; lisp/code
(add-to-list 'load-path (expand-file-name "modeplus"	extend-lisp-directory))	;; lisp/modeplus
(add-to-list 'load-path (expand-file-name "conf"	extend-lisp-directory))	;; lisp/conf

;;------------------------------------------------------------------------------
;; Add external projects to load path
;;------------------------------------------------------------------------------
(add-to-list 'load-path (setq site-lisp-dir
			      (expand-file-name "site-lisp" extend-directory)))	;; extend/site-lisp
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))						;; load all files in directory site-lisp

;;------------------------------------------------------------------------------
;; enable preload package
;;------------------------------------------------------------------------------
(require 'eval-after-load)							;; speedup mode load

;;------------------------------------------------------------------------------
;; disable default config of purcell's
;;------------------------------------------------------------------------------
(when *is-a-mac*
  (setq default-input-method "MacOSX")
  (setq mac-option-modifier 'meta)						;; not mac type keyboard
  (setq mac-command-modifier 'super)
  (setq ns-function-modifier 'hyper)
  (setq mouse-wheel-scroll-amount '(0.001))					;; Make mouse wheel / trackpad scrolling less jerky
  (when *is-cocoa-emacs*
    (global-set-key (kbd "M-`") 'ns-next-frame)
    (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
    (eval-after-load 'nxml-mode
      '(define-key nxml-mode-map (kbd "M-h") nil))
    (global-set-key (kbd "M-ˍ") 'ns-do-hide-others)				;; what describe-key reports for cmd-option-h
    ))

(provide 'env-extend)
;;; env-extend.el ends here
