;;; binding-extend.el --- Keybinding
;;; Commentary:
;;;	Personal keybindigns
;;; Code:

(global-set-key (kbd "C-x r q")
                'save-buffers-kill-terminal)					;; really quit

(global-set-key (kbd "C-x C-c")
                (lambda () (interactive)
		  (if (executable-find todochiku-command)
		      (todochiku-message "EMACS QUIT" "Wanna quit? Use < C-x r q > (really quit!)." (todochiku-icon 'emacs))
		    (message "Wanna quit? Use < C-x r q > (really quit!)."))))	;; replace C-x C-c to display quit message
(global-set-key (kbd "C-x C-z")
                (lambda () (interactive)
		  (if (executable-find todochiku-command)
		      (todochiku-message "EMACS SLEEP" "Wanna Sleep? No way" (todochiku-icon 'emacs))
		    (message "Wanna Sleep? No way"))))

(define-key key-translation-map [?\C-h] [?\C-?])				;; 设定Ctrl+h为删除光标前一个字符
(global-set-key (kbd "M-h") 'backward-kill-word)				;; 设定Alt+h为删除光标前一个词
(global-set-key (kbd "C-M-z") 'zap-to-char)					;; 删除直到某字符

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)				;; multiple-curcors

;; windows movement
(global-set-key (kbd "C-c w s")  'swap-windows)					;; window and buffer movement
(global-set-key (kbd "C-c w r")  'rotate-windows)
(global-set-key (kbd "C-c w p")  'buf-move-up)
(global-set-key (kbd "C-c w n")  'buf-move-down)
(global-set-key (kbd "C-c w b")  'buf-move-left)
(global-set-key (kbd "C-c w f")  'buf-move-right)
(global-set-key (kbd "C-c w .") 'shrink-window-horizontally)
(global-set-key (kbd "C-c w ,") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c w /") (lambda () (interactive) (enlarge-window -1)))
(global-set-key (kbd "C-c w '") (lambda () (interactive) (enlarge-window 1)))

(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)			;; This is your old M-x.

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
            ;; table
            (local-set-key "\M-\C-w" 'org-table-copy-region)
            (local-set-key "\M-\C-y" 'org-table-paste-rectangle)
            (local-set-key "\M-\C-l" 'org-table-sort-lines)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; fix tab
            (local-set-key "\C-y" 'yank)
            ;; yasnippet (allow yasnippet to do its thing in org files)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field)))			;; org-mode

;; swap C-. with C-; for purcell/emacs.d
(global-set-key (kbd "C-;") 'set-mark-command)
(global-set-key (kbd "C-x C-;") 'pop-global-mark)
(global-set-key (kbd "C-.") 'ace-jump-char-mode)				;; ace-jump-char-mode
(global-set-key (kbd "C-,") 'ace-jump-word-mode)
;;(define-key global-map (kbd "C-c SPC") 'ace-jump-line-mode)
;;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;;(global-set-key (kbd "") 'tabbar-backward-group)				;; for tabbar-mode
;;(global-set-key (kbd "") 'tabbar-forward-group)
;;(global-set-key (kbd "") 'tabbar-backward)
;;(global-set-key (kbd "") 'tabbar-forward)


;;(global-set-key (kbd "C-x j p") 'quick-jump-go-back)				;; quick-jump mode
;;(global-set-key (kbd "C-x j b") 'quick-jump-go-back)
;;(global-set-key (kbd "C-x j m") 'quick-jump-push-marker)
;;(global-set-key (kbd "C-x j n") 'quick-jump-go-forward)
;;(global-set-key (kbd "C-x j f") 'quick-jump-go-forward)
;;(global-set-key (kbd "C-x j c") 'quick-jump-clear-all-marker)

(global-set-key (kbd "C-c d f") 'diff-buffer-with-file)				;; diff shortcuts

;;Vertical naviation
;;(global-set-key  (kbd "M-U") (lambda () (interactive) (forward-line -10)))
;;(global-set-key  (kbd "M-D") (lambda () (interactive) (forward-line 10)))
;;(global-set-key  (kbd "M-p") 'outline-previous-visible-heading)
;;(global-set-key  (kbd "M-n") 'outline-next-visible-heading)

;; Jump to a definition in the current file.
(global-set-key (kbd "C-x C-i") 'idomenu)

(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)

;;disable mouse event
(dolist (keys '(
	       [drag-mouse-1]
	       [drag-mouse-2]
	       ;; [mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
	       ;; [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
	       ;; [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
	       ;; [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
	       ;; [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]
	       ))
    (global-unset-key keys))							;; disable mouse event


(provide 'binding-extend)
;;; binding-extend.el ends here
