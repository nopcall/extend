;;; init.extend.el --- nopcall's emacs config init file
;;; Commentary:
;;;	nopcall's extend config for purcell's emacs config
;;;------------------------------------------------------------------------------
;;;	INSTALLATION:
;;;	run "./ext.sh"
;;;------------------------------------------------------------------------------
;;; Code:

(load (expand-file-name "extend/lisp/env-extend.el" user-emacs-directory))	;; environment

;;------------------------------------------------------------------------------
;; Appearance "extend/lisp/appearance"
;;------------------------------------------------------------------------------
;; (require 'themes-extend)							;; theme
(require 'fonts-extend)								;; fonts
(require 'platform-extend)							;; specific platform settings
(require 'whitespace-extend)							;; show invisible symbol

;;------------------------------------------------------------------------------
;; Modeplus "extend/lisp/modeplus"
;;------------------------------------------------------------------------------
(require 'growl-extend)								;; It has been delete from purcell's config. I like it so ...
(require 'pos-tip-extend)
(require 'ido-extend)
(require 'popwin-extend)
(require 'perspective-extend)
;; (require 'auto-highlight-symbol-config)

;;------------------------------------------------------------------------------
;; Code  "extend/lisp/code"
;;------------------------------------------------------------------------------
(require 'mode-detect-extend)							;; which mode should enable for file
(require 'flycheck-extend)							;; flycheck customized
(require 'yasnippet-extend)							;; code snippet
(require 'company-extend)							;; *Company* code completion
(require 'ac-extend)								;; *Auto Complete* code completion
;; (require 'hippie-expand-extend)						;; build int code completion

(require 'irony-extend)								;; irony-mode at first considered
;; (require 'irony-rewrite-extend)							;; irony-mode rewrite at first considered
;; (require 'ac-clang-extend)							;; dynamic c/c++ completion

(when (and (executable-find "rc")
	   (executable-find "rdm"))
  (require 'rtags-extend))							;; dynamic code browse tag tool

;;------------------------------------------------------------------------------
;; Other "extend/lisp"
;;------------------------------------------------------------------------------
(require 'misc-extend)								;; misc settings
(require 'binding-extend)							;; keybindings
(require 'custom-extend)
(ignore-errors (require 'secret-extend))

(provide 'init-extend)
;;; init-extend.el ends here

;; coding: utf-8
;; no-byte-compile: t
;; End:
