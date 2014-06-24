;;; irony-extend.el --- irony
;;; Commentary:
;;;
;;; Code:

;; (require-package 'el-get)
;; (require 'el-get)
;; (el-get-install 'irony-mode)

(add-to-list 'load-path (expand-file-name "~/git_projects/irony-rewrite-mode"))
(require 'irony)

(defun qt-irony-rewrite ()
  "Enable Qt library for buffer then make it local"
  (interactive)
  (when (not (boundp 'irony-qt-include-path-prefix))
    (setq irony-qt-include-path-prefix "/home/Data/Qt5.3.0/5.3/gcc_64/include"))	;; set Qt library path unless it's been defined
  (when (file-exists-p irony-qt-include-path-prefix)
    (setq irony-additional-clang-options
	  (append
	   (mapcar (lambda (include-dirs) (concat "-I" include-dirs))
		   (directory-files irony-qt-include-path-prefix t "\\w+"))
	   (split-string (concat "-I" irony-qt-include-path-prefix))
	   irony-additional-clang-options)))
  ;; (push "-code-completion-macros" irony-libclang-additional-flags)
  ;; (push "-code-completion-patterns" irony-libclang-additional-flags)
  )

(defun my-irony-mode-enable ()
  ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
  (when (member major-mode irony-supported-major-modes)
    (irony-mode 1)))

(add-hook 'c++-mode-hook 'my-irony-mode-enable)
(add-hook 'c-mode-hook 'my-irony-mode-enable)
(add-hook 'objc-mode-hook 'my-irony-mode-enable)


(add-to-list 'load-path (expand-file-name "~/git_projects/ac-irony"))
(require 'ac-irony)
(setq ac-disable-faces (delq 'font-lock-string-face ac-disable-faces))

(defun my-ac-irony-setup ()
  (when (member major-mode irony-supported-major-modes) ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
    ;; (setq ac-sources nil)							;; uncomment if other ac-sources are too annoying
    (add-to-list 'ac-sources 'ac-source-irony)
    (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony-async)
    ;; (define-key irony-mode-map (kbd "M-RET") 'ac-complete-irony)
    ))		;; enable irony-mode

(add-hook 'irony-mode-hook 'my-ac-irony-setup)


(message "Using *Irony-mode* for you C/C++.")


(provide 'irony-rewrite-extend)
;;; irony-extend.el ends here
