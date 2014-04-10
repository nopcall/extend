;;{{{ 像vi下的f键功能一样,当启用该功能后输入a将会跳到光标后第一个a处,再按次a可到第2个a处.依此类推
(defun vif-go-to-char-forward (n char)
  "Move forward to Nth occurence of CHAR.
Typing `vif-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char forward: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

(defun vif-go-to-char-backward (n char)
  "Move backward to Nth occurence of CHAR.
Typing `vif-go-to-char-key' again will move backward to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char backward: ")
  (search-backward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-backward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(global-set-key (kbd "C-z") 'vif-go-to-char-forward)				;; 向前找某字符 跟vi下的f键 相似
;;}}}

;;{{{ Update menubar for gtk version of emacs in linux
(defun menu-update nil
  "Update MenuBar to fix emacs-gtk menu disappear contents."
  (interactive)
  (menu-bar-mode -1)
  (menu-bar-mode 1)
  (message "--- *GTK* Menubar (╯‵□′)╯︵┻━┻ Update Success ---"))
(add-hook 'after-init-hook 'menu-update)					;; update immediately after emacs startup
(global-set-key (kbd "M-z") 'menu-update)					;; update the gtk menubar
;;}}}

;;{{{ 复制行
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line"
  (interactive "P")
  (let ((beg (line-beginning-position))
	(end (line-end-position arg)))
    (copy-region-as-kill beg end))
  )
(global-set-key (kbd "C-c C-w") 'copy-line)
;;}}}

;;{{{ 复制词
(defun copy-word (&optional arg)
 "Copy words at point"
 (interactive "P")
 (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point)))
	(end (progn (forward-word arg) (point))))
 (copy-region-as-kill beg end))
 )
;;}}}

;;{{{ 复制段
(defun copy-paragraph (&optional arg)
 "Copy paragraphes at point"
 (interactive "P")
 (let ((beg (progn (backward-paragraph 1) (point)))
	(end (progn (forward-paragraph arg) (point))))
 (copy-region-as-kill beg end))
 )
;;}}}

;;{{{ add new line above current line, don't worry about the cursor
(defun newline-up nil
  "open new line up current line"
  (interactive)
  (beginning-of-line)
  (newline)
  (backward-char))
;;}}}

;;{{{ 在文档里插入时间，用户名还有系统的信息
(defun my-stamp (&optional arg)
  "Insert current date, user, and system information.
With optional argument ARG, use \"*Created: -- *\" format."
  (interactive "*P")
  ;; Get this from time-stamp-format somehow?
  (let ((string (format " %s %s on %s "
                        (format-time-string " %04y-%02m-%02d %02H:%02M:%02S")
                        user-login-name
                        system-name)))
    (if arg (setq string (format "*Creation: %s*" string)))
    (if (interactive-p)
        (insert string)
      string)))
;;}}}

;;{{{ insert time stamp
(defun my-timestamp ()
  "Insert the \"Time-stamp: <>\" string at point."
  (interactive)
  (if (interactive-p)
      (insert " Time-stamp: <>")
    " Time-stamp: <>"))
;;}}}

;;{{{ find the longest line of current buffer
(defun my-longest-line (&optional goto)
  "Find visual length (ie in columns) of longest line in buffer.
If optional argument GOTO is non-nil, go to that line."
  (interactive "p")                    ; NB not p
  (let ((maxlen 0)
        (line 1)
        len maxline)
    (save-excursion
      (goto-char (point-min))
      (goto-char (line-end-position))
      ;; Not necessarily same as line-end - line-beginning (eg tabs)
      ;; and this function is for visual purposes.
      (setq len (current-column))
      (if (eobp)                        ; 1 line in buffer
          (setq maxlen len
                maxline line)
        (while (zerop (forward-line))
          (goto-char (line-end-position))
          (setq line (1+ line)
                len (current-column))
          (if (> len maxlen)
              (setq maxlen len
                    maxline line)))))
    (if (not (interactive-p))
        maxlen
      (message "最长的一行是第%s行 (%s)" maxline maxlen)
      ;(message "Longest line is line %s (%s)" maxline maxlen)
      (if goto (goto-line maxline)))))
;;}}}

;;{{{ 打印出我的键盘图，很酷吧－全部热键都显示出来，呵呵
(defun my-keytable (arg)
  "Print the key bindings in a tabular form.
Argument ARG Key."
  (interactive "sEnter a modifier string:")
  (with-output-to-temp-buffer "*Key table*"
    (let* ((i 0)
           (keys (list "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n"
                       "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
                       "<return>" "<down>" "<up>" "<right>" "<left>"
                       "<home>" "<end>" "<f1>" "<f2>" "<f3>" "<f4>" "<f5>"
                       "<f6>" "<f7>" "<f8>" "<f9>" "<f10>" "<f11>" "<f12>"
                       "1" "2" "3" "4" "5" "6" "7" "8" "9" "0"
                       "`" "~" "!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "-" "_"
                       "=" "+" "\\" "|" "{" "[" "]" "}" ";" "'" ":" "\""
                       "<" ">" "," "." "/" "?"))
           (n (length keys))
           (modifiers (list "" "C-" "M-" "S-" "M-C-" "S-C-")))
      (or (string= arg "") (setq modifiers (list arg)))
      (setq k (length modifiers))
      (princ (format " %-10.10s |" "Key"))
      (let ((j 0))
        (while (< j k)
          (princ (format " %-50.50s |" (nth j modifiers)))
          (setq j (1+ j))))
      (princ "\n")
      (princ (format "_%-10.10s_|" "__________"))
      (let ((j 0))
        (while (< j k)
          (princ (format "_%-50.50s_|"
                         "__________________________________________________"))
          (setq j (1+ j))))
      (princ "\n")
      (while (< i n)
        (princ (format " %-10.10s |" (nth i keys)))
        (let ((j 0))
          (while (< j k)
            (let* ((binding
                    (key-binding (read-kbd-macro (concat (nth j modifiers)
                                                         (nth i keys)))))
                   (binding-string "_"))
              (when binding
                (if (eq binding 'self-insert-command)
                    (setq binding-string (concat "'" (nth i keys) "'"))
                  (setq binding-string (format "%s" binding))))
              (setq binding-string
                    (substring binding-string 0 (min (length
                                                      binding-string) 48)))
              (princ (format " %-50.50s |" binding-string))
              (setq j (1+ j)))))
        (princ "\n")
        (setq i (1+ i)))
      (princ (format "_%-10.10s_|" "__________"))
      (let ((j 0))
        (while (< j k)
          (princ (format "_%-50.50s_|"
                         "__________________________________________________"))
          (setq j (1+ j))))))
  (delete-window)
  (hscroll-mode)
  (setq truncate-lines t))              ; for emacs 21
;;}}}

;;{{{ copy lines
(defun my-copy-lines(&optional arg)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (next-line arg)
    (kill-ring-save (mark) (point))))
;;}}}

;;{{{ 使用%就可以上下翻动,匹配的括号 如果没有括号就输入%	--王垠创作
(defun my-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %.
Argument ARG paren."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
;;	((looking-at "\\s\<") (forward-list 1) (backward-char 1))
;;	((looking-at "\\s\>") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(global-set-key (kbd "%") 'my-match-paren)					;; 当光标在一个括号上是按%会跳到匹配的括号,否则输出%
;;}}}

;;{{{
(defadvice kill-buffer (around kill-buffer-around-advice activate)
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*scratch*")
        (bury-buffer)
      ad-do-it)))                                                               ;; bury *scratch* buffer instead of kill it
;;}}}

;;;{{{
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
;;;}}}

;;;{{{
(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))
;;;}}}

;;;{{{ recently open file
(defun file-name-with-one-directory (file-name)
  (concat (cadr (reverse (split-string file-name "/"))) "/"
          (file-name-nondirectory file-name)))

(defun recentf--file-cons (file-name)
  (cons (file-name-with-one-directory file-name) file-name))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let* ((recent-files (mapcar 'recentf--file-cons recentf-list))
         (files (mapcar 'car recent-files))
         (file (completing-read "Choose recent file: " files)))
    (find-file (cdr (assoc file recent-files)))))
;;;}}}

;;;{{{
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun copy-current-file-path ()
  "Add current file path to kill ring. Limits the filename to project root if possible."
  (interactive)
  (let ((filename (buffer-file-name)))
    (kill-new (if eproject-mode
                  (s-chop-prefix (eproject-root) filename)
                filename))))

(defun find-or-create-file-at-point ()
  "Guesses what parts of the buffer under point is a file name and opens it."
  (interactive)
  (find-file (file-name-at-point)))

(defun find-or-create-file-at-point-other-window ()
  "Guesses what parts of the buffer under point is a file name and opens it."
  (interactive)
  (find-file-other-window (file-name-at-point)))

(defun file-name-at-point ()
  (save-excursion
    (let* ((file-name-regexp "[./a-zA-Z0-9\-_~]")
           (start (progn
                    (while (looking-back file-name-regexp)
                      (forward-char -1))
                    (point)))
           (end (progn
                  (while (looking-at file-name-regexp)
                    (forward-char 1))
                  (point))))
      (buffer-substring start end))))

(defun touch-buffer-file ()
  (interactive)
  (insert " ")
  (backward-delete-char 1)
  (save-buffer))
;;;}}}

;;{{{ Navigate Brackets
;;stolen frome ergoemacs http://ergoemacs.org/emacs/emacs_navigating_keys_for_brackets.html
(defun ergoemacs-forward-open-bracket ()
  "Move cursor to the next occurrence of left bracket or quotation mark."
  (interactive)
  (forward-char 1)
  (search-forward-regexp (regexp-opt '("\"" "(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«")) nil t)
;;  (search-forward-regexp "\\s(\\|\\s\"\\|<\\|“\\|‘\\|‹") ; using syntax table
  (backward-char 1))

(defun ergoemacs-backward-open-bracket ()
  "Move cursor to the previous occurrence of left bracket or quotation mark.."
  (interactive)
  (search-backward-regexp (regexp-opt '("\"" "(" "{" "[" "<" "〔" "【" "〖" "〈" "《" "「" "『" "“" "‘" "‹" "«")) nil t))

(defun ergoemacs-forward-close-bracket ()
  "Move cursor to the next occurrence of right bracket or quotation mark."
  (interactive)
   (search-forward-regexp (regexp-opt '("\"" ")" "\\]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»")) nil t)
;;  (search-forward-regexp "\\s)\\|\\s\"\\|>\\|”\\|’\\|›") ;using syntax table
 )

(defun ergoemacs-backward-close-bracket ()
  "Move cursor to the previous occurrence of right bracket or quotation mark."
  (interactive)
  (backward-char 1)
  (search-backward-regexp (regexp-opt '("\"" ")" "\\]" "}" ">" "〕" "】" "〗" "〉" "》" "」" "』" "”" "’" "›" "»")) nil t)
  (forward-char 1))
(defun ergoemacs-forward-block ()
  "Move cursor forward to the beginning of next text block.
A text block is separated by 2 empty lines (or line with just whitespace).
In most major modes, this is similar to `forward-paragraph', but this command's behavior is the same regardless of syntax table."
  (interactive)
  (if (search-forward-regexp "\n[[:blank:]\n]*\n+" nil "NOERROR")
      (progn (backward-char))
    (progn (goto-char (point-max)) )
    )
  )

(defun ergoemacs-backward-block ()
  "Move cursor backward to previous text block.
See: `ergoemacs-forward-block'"
  (interactive)
  (if (search-backward-regexp "\n[\t\n ]*\n+" nil "NOERROR")
      (progn
        (skip-chars-backward "\n\t ")
        (forward-char 1)
        )
    (progn (goto-char (point-min)) )
    )
  )
;; Navigate Brackets
(global-set-key (kbd "<home>") 'ergoemacs-backward-block)
(global-set-key (kbd "<end>") 'ergoemacs-forward-block)
(global-set-key (kbd "<prior>") 'ergoemacs-backward-open-bracket)		;; page up key
(global-set-key (kbd "<next>") 'ergoemacs-forward-close-bracket)		;; page down key
;;(global-set-key (kbd "<M-left>") 'backward-open-bracket)			;; Alt+←
;;(global-set-key (kbd "<M-right>") 'forward-close-bracket)			;; Alt+→

;;}}}

(provide 'collectfunctions)
