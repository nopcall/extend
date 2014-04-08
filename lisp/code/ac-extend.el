;;; ac-extend.el --- auto-complete extend config
;;; Commentary:
;;;	use company-mode backend for auto-complete
;;; Code:

(require-package 'auto-complete)
(ac-config-default)								;; auto-complete  default config especially deal with yasnippet automatically
;; (setq ac-auto-start 4)								;; start complete after input 4 characters
(setq ac-auto-show-menu 0.1)							;; delay time to show completion menu items
(setq ac-show-menu-immediately-on-auto-complete t)
;; (setq ac-use-menu-map t)							;; use C-n and C-p to move selection
;; (setq ac-dwim t)								;; dwim - "do what i mean"
(setq ac-quick-help-delay 0.5)
;; (setq ac-quick-help-height 60)
;; (ac-clear-dictionary-cache)
;; (ac-flyspell-workaround)
;; (setq ac-disable-inline t)
;; (setq ac-candidate-menu-min 0)						;; the min number of candidates to show complete menu
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/extend/dict")		;; personal dictionary
;; (add-to-list 'ac-sources (quote (ac-source-semantic
;;				 ac-source-gtags
;;				 )))						;; add source to auto-complete becarefull it will make Emacs slow

;; (require-package 'ac-c-headers)						;; c-header backend to auto-complete
;; (require 'ac-c-headers)
;; (add-hook 'c-mode-hook
;; 	  (lambda ()
;; 	    (add-to-list 'ac-sources 'ac-source-c-headers)
;; 	    (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

(ac-set-trigger-key "TAB")
(define-key ac-completing-map (kbd "M-RET") 'ac-help)

;; (custom-set-faces
;;  '(ac-candidate-face   ((t (:background "yellow" :foreground "black" :underline "darkgray"))))
;;  '(ac-selection-face   ((t (:background "steelblue"))))
;;  )										;; change auto-complete condidate menu color

(provide 'ac-extend)
;;; ac-extend.el ends here
