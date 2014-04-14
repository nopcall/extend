;;; package --- Summary
;;; Commentary:
;;; Code:

;; This file come from emacs/rocks(https://github.com/magnars/expand-region.el.git)

(setq ido-use-virtual-buffers nil)						;; Interactively Do Things
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)

(require-package 'flx-ido)							;; Try out flx-ido for better flex matching between words
(flx-ido-mode 1)

(require-package 'ido-vertical-mode)						;; flx-ido looks better with ido-vertical-mode
(ido-vertical-mode)

(defun sd/ido-define-keys ()
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "M-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "<down>") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "M-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "<up>") 'ido-prev-match))			;; C-n/p is more intuitive in vertical layout

(add-hook
 'ido-setup-hook
 (lambda ()
   (define-key ido-file-completion-map
     (kbd "~")
     (lambda ()
       (interactive)
       (cond
        ((looking-back "~/") (insert "projects/"))
        ((looking-back "/") (insert "~/"))
        (:else (call-interactively 'self-insert-command)))))			;; Go straight home

   (define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-updir)	;; Use C-w to go back up a dir to better match normal usage of C-w
   (define-key ido-file-completion-map
     (kbd "C-x C-w") 'ido-copy-current-file-name)))				;; - insert current file name with C-x C-w instead.

(set-default 'imenu-auto-rescan t)						;; Always rescan buffer for imenu

(add-to-list 'ido-ignore-directories "target")					;; ignore specific directory
(add-to-list 'ido-ignore-directories "node_modules")

(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))								;; Fix ido-ubiquitous for newer packages

(ido-ubiquitous-use-new-completing-read webjump 'webjump)
(ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)

(provide 'ido-extend)
;;; ido-extend.el ends here
