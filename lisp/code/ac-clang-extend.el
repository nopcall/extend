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
    ;; (setq command "echo | g++ -v -x c++ -E - 2>&1 |
    ;;              grep -A 20 starts | grep include | grep -v search")
    (setq command "/usr/include/c++/4.8
		/usr/include/x86_64-linux-gnu/c++/4.8
		/usr/include/c++/4.8/backward
		/usr/lib/gcc/x86_64-linux-gnu/4.8/include
		/usr/local/include
		/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed
		/usr/include/x86_64-linux-gnu
		/usr/include")
    (setq ac-clang-flags
	  (mapcar (lambda (item)
		    (concat "-I" item))
		  (split-string
		   (shell-command-to-string command))))
    ;; completion for C/C++ macros.
    (push "-code-completion-macros" ac-clang-flags)
    (push "-code-completion-patterns" ac-clang-flags)
    (dolist (mode-hook '(c-mode-hook c++-mode-hook))
      (add-hook mode-hook
		(lambda ()
		  (add-to-list 'ac-sources 'ac-source-clang))))
    (message "Using *auto-complete-clang* for you C/C++."))			;; clang
  )

(defun ome-pkg-config-enable-clang-flag (pkg-config-lib)
  "This function will add necessary header file path of a
specified by `pkg-config-lib' to `ac-clang-flags', which make it
completionable by auto-complete-clang"
  (interactive "spkg-config lib: ")
  (if (executable-find "pkg-config")
      (if (= (shell-command
              (format "pkg-config %s" pkg-config-lib))
             0)
          (setq ac-clang-flags
                (append ac-clang-flags
                        (split-string
                         (shell-command-to-string
                          (format "pkg-config --cflags-only-I %s"
                                  pkg-config-lib)))))
        (message "Error, pkg-config lib %s not found." pkg-config-lib))
    (message "Error: pkg-config tool not found.")))

;;(ome-pkg-config-enable-clang-flag "QtGui")

(provide 'ac-clang-extend)
;;; clang-async-extend.el ends here
