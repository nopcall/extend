;;; yasnippet-extend.el --- yasnippet
;;; Commentary:
;;;	yasnippet config
;;; Code:

(require-package 'yasnippet)
(yas-global-mode 1)

;; Use only own snippets, do not use bundled ones
;; (setq yas-snippet-dirs (expand-file-name "snippets" extend-directory))
;; (yas/load-directory (expand-file-name "snippets" extend-directory))

(require-package 'dropdown-list)						;; use dropdown-list for yasnippet dropdowns
(require 'dropdown-list)
(setq yas-prompt-functions '(yas-dropdown-prompt
			     yas-completing-prompt
			     yas-ido-prompt))

;; (setq yas-verbosity 1)								;; No need to be so verbose
;; (setq yas-wrap-around-region t)							;; Wrap around region

(defun yas-goto-end-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
	 (position (yas--field-end (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-end-of-line 1)
      (goto-char position))))
(defun yas-goto-start-of-active-field ()
  (interactive)
  (let* ((snippet (car (yas--snippets-at-point)))
	 (position (yas--field-start (yas--snippet-active-field snippet))))
    (if (= (point) position)
        (move-beginning-of-line 1)
      (goto-char position))))
;; (define-key yas-keymap (kbd "C-e") 'yas-goto-end-of-active-field)		;; Jump to end of snippet definition
;; (define-key yas-keymap (kbd "C-a") 'yas-goto-start-of-active-field)

(define-key yas-keymap (kbd "M-<right>") 'yas-next-field-or-maybe-expand)
(define-key yas-keymap (kbd "M-<left>") 'yas-prev-field)
(define-key yas-keymap (kbd "<return>") 'yas-exit-all-snippets)


(provide 'yasnippet-extend)
;;; yasnippet-extend ends here
