;;; irony-extend.el --- irony
;;; Commentary:
;;;
;;; Code:

(add-to-list 'load-path (expand-file-name "~/git_projects/irony-mode/elisp/"))

(autoload 'irony-enable "irony")						;; Note: hit `C-c C-b' to open build menu

(irony-enable 'ac)								;; the ac plugin will be activated in each buffer using irony-mode
(setq ac-disable-faces (delq 'font-lock-string-face ac-disable-faces))

;; (setq irony-cdb-cmake-generator "Ninja")					;; Use Ninja (http://martine.github.io/ninja/) instead of classic Makefiles

(setq qt-include-path-prefix "/home/Data/Qt5.2.1/5.2.1/gcc_64/include/")	;; Qt5 library
(when (file-exists-p qt-include-path-prefix)
  (setq	irony-libclang-additional-flags
	(mapcar (lambda (include-dirs) (concat "-I" include-dirs))
		(directory-files qt-include-path-prefix t "\\w+"))))
(setq irony-libclang-additional-flags
      (append '("-I/home/Data/Qt5.2.1/5.2.1/gcc_64/include"
		"-code-completion-macros"					;; completion for C/C++ macros.
		"-code-completion-patterns"
		"-std=c++11"
		)
	      irony-libclang-additional-flags))

(defun irony-c++-hooks ()
  "Enable the hooks in the preferred order: 'yas -> auto-complete -> irony'."
  ;; if yas is not set before (auto-complete-mode 1), overlays may persist after
  ;; an expansion.
  (when (member major-mode irony-known-modes)
    (setq ac-sources nil)							;; uncomment if other ac-sources are too annoying
    (irony-mode t)))								;; enable irony-mode

(add-hook 'c++-mode-hook 'irony-c++-hooks)
(add-hook 'c-mode-hook 'irony-c++-hooks)

(message "Using *auto-complete-clang* for you C/C++.")

(provide 'irony-extend)
;;; irony-extend.el ends here
