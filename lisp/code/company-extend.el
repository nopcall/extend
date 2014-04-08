;;; company-extend.el --- company-mode
;;; Commentary:
;;;	company-mode config
;;; Code:
(require-package 'company)							;; company-mode
(autoload 'company-mode "company" nil t)
(setq company-idle-delay nil)							;; auto display match item but it's slow.
;; (setq company-backends
;;       (quote (company-elisp company-ispell company-nxml company-css
;; 			    company-semantic company-clang company-eclim
;; 			    company-xcode company-ropemacs
;; 			    (company-gtags company-etags company-dabbrev-code company-keywords)
;; 			    company-oddmuse company-files company-dabbrev)))	;; company backends
(setq company-backends
      (quote (company-clang company-files company-dabbrev
			    (company-gtags company-etags
					   company-dabbrev-code company-keywords)
			    )))							;; company backends
(when (eq system-type 'gnu/linux)
  (setq ispell-complete-word-dict "/usr/share/dict/cracklib-small"))		;; must set a complete-word-dict for company-ispell backend

(add-hook 'after-init-hook 'global-company-mode)				;; enable in all buffer;
(global-set-key (kbd "<s-tab>") 'company-complete-common)			;; super + tab


(custom-set-faces
;; '(company-preview   ((t (:foreground "darkgray" :underline t))))
;; '(company-preview-common   ((t (:inherit company-preview))))
;; '(company-tooltip   ((t (:background "lightgray" :foreground "black"))))
;; '(company-tooltip-selection   ((t (:background "steelblue" :foreground "white"))))
;; '(company-tooltip-common   ((((type x)) (:inherit company-tooltip :weight bold))    (t (:inherit company-tooltip))))
;; '(company-tooltip-common-selection   ((((type x)) (:inherit company-tooltip-selection :weight bold))    (t (:inherit company-tooltip-selection))))
 )
(provide 'company-extend)
;;; company-extend ends here
