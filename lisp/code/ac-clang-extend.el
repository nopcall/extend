;;; clang-async-extend.el --- clang
;;; Commentary:
;;;
;;; Code:
(if clang-completion-async-detect
    (progn
      (require-package 'auto-complete-clang-async)
      (require 'auto-complete-clang-async)
      (defun ac-cc-mode-setup ()
	(setq ac-clang-complete-executable "clang-complete")
	(setq ac-sources '(ac-source-clang-async))
	(ac-clang-launch-completion-process))

      (defun my-ac-config ()
	(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
	(add-hook 'auto-complete-mode-hook 'ac-common-setup)
	(global-auto-complete-mode t))
      (message "Using *auto-complete-clang-async* for you C/C++.")
      )										;; clang-async

  (progn
    (require-package 'auto-complete-clang)
    (require 'auto-complete-clang)
    (defun my-ac-cc-mode-setup ()
      (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
    (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)				;; ac-source-gtags

    (defun my-ac-config ()
      (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
      (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
      ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
      (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
      (add-hook 'css-mode-hook 'ac-css-mode-setup)
      (add-hook 'auto-complete-mode-hook 'ac-common-setup)
      (global-auto-complete-mode t))
    (message "Using *auto-complete-clang* for you C/C++."))			;; clang
  )

(when (file-exists-p "/usr/include/qt4")
  (setq ac-clang-flags
	(mapcar (lambda (f) (concat "-I" f))
		(directory-files "/usr/include/qt4" t "Qt\\w+")))
  (setq ac-clang-cflags ac-clang-flags))					;; Include Qt4 if installed

(my-ac-config)

(provide 'ac-clang-extend)
;;; clang-async-extend.el ends here
