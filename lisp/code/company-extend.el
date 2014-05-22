;;; company-extend.el --- company-mode
;;; Commentary:
;;;	company-mode config
;;; Code:

(require-package 'company)							;; company-mode
(autoload 'company-mode "company" nil t)
(add-hook 'after-init-hook 'global-company-mode)				;; enable in all buffer
(setq company-idle-delay nil)							;; auto display match item but it's slow.
(setq company-transformers  '(company-sort-by-occurrence))
(when (eq system-type 'gnu/linux)
  (setq ispell-complete-word-dict "/usr/share/dict/cracklib-small"))		;; must set a complete-word-dict for company-ispell backend
(setq company-backends
      (quote ((company-clang company-files company-dabbrev company-yasnippet
			     company-rtags company-gtags company-etags
			     company-dabbrev-code company-keywords))))		;; company backends

(defun qt-company ()
  "Enable Qt library for buffer then make it local"
  (interactive)
  (when (not (boundp 'company-qt-include-path-prefix))
    (setq company-qt-include-path-prefix "/home/Data/Qt5.3.0/5.3/gcc_64/include"))	;; set Qt library path unless it's been defined
  (when (file-exists-p company-qt-include-path-prefix)
    (setq company-clang-arguments
	  (append
	   (mapcar (lambda (include-dirs) (concat "-I" include-dirs))
	   	   (directory-files company-qt-include-path-prefix t "\\w+"))
	   (split-string (concat "-I" company-qt-include-path-prefix))
	   company-clang-arguments)))
  ;; (push "-code-completion-macros" company-clang-arguments)
  ;; (push "-code-completion-patterns" company-clang-arguments)
  (make-variable-buffer-local 'company-clang-arguments))

(add-hook 'company-mode-hook
	  (lambda ()
	    (define-key company-active-map (kbd "<tab>") 'company-select-next)
	    (define-key company-active-map (kbd "C-n") 'company-select-next)
	    (define-key company-active-map (kbd "C-p") 'company-select-previous)
	    (define-key company-active-map (kbd "C-j") 'company-complete-common)
	    ))

(global-set-key (kbd "M-/") 'company-complete-common)				;; Alt + /

(provide 'company-extend)
;;; company-extend ends here
