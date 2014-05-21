;;; ac-extend.el --- auto-complete extend config
;;; Commentary:
;;;	use company-mode backend for auto-complete
;;; Code:

(require-package 'auto-complete)
(setq ac-auto-show-menu 0.1)							;; delay time to show completion menu items
(setq ac-show-menu-immediately-on-auto-complete t)
(setq ac-use-menu-map t)							;; use C-n and C-p to move selection
;; (setq ac-dwim t)								;; dwim - "do what i mean"
(setq ac-quick-help-delay 0.5)

(ac-set-trigger-key "TAB")
(define-key ac-completing-map (kbd "M-RET") 'ac-help)

(provide 'ac-extend)
;;; ac-extend.el ends here
