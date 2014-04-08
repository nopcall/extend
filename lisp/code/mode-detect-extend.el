
(add-to-list 'auto-mode-alist '("zsh\\(rc\\)?$" . sh-mode)) ;; zsh config files
(add-to-list 'auto-mode-alist '("zsh\\(rc\\)?.*" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . sh-mode))                           ;; Qt .pro files
(add-to-list 'auto-mode-alist '("CMakeLists.txt$" . cmake-mode))                ;; cmake-mode
(add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))

;; vimrc-mode  =================================================================
(require-package 'vimrc-mode)                                                   ;; highlight mode for vimrc file
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))                 ;; .vim*
(add-to-list 'auto-mode-alist '("pentadactyl\\(rc\\)?$" . vimrc-mode))          ;; also pentadactylrc file
(add-to-list 'auto-mode-alist '("penta\\(rc\\)?$" . vimrc-mode))                ;; also pentadactylrc file

(provide 'mode-detect-extend)
