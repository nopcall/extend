;;; clang-async-extend.el --- clang
;;; Commentary:
;;;
;;; Code:

(require-package 'auto-complete-clang-async)
(require 'auto-complete-clang-async)

;; (setq command "echo | g++ -v -x c++ -E - 2>&1 |
;;                  grep -A 20 starts | grep include | grep -v search")
;; (setq ac-clang-cflags
;;       (mapcar (lambda (item)
;; 		(concat "-I" item))
;; 	      (split-string
;; 	       (shell-command-to-string command))))

(defun qt-clang-async ()
  "Enable Qt library for buffer then make it local"
  (interactive)
  (setq qt-include-path-prefix "/home/Data/Qt5.2.1/5.2.1/gcc_64/include/")	;; Qt5 library
  (when (file-exists-p qt-include-path-prefix)
    (setq ac-clang-cflags
	  (append (mapcar (lambda (include-dirs) (concat "-I" include-dirs))
			  (directory-files qt-include-path-prefix t "\\w+"))
		  ac-clang-cflags)))
  (setq ac-clang-cflags
	(append '(
		  ;; "-code-completion-macros" ;; Completion for C/C++ macros.
		  ;; "-code-completion-patterns"
		  "-I/home/Data/Qt5.2.1/5.2.1/gcc_64/include"
		  )
		ac-clang-cflags))
  (make-variable-buffer-local 'ac-clang-cflags)
  (ac-clang-update-cmdlineargs))

(defun ome-pkg-config-enable-clang-flag (pkg-config-lib)
  "This function will add necessary header file path of a
specified by `pkg-config-lib' to `ac-clang-cflags', which make it
completionable by auto-complete-clang"
  (interactive "spkg-config lib: ")
  (if (executable-find "pkg-config")
      (if (= (shell-command
              (format "pkg-config %s" pkg-config-lib))
             0)
          (progn
	    (setq ac-clang-cflags
		  (append ac-clang-cflags (split-string
					   (shell-command-to-string
					    (format "pkg-config --cflags-only-I %s"
						    pkg-config-lib)))))
	    (ac-clang-update-cmdlineargs))
        (message "Error, pkg-config lib %s not found." pkg-config-lib))
    (message "Error: pkg-config tool not found.")))

;;(ome-pkg-config-enable-clang-flag "QtGui")

(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process))

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(my-ac-config)

(message "Using *Auto-Complete-Clang-*Async** for you C/C++.")

(provide 'ac-clang-extend)
;;; clang-async-extend.el ends here
