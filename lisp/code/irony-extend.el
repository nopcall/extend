;;; irony-extend.el --- irony
;;; Commentary:
;;;
;;; Code;
(add-to-list 'load-path (expand-file-name "~/git_projects/irony-mode/elisp/"))

;; The Clang installation missed the system include directory
(when (file-exists-p "/usr/lib/clang/3.4/include/")
  (setq irony-libclang-additional-flags
        '("-isystem" "/usr/lib/clang/3.4/include/")))
;; Qt4
(when (file-exists-p "/usr/include/qt4/")
  (setq irony-libclang-additional-flags
	(mapcar (lambda (f) (concat "-i" f))
		(directory-files "/usr/include/qt4" t "Qt\\w+"))))

;; Use Ninja (http://martine.github.io/ninja/) instead of classic Makefiles
(setq irony-cdb-cmake-generator "Ninja")

(autoload 'irony-enable "irony")						;; Note: hit `C-c C-b' to open build menu
(irony-enable 'ac)								;; the ac plugin will be activated in each buffer using irony-mode

(defun irony-c++-hooks ()
  "Enable the hooks in the preferred order: 'yas -> auto-complete -> irony'."
  ;; if yas is not set before (auto-complete-mode 1), overlays may persist after
  ;; an expansion.
  (when (member major-mode irony-known-modes)
    ;; uncomment if other ac-sources are too annoying
    ;; (setq ac-sources nil)
    ;; enable irony-mode
    (irony-mode 1)))

(add-hook 'c++-mode-hook 'irony-c++-hooks)
(add-hook 'c-mode-hook 'irony-c++-hooks)

(message "Using *auto-complete-clang* for you C/C++.")

(provide 'irony-extend)
;;; irony-extend.el ends here
