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
