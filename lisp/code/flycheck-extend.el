;;;  delete
;; (eval-after-load 'flycheck '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

;; std
(add-hook 'c++-mode-hook (lambda() (setq flycheck-clang-language-standard "c++11")))

;;; Qt include path
(setq flycheck-qt-include-prefix "/home/Data/Qt5.2.1/5.2.1/gcc_64/include")
(when (file-exists-p flycheck-qt-include-prefix)
  (setq	flycheck-clang-include-path
	(directory-files flycheck-qt-include-prefix t "\\w+")))

(setq flycheck-clang-include-path
      (append '("/home/Data/Qt5.2.1/5.2.1/gcc_64/include")
	      flycheck-clang-include-path))

(defun flycheck-clang-qt-path ()
  (interactive)
  (let ((dirs (directory-files flycheck-qt-include-prefix)))
    (dolist (var dirs)
      ;; (print var)
      (unless (string-match "^\\." var)
        (add-to-list 'flycheck-clang-include-path
		     (expand-file-name var flycheck-qt-include-prefix))))))

;; (flycheck-clang-qt-path)

(provide 'flycheck-extend)
