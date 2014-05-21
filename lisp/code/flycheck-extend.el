;;; delete lisp warning
(eval-after-load 'flycheck '(setq flycheck-checkers
				  (delq 'emacs-lisp-checkdoc flycheck-checkers)))

;; c++11
(add-hook 'c++-mode-hook (lambda() (setq flycheck-clang-language-standard "c++11")))

;;; Qt include path
(when (not (boundp 'flycheck-qt-include-path-prefix))
  (setq flycheck-qt-include-path-prefix "/home/Data/Qt5.3.0/5.3/gcc_64/include"))	;; set Qt library path unless it's been defined
(when (file-exists-p flycheck-qt-include-path-prefix)
    (setq flycheck-clang-include-path
	  (append
	   (mapcar (lambda (include-dirs) (concat "" include-dirs))
		   (directory-files flycheck-qt-include-path-prefix t "\\w+"))
	   (split-string flycheck-qt-include-path-prefix))))

(provide 'flycheck-extend)
