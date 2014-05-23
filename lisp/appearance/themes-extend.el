;;; themes-extend.el --- Theme
;;; Commentary:
;;;	Theme config for emacs
;;; Code:
(require-package 'zenburn-theme)
(require-package 'solarized-theme)
;; (require-package 'color-theme-solarized)

(setq window-system-default-frame-alist
      '(
	(x									;; if frame created on X display
	 (mouse-wheel-mode . 1)							;; mouse
	 (mouse-wheel-follow-mouse . t)
	 )
	(nil									;; if on term
	 (menu-bar-lines . 0) (tool-bar-lines . 0)
	 (background-color . "black")
	 (foreground-color . "white")
	 (setq x-select-enable-clipboard t)
	 )))									;; detect which way on emacs running

(setq default-frame-alist
      `((top . 16) (left . 0) (width . 82) (height . 40))			;; (menu-bar-lines . 20) (tool-bar-lines . 20)
      )										;; default frame size

(defun gtk-menu-update nil
  "Update MenuBar to fix emacs-gtk menu disappear contents."
  (interactive)
  (menu-bar-mode -1)
  (menu-bar-mode 1)
  (message "(╯‵□′)╯︵┻━┻ *GTK* menubar update success"))			;; Update menubar for gtk version of emacs in linux
(add-hook 'after-init-hook 'gtk-menu-update)					;; Update immediately after emacs startup
(global-set-key (kbd "M-z") 'gtk-menu-update)

;;;===========================================================================
;;; custom setting
;;;===========================================================================
(custom-set-variables
 ;; '(custom-enabled-themes '(zenburn))
 '(custom-enabled-themes '(solarized-light))
)

(custom-set-faces
 '(cursor ((t (:background "#d33682"))))
 )

(provide 'themes-extend)
;;; themes-extend.el ends here
