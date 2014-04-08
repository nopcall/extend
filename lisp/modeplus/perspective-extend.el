;;; perspective-extend.el --- perspective mode
;;; Commentary:
;;; Perspective mode like workdspace in gnome, it make you change project more easily
;;; Code:

(require-package 'persp-mode)
(persp-mode t)									;; Enable perspective mode
(setq wg-morph-on nil)								;; switch off animation of restoring window configuration
(setq persp-when-kill-switch-to-buffer-in-perspective t)
(setq persp-save-dir (expand-file-name ".persp-saves/" extend-directory))	;; set persp store directory

;; TODO: implement persp-last as before-advice on persp-switch (?)

(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
     (setq persp-last current-perspective)))

;; Jump to last perspective
(defun custom-persp-last ()
  (interactive)
  (persp-switch (persp-name persp-last)))

(define-key persp-mode-map (kbd "C-x p -") 'custom-persp-last)

(define-key persp-mode-map (kbd "C-x p n") #'persp-add-new)
(define-key persp-mode-map (kbd "C-x p s") #'persp-switch)
(define-key persp-mode-map (kbd "C-x p r") #'persp-rename)
(define-key persp-mode-map (kbd "C-x p c") #'persp-kill)
(define-key persp-mode-map (kbd "C-x p a") #'persp-add-buffer)
(define-key persp-mode-map (kbd "C-x p i") #'persp-import-buffers)
(define-key persp-mode-map (kbd "C-x p k") #'persp-remove-buffer)
(define-key persp-mode-map (kbd "C-x p w") #'persp-save-state-to-file)
(define-key persp-mode-map (kbd "C-x p l") #'persp-load-state-from-file)

(provide 'perspective-extend)
;;; perspective-extend.el ends here
