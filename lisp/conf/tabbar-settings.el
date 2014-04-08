;;
;; tabbar
;; (install-elisp "http://www.emacswiki.org/emacs/download/tabbar.el")
;; ______________________________________________________________________
(require 'tabbar)

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの長さ
(setq tabbar-separator '(1.5))

;; 外観変更
(set-face-attribute 'tabbar-default nil
                    :family "Comic Sans MS"
                    :background "black"
                    :foreground "gray72"
                    :height 1.0)
(set-face-attribute 'tabbar-unselected nil
                    :background "black"
                    :foreground "grey72"
                    :box nil)
(set-face-attribute 'tabbar-selected nil
                    :background "black"
                    :foreground "yellow"
                    :box nil)
(set-face-attribute 'tabbar-button nil
                    :box nil)
(set-face-attribute 'tabbar-separator nil
                    :height 1.5)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
  '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-")
  "*Regexps matches buffer names always included tabs.")

(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))

(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; Chrome ライクなタブ切り替えのキーバインド
(global-set-key (kbd "<M-s-right>") 'tabbar-forward-tab)
(global-set-key (kbd "<M-s-left>") 'tabbar-backward-tab)

;; タブ上をマウス中クリックで kill-buffer
(defun my-tabbar-buffer-help-on-tab (tab)
  "Return the help string shown when mouse is onto TAB."
  (if tabbar--buffer-show-groups
      (let* ((tabset (tabbar-tab-tabset tab))
             (tab (tabbar-selected-tab tabset)))
        (format "mouse-1: switch to buffer %S in group [%s]"
                (buffer-name (tabbar-tab-value tab)) tabset))
    (format "\
mouse-1: switch to buffer %S\n\
mouse-2: kill this buffer\n\
mouse-3: delete other windows"
            (buffer-name (tabbar-tab-value tab)))))

(defun my-tabbar-buffer-select-tab (event tab)
  "On mouse EVENT, select TAB."
  (let ((mouse-button (event-basic-type event))
        (buffer (tabbar-tab-value tab)))
    (cond
     ((eq mouse-button 'mouse-2)
      (with-current-buffer buffer
        (kill-buffer)))
     ((eq mouse-button 'mouse-3)
      (delete-other-windows))
     (t
      (switch-to-buffer buffer)))
    ;; Don't show groups.
    (tabbar-buffer-show-groups nil)))

(setq tabbar-help-on-tab-function 'my-tabbar-buffer-help-on-tab)
(setq tabbar-select-tab-function 'my-tabbar-buffer-select-tab)

;;nopcall
;; This are setting for nice tabbar items
;; to have an idea of what it looks like http://imgur.com/b0SNN
;; inspired by Amit Patel screenshot http://www.emacswiki.org/pics/static/NyanModeWithCustomBackground.png

;; Tabbar
;;(require 'tabbar)
;; Tabbar settings
(set-face-attribute 'tabbar-default nil
                    :background "gray20"
                    :foreground "gray20"
                    :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute 'tabbar-unselected nil
                    :background "gray30"
                    :foreground "white"
                    :box '(:line-width 5 :color "gray30" :style nil))
(set-face-attribute 'tabbar-selected nil
                    :background "gray75"
                    :foreground "black"
                    :box '(:line-width 5 :color "gray75" :style nil))
(set-face-attribute 'tabbar-highlight nil
                    :background "white"
                    :foreground "black"
                    :underline nil
                    :box '(:line-width 5 :color "white" :style nil))
(set-face-attribute 'tabbar-button nil
                    :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute 'tabbar-separator nil
                    :background "gray20"
                    :height 0.6)

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label (if tabbar--buffer-show-groups
                    (format "[%s] " (tabbar-tab-tabset tab))
                  (format "%s " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

(provide 'tabbar-settings)
