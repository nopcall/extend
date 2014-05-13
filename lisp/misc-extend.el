;;; misc-extend.el --- misc config
;;; Commentary:
;;;     Personal emacs config
;;; Code:

;; Plugins configuration =======================================================
(setq c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (c-mode . "k&r")
                        (c++-mode . "stroustrup")
                        (other . "linux")))                                     ;; set code style
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))                            ;; c++ mode enable for header files
(add-hook 'before-save-hook 'delete-trailing-whitespace)                        ;; remove whitespace before save buffer
(global-rainbow-delimiters-mode)
(require 'jerry-calendar)							;; calendar
(require 'linum+)                                                               ;; Dynamic line-number at left
;; (global-linum-mode t)                                                        ;; *DISABLE* global line number
(require 'wcy-desktop-settings)                                         	;; wcy-desktop, reserve buffer when quit
(require 'which-func-settings)                  				;; display which function of current cursor in
;; (require 'eldoc-settings)                                               	;; show definition of variable and function

;; wcy-switch-buffer ===========================================================
(require 'wcy-swbuff)                           				;; use C-tab to switch buffer,nedd enable tabbar
(global-set-key (kbd "<C-tab>")
                'wcy-switch-buffer-forward)					;; for quick switch buff
(global-set-key (kbd "<C-S-iso-lefttab>")
                'wcy-switch-buffer-backward)
(setq wcy-switch-buffer-active-buffer-face  'highlight)
(setq wcy-switch-buffer-inactive-buffer-face  'secondary-selection )

;; multifiles ==================================================================
(require-package 'multifiles)                                                   ;; open a buffer *multifile* to store what you type
(require 'multifiles)                                                           ;; will sync back to original file when you close it
(global-set-key (kbd "M-!") 'mf/mirror-region-in-multifile)                     ;; bind to "ALT+!"

;; smooth-scrolling  ===========================================================
(require-package 'smooth-scrolling)
(require 'smooth-scrolling)

;; guide-key ===================================================================
;; (require-package 'guide-key)
;; (require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x 5"
                                     "C-c ;" "C-c ; f" "C-x p" "C-c p"))
(setq guide-key/highlight-command-regexp "rectangle\\|register")
(setq guide-key/popup-window-position 'bottom)
;;(setq guide-key/guide-key-sequence '("C-x"))
;;(setq guide-key/recursive-key-sequence-flag t)
(guide-key-mode t)                                                              ;; Enable guide-key-mode

;; pangu-spacing ===============================================================
(require-package 'pangu-spacing)						;; add space between chinese and english
(require 'pangu-spacing)
(global-pangu-spacing-mode t)

;; rect-mark ===================================================================
(require-package 'rect-mark)                                                    ;; rect-mark C-x r C-@ will show region
(require 'rect-mark)
(add-hook 'picture-mode-hook 'rm-example-picture-mode-bindings)
(define-key ctl-x-map "r\C-@" 'rm-set-mark)                                     ;; for rect-mark
(define-key ctl-x-map [?r ?\C-\\ ] 'rm-set-mark)                                ;; C-x r C-\
(define-key ctl-x-map [?r ?\C-z ] 'rm-set-mark)                                 ;; C-x r C-z
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
(define-key ctl-x-map "r\C-w" 'rm-kill-region)
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)

;; Tabbar-mode =================================================================
;; (require-package 'tabbar)
;; (require 'tabbar-settings)							;; show buffer's name in tabbar and quick switch

;; Fill-column-indicator =======================================================
(require-package 'fill-column-indicator)
(setq fci-rule-width 2)
(setq fci-rule-color "#272822")                                                 ;; set for x window
(setq fci-always-use-textual-rule nil)                                          ;; always use textual rule
;; (setq fci-handle-truncate-lines nil)                                          ;; set truncate-lines to true so don't use fci to handle it
(setq line-move-visual t)                                                       ;; move-live step by line

(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (fci-mode t)
    (setq line-move-visual t)                                                   ;; move-live step by line
    ))
(global-fci-mode t)                                                             ;; enable fci-mode as a global-minor-mode

;; ag ==========================================================================
(require-package 'ag)                                                           ;; ag is faster than ack (witch is faster then grep)
(setq ag-highlight-search t)
;;(global-set-key (kbd "<f5>") 'ag-project)
;;(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)

;; bm ==========================================================================
(require-package 'bm)                                                           ;; mark different code area in buffer and you can quickly find them
(require 'bm)
(global-set-key (kbd "<C-f2>")  'bm-toggle)
(global-set-key (kbd "<f2>")    'bm-show)
(global-set-key (kbd "<M-f2>")  'bm-next)
(global-set-key (kbd "<S-f2>")  'bm-previous)
;;(global-set-key (kbd "<left-fringe> <mouse-5>") 'bm-next-mouse)
;;(global-set-key (kbd "<left-fringe> <mouse-4>") 'bm-previous-mouse)
;;(global-set-key (kbd "<left-fringe> <mouse-1>") 'bm-toggle-mouse)

;; smart-compile ===============================================================
(require-package 'smart-compile)						;; quick and smart compiler for project
(autoload 'smart-compile "smart-compile" nil t)
(global-set-key [C-f7] 'smart-compile)

;; smartparents ================================================================
(require-package 'smartparens)  						;; symbol completion
(require 'smartparens-config)
(smartparens-global-mode t)

;; xcscope =====================================================================
(when (executable-find "cscope")
  (add-hook 'c-mode-common-hook
            '(lambda ()
               (require 'xcscope)))						;; xcscope
  ;; (require 'xcscope+)								;; xcscope plus
  ;; (setq cscope-do-not-update-database t)
  )

;; welcome message =============================================================
;; (require 'scratch-conf)

;; C typedef message ===========================================================
(require-package 'ctypes)                                                       ;; highlight the variable of typedef for C
(ctypes-auto-parse-mode t)

;; quick-jump ==================================================================
;;el-get;;(require 'quick-jump)                                                 ;; quick-jump mode

;; browse-kill-ring ============================================================
(require-package 'browse-kill-ring)                                             ;; cache the deleted code
(setq browse-kill-ring-highlight-current-entry t)
(setq browse-kill-ring-no-duplicates t)
(setq browse-kill-ring-display-duplicates nil)
(setq browse-kill-ring-highlight-inserted-item nil)
(setq browse-kill-ring-quit-action 'save-and-restore)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;; buffer-move =================================================================
(require-package 'buffer-move)                                                  ;; buffer-move

;; xmsi-math-symbols-input =====================================================
(autoload 'xmsi-mode "xmsi-math-symbols-input"
  "Load xmsi minor mode for inputting math (Unicode) symbols." t)
(xmsi-mode t)									;; use shift+space to show math symbols

;; window-number ===============================================================
(require-package 'window-number)                                                ;; jump to specific window Alt+1 2 3 4 ...
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
 numbers with the C-x C-j prefix.  Another mode,
 `window-number-meta-mode' enables the use of the M- prefix."
  t)
(window-number-mode t)
(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
 windows, use `window-number-mode' to display the window numbers in
 the mode-line."
  t)
(window-number-meta-mode t)

;; golden-ratio ================================================================
(require-package 'golden-ratio)                                                 ;; resizing automatically the windows to "Golden Ratio".
(golden-ratio-mode t)

;; sr-speedbar =================================================================
(require-package 'sr-speedbar)
(defadvice sr-speedbar-open (around ome-sr-speedbar-open disable)
  ad-do-it
  (with-current-buffer sr-speedbar-buffer-name
    (setq window-size-fixed 'width)))
(defun ome-sr-speedbar-setup ()
  (ad-enable-advice 'sr-speedbar-open 'around 'ome-sr-speedbar-open)
  (ad-activate 'sr-speedbar-open)
  (setq sr-speedbar-skip-other-window-p t)
  (setq sr-speedbar-right-side nil))                                            ;; keep speedbar window width after resizing
(require 'sr-speedbar)

;; asm-mode =====================================================================
;; (add-to-list 'auto-mode-alist '("\\.S\\'" . asm-mode))
;; (setq asm-comment-char ?\#)
(defun arm-asm-mode-hook ()
  (when (string-match ".S$" (buffer-file-name))                                 ;; asm files ending in .S are usually arm assembler
    (set (make-local-variable 'indent-line-function) 'indent-relative)          ;; Get the newlines right
    (define-key asm-mode-map "\C-m" 'newline-and-indent)                        ;; `newline-and-indent' calls `indent-line-function'
    (setq comment-column 30)))                                                  ;; Get the comments right
(add-hook 'asm-mode-hook 'arm-asm-mode-hook)
(defun arm-asm-mode-set-comment-hook ()
  (when (string-match ".S$" (buffer-file-name))
    (setq asm-comment-char ?@)))                                                ;; asm files ending in .S are usually arm assembler
(add-hook 'asm-mode-set-comment-hook 'arm-asm-mode-set-comment-hook)

;; ggtags ======================================================================
(require-package 'ggtags)                                                       ;; GNU/global frontend
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (require 'ggtags)
              (ggtags-mode t))))

;; myfunctions =================================================================
(require 'collectfunctions)                                                     ;; collected functions

(provide 'misc-extend)
;;; misc-extend.el ends here

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
