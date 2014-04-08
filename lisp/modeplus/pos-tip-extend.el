;;; TODO: alternative by clippy
(require-package 'pos-tip)							;; pos-tip
(require-package 'clippy)
(require 'clippy)
;; (defadvice popup-menu-show-quick-help
;;     (around pos-tip-popup-menu-show-quick-help () activate)
;;   "Show quick help using `pos-tip-show'."
;;   (if (eq window-system 'x)
;;       (let ((doc (popup-menu-document
;; 		  menu (or item
;; 			   (popup-selected-item menu)))))
;; 	(when (stringp doc)
;; 	  (pos-tip-show doc nil
;; 			(if (popup-hidden-p menu)
;; 			    (or (plist-get args :point)
;; 				(point))
;; 			  (overlay-end (popup-line-overlay
;; 					menu (+ (popup-offset menu)
;; 						(popup-selected-line menu)))))
;; 			nil 0)
;; 	  nil))
;;     ad-do-it))									;; for ac popup help document

;; (defun my-describe-function (function)
;;    "Display the full documentation of FUNCTION (a symbol) in tooltip."
;;    (interactive (list (function-called-at-point)))
;;    (if (null function)
;;        (pos-tip-show
;;         "** You didn't specify a function! **" '("red"))
;;      (pos-tip-show
;;       (with-temp-buffer
;;         (let ((standard-output (current-buffer))
;;               (help-xref-following t))
;;           (prin1 function)
;;           (princ " is ")
;;           (describe-function-1 function)
;;           (buffer-string)))
;;       nil nil nil 0)))
;; (define-key emacs-lisp-mode-map (kbd "C-`") 'my-describe-function)

(provide 'pos-tip-extend)
