;;; custom-extend.el --- custom
;;; Commentary:
;;;	Custom set variables
;;; Code:
(custom-set-variables
 ;; Personal information -------------------------------------------------------
 '(user-name "Nopcall")								;; Personal information
 '(user-full-name "Nopcall Jelaro")
 '(user-mail-address "nopcall@gmail.com")
 '(default-directory "~/")							;; set default work directory
 ;; Usefull settings -----------------------------------------------------------
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(apropos-do-all t)
 '(auto-image-file-mode t)							;; display image
 '(echo-keystrokes 0.1)								;; show pressed key after 0.1 second
 '(save-interprogram-paste-before-kill nil)					;; set for iClipboard in Mac
 '(gc-cons-threshold 20000000)							;; Garbage collect optimization
 '(garbage-collection-messages t)
 ;; Backup setting -------------------------------------------------------------
 ;; '(make-backup-files t)							;; Enable backup
 '(backup-by-copying t)
 '(version-control t)								;; Enable versioning with default values (keep five last versions, I think!)
 '(backup-directory-alist (quote ((".*" . "~/.backups_emacs/"))))		;; Save all backup file in this directory.
 ;; Version-control ------------------------------------------------------------
 '(version-control t)								;; version control , like backup file how many times
 '(kept-new-versions 10)
 '(kept-old-versions 2)
 '(delete-old-versions t)
 ;; tab width setting ----------------------------------------------------------
 '(indent-tabs-mode t)
 ;; '(default-tab-width 8 t)							;; tab 8 chars
 ;; '(c-argdecl-indent 8)
 '(c-basic-offset 8)
 ;; '(c-brace-offset -8)
 ;; '(c-continued-statement-offset 8)
 ;; '(c-indent-level 8)
 ;; '(c-label-offset -8)
 ;; '(sgml-basic-offset 4)
 ;; '(css-indent-level 8)
 ;; '(js-indent-level 8 t)
 ;; '(js2-basic-offset 8 t)
 ;; ispell ---------------------------------------------------------------------
 '(ispell-program-name "aspell")						;; aspell replace with ispell
 '(ispell-extra-args '("--reverse"))						;; fix bug when aspell with ispell
 '(ispell-personal-dictionary (expand-file-name "~/.persenal-dict"))		;; personal dictionary
 '(ispell-silently-savep t)							;; save my dictionary no need to ask
 '(ispell-dictionary "english")							;; set english dictionary
 ;; auto save ------------------------------------------------------------------
 ;; '(auto-save-interval 10)							;; save buffer every 10 key pressed
 ;; '(auto-save-timeout 1)								;; if idle 1 second then save buffer
 ;; '(auto-save-visited-file-name t)						;; only save buffer when it's an exist file name
 ;; Appearence -----------------------------------------------------------------
 '(custom-buffer-style (quote brackets))
 '(enable-recursive-minibuffers t)
 '(blink-cursor-mode nil)							;; do not cursor blink
 '(require-final-newline nil)							;; 不自动添加换行符到末尾, 有些情况会出现错误
 '(fill-column 80)								;; 设置80行自动换行 只在text-mode有效果
 '(mouse-avoidance-mode (quote exile) nil (avoid))				;; 鼠标躲避光标 animate
 ;; '(resize-mini-windows nil t)						;; this make some error whit ido-vertical-mode
 ;; '(sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ ]\\)\\)[]*")	;; 会引起help模式下字符的问题
 '(session-use-package t nil (session))
 '(show-paren-mode t)								;; show matching paren
 '(size-indication-mode t)							;; show file's size on minibuffer
 '(split-width-threshold nil)							;; split windows mode
 '(suggest-key-bindings-1 nil)							;; After M-x function then show function's binding keys
 '(tabbar-separator (quote (0.5)))						;; tabbar的间隔符号宽度
 '(menu-bar-mode t)								;; don't show menubar
 '(set-scroll-bar-mode nil)							;; don't show scrollbar
 '(indicate-buffer-boundaries 'left)						;; 在fringe上显示一个小箭头指示当前buffer的边界
 '(track-eol t)
 '(font-lock-maximum-decoration t)
 '(global-auto-revert-mode t)
 '(global-hl-line-mode t)							;; highlight current line sometimes trouble with mark-region
 '(kill-ring-max 1000)
 '(lazy-lock-defer-on-scrolling t)
 ;; '(scroll-margin 3)								;; scroll-margin 3 在靠近屏幕边沿3行时就开始滚动
 '(scroll-conservatively 10000)
 )

(provide 'custom-extend)
;;; custom-extend.el ends here
