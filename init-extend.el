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
(require 'themes-extend)							;; theme
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
(require 'auto-highlight-symbol-config)

;;------------------------------------------------------------------------------
;; Code  "extend/lisp/code"
;;------------------------------------------------------------------------------
(require 'mode-detect-extend)							;; which mode should enable for file
(require 'yasnippet-extend)							;; code snippet
(require 'company-extend)							;; *Company* code completion
(require 'ac-extend)								;; *Auto Complete* code completion
;; (require 'hippie-expand-extend)						;; build int code completion

(if (executable-find "irony-server")
    (require 'irony-extend)							;; irony-mode first consider
  (if (executable-find "clang-complete")
      (progn
	(setq clang-completion-async-detect t)					;; auto-complete-clang-async
	(require 'ac-clang-extend))
    (progn
      (setq clang-completion-async-detect nil)					;; auto-complete-clang
      (require 'ac-clang-extend)))
  )										;; dynamic c/c++ completion

(when (and (executable-find "rc")
	   (executable-find "rdm"))
  (require 'rtags-extend))							;; dynamic code browser tag tool

;;------------------------------------------------------------------------------
;; other "extend/lisp"
;;------------------------------------------------------------------------------
(require 'misc-extend)								;; misc mode and settings
(require 'binding-extend)							;; keybindings
(require 'custom-extend)
(ignore-errors (require 'secret-extend))

(provide 'init-extend)
;;; init-extend.el ends here

;; coding: utf-8
;; no-byte-compile: t
;; End:
