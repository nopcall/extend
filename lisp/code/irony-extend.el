;;; irony-extend.el --- irony
;;; Commentary:
;;;
;;; Code:

(add-to-list 'load-path (expand-file-name "~/git_projects/irony-mode/elisp/"))

(autoload 'irony-enable "irony")						;; Note: hit `C-c C-b' to open build menu

(irony-enable 'ac)								;; the ac plugin will be activated in each buffer using irony-mode
(setq ac-disable-faces (delq 'font-lock-string-face ac-disable-faces))

(setq irony-cdb-cmake-generator "Ninja")					;; Use Ninja (http://martine.github.io/ninja/) instead of classic Makefiles

(defun qt-irony ()
  "Enable Qt library for buffer then make it local"
  (interactive)
  (when (not (boundp 'irony-qt-include-path-prefix))
    (setq irony-qt-include-path-prefix "/home/Data/Qt5.3.0/5.3/gcc_64/include"))	;; set Qt library path unless it's been defined
  (when (file-exists-p irony-qt-include-path-prefix)
    (setq irony-libclang-additional-flags
	  (append
	   (mapcar (lambda (include-dirs) (concat "-I" include-dirs))
		   (directory-files irony-qt-include-path-prefix t "\\w+"))
	   (split-string (concat "-I" irony-qt-include-path-prefix))
	   irony-libclang-additional-flags)))
  (push "-code-completion-macros" irony-libclang-additional-flags)
  (push "-code-completion-patterns" irony-libclang-additional-flags)
  (make-variable-buffer-local 'irony-libclang-additional-flags)
  (irony-reload-flags))

(defun pkg-lib-include-extend (pkg-config-lib)
  "Add necessary header file path for code completion.
append `PKG-CONFIG-LIB' to `irony-libclang-additional-flags'"
  (interactive "spkg-config lib: ")
  (if (executable-find "pkg-config")
      (if (= (shell-command (format "pkg-config %s" pkg-config-lib))
	     0)
          (progn (setq irony-libclang-additional-flags
		       (append irony-libclang-additional-flags
			       (split-string
				(shell-command-to-string
				 (format "pkg-config --cflags-only-I %s"
					 pkg-config-lib)))))
		 (irony-reload-flags))
        (message "Error, pkg-config lib %s not found." pkg-config-lib))
    (message "Error: pkg-config tool not found.")))

(defun enable-irony-mode-extend ()
  (when (member major-mode irony-known-modes)					;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
    ;; (setq ac-sources nil)							;; uncomment if other ac-sources are too annoying
    (irony-mode t)
    (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony)))		;; enable irony-mode

(add-hook 'c++-mode-hook 'enable-irony-mode-extend)
(add-hook 'c-mode-hook 'enable-irony-mode-extend)

(message "Using *auto-complete-clang* for you C/C++.")

(provide 'irony-extend)
;;; irony-extend.el ends here
