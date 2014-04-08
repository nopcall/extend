;;; rtags-extend.el --- Code tags
;;; Commentary:
;;;
;;; Code:
(add-to-list 'load-path "~/git_projects/rtags/src")
(add-to-list 'load-path "~/git_projects/rtags/bin")		;; for rdm daemon
(require 'rtags)

(rtags-enable-standard-keybindings c-mode-base-map)

(provide 'rtags-extend)
;;; rtags-extend.el ends here
