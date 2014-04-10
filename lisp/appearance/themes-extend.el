;;; themes-extend.el --- Theme
;;; Commentary:
;;;	Theme config for emacs
;;; Code:
(require-package 'zenburn-theme)
(require-package 'color-theme-solarized)

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

(defun menu-update nil
  "Update MenuBar to fix emacs-gtk menu disappear contents."
  (interactive)
  (menu-bar-mode -1)
  (menu-bar-mode 1)
  (message "*GTK* Menubar (╯‵□′)╯︵┻━┻ Update Success-"))			;; Update menubar for gtk version of emacs in linux
(add-hook 'after-init-hook 'menu-update)					;; Update immediately after emacs startup
(global-set-key (kbd "M-z") 'menu-update)

;;;===========================================================================
;;; custom setting
;;;===========================================================================

(custom-set-variables
 '(custom-enabled-themes '(zenburn))
 ;; '(custom-enabled-themes '(solarized-dark))
 )

(custom-set-faces
 '(cursor ((t (:background "#d33682"))))					;; (magenta (if srgb "#d33682" "#c61b6e")) ; (0.7774 0.1080 0.4352)
 )

(provide 'themes-extend)
;;; themes-extend.el ends here
