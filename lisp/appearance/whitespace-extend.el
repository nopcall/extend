(require 'whitespace)                                                           ;; 折行提示线 行尾标识符等

(setq-default whitespace-line-column 82)					;; 修改默认的长度
(setq whitespace-style '(face lines-tail newline
                              tab-mark newline-mark))                           ;; not include "empty && space && space-mark && trailing"
(setq whitespace-display-mappings
      '(
        ;; (tab-mark 9 [166 9] [8614 9] [92 9])                                    ;; 9 TAB, 166[¦] 8614[↦] 92[\]
        ;; (space-mark 32 [183] [46])                                              ;; 32 SPACE, 183[·] 46[.]
        ;; (newline-mark 10 [8617 10])                                             ;; 10 Return, 9166[⏎] 8629 [↵] 8617[↩]
 	))

(eval-after-load "whitespace"
  `(defun whitespace-post-command-hook ()
     "Hack whitespace, it's very slow in c++-mode."))
(global-whitespace-mode t)

(custom-set-faces
 ;; '(whitespace-space ((t (:bold t :foreground "gray75"))))
 ;; '(whitespace-empty ((t (:foreground "firebrick" :background "SlateGray1"))))
 ;; '(whitespace-hspace ((t (:foreground "lightgray" :background "LemonChiffon3"))))
 ;; '(whitespace-indentation ((t (:foreground "firebrick" :background "beige"))))
 ;; '(whitespace-line ((t (:foreground "black" :background "red"))))
 ;; '(whitespace-newline ((t (:foreground "orange" :background "blue"))))
 ;; '(whitespace-space-after-tab ((t (:foreground "black" :background "green"))))
 ;; '(whitespace-space-before-tab ((t (:foreground "black" :background "DarkOrange"))))
 ;; '(whitespace-tab ((t (:foreground "blue" :background "white"))))
 ;; '(whitespace-trailing ((t (:foreground "red" :background "yellow"))))
 )

(provide 'whitespace-extend)
;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:
