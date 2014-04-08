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
	 (mouse-avoidance-mode . 'exile)
	 (custom-set-faces							;; ajust color for powerline
	  '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
	  '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil))))
	  ))
	(nil									;; if on term
	 (menu-bar-lines . 0) (tool-bar-lines . 0)
	 (background-color . "black")
	 (foreground-color . "white")
	 (setq x-select-enable-clipboard t)
	 )))									;; detect which way on emacs running

(setq default-frame-alist
      `((top . 16) (left . 0) (width . 82) (height . 40)))			;; (menu-bar-lines . 20) (tool-bar-lines . 20)

;;;===========================================================================
;;; custom setting
;;;===========================================================================

(custom-set-variables
 '(custom-enabled-themes '(zenburn))
 ;; '(custom-enabled-themes '(color-theme-solarized-dark))
 )

(custom-set-faces
 ;; '(mode-line ((t (:foreground "#dc8cc3" :background "#5f5f5f" :box nil))))
 ;; '(mode-line-inactive ((t (:foreground "#dcdccc" :background "#5f5f5f" :box nil))))
 '(cursor ((t (:background "#d33682"))))					;; (magenta (if srgb "#d33682" "#c61b6e")) ; (0.7774 0.1080 0.4352)
 )

(provide 'themes-extend)
;;; themes-extend.el ends here
