;;; http://zhuoqiang.me/torture-emacs.html
(defun extend-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun extend-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun extend-set-font (english-fonts
			english-font-size
			chinese-fonts
			&optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)
  (let ((en-font (extend-make-font-string
                  (find-if #'extend-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'extend-font-existsp chinese-fonts)
                            :size chinese-font-size)))

    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)

    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))

(defun extend-default-fonts ()
  (interactive)
  (extend-set-font
   ;; english fonts
   '("Ubuntu Mono" "Monaco" "Monospace" "Source Code Pro" "Inconsolata" "Consolas" "DejaVu Sans Mono" "Courier New") ":pixelsize=18"
   ;; chinese fonts
   '("Microsoft Yahei" "Hei" "黑体" "新宋体" "宋体")))

(if window-system
    (progn (extend-default-fonts))
  (message "（╯－＿－）╯╧╧ Run in terminal will not set fonts for emacs."))

(add-hook 'after-make-frame-hook 'extend-default-fonts)				;; for emacs daemon mode

(provide 'fonts-extend)
