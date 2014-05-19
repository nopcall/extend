;;; delete lisp warning
(eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

;; c++11
(add-hook 'c++-mode-hook (lambda() (setq flycheck-clang-language-standard "c++11")))

;;; Qt include path
(when (not (boundp 'qt-include-path-prefix))
  (setq qt-include-path-prefix "/home/Data/Qt5.2.1/5.2.1/gcc_64/include"))	;; set Qt library path unless it's been defined
(when (file-exists-p qt-include-path-prefix)
  (setq flycheck-clang-include-path
	(append
	 (mapcar (lambda (include-dirs) (concat "" include-dirs))
		 (directory-files qt-include-path-prefix t "\\w+"))
	 (split-string qt-include-path-prefix))))

(provide 'flycheck-extend)
