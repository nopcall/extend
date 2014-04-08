;;; nopcall-theme.el --- A dark place with bright sights.

;; Copyright (C) 2012 Ranmocy Sheng

;; Author: Ranmocy Sheng <ranmocy@gmail.com>
;; Keywords: faces
;; URL: https://github.com/ranmocy/amelie-theme
;; Version: 1.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Inspired by slim-lang.org. Reference to zenburn-theme.
;; Drop it into themes directory defined by `custom-theme-set-faces' and enjoy it.

;;; Requirements:
;;
;; Emacs 24.

;;; Code:

(deftheme nopcall
  "nopcall brighten your eyes. Created 2012-06-16.")

(let ((amelie-fg "#ddd")
      (amelie-bg "#2b2b2b")
      (amelie-fg-hi "white")
      (amelie-bg-hi "#545454")
      (nopcall-fg "#272822")
      (nopcall-bg "#272822")
      (nopcall-region-bg "#7F073F")
      (nopcall-keyword-face "#f92672")
      (nopcall-function-name-face "#f92672")
      (nopcall-variable-name-face "#a6e22e")
      (amelie-grey "#ccc")
      (amelie-grey-1 "#bbb")
      (amelie-grey-2 "#888")
      (amelie-grey-3 "#444")
      (amelie-red "#EA3E33")
      (amelie-orange+1 "#EF907E")
      (amelie-orange "#E75544")
      (amelie-orange-1 "#AC4123")
      (amelie-yellow+1 "#FE8")
      (amelie-yellow "#FB0")
      (amelie-yellow-1 "#B90")
      (amelie-green+1 "#0FB")
      (amelie-green "#50d42b")
      (amelie-green-1 "#54ab54")
      (amelie-cyan "#00eaff")
      (amelie-blue "#01aafe")
      (amelie-magenta "#99aFfF"))
  (custom-theme-set-faces
   'nopcall

   '(compilation-info ((((type tty)) :bold t :foreground "green") (t :foreground "green")))
   '(compilation-warning ((((class color)) :foreground "red" :bold nil)))
   '(completions-first-difference ((((class color) (background dark)) (:foreground "red"))))
   '(eldoc-highlight-function-argument ((((type tty)) :bold t :foreground "green") (t :bold nil :foreground "green")))
   '(font-lock-comment-delimiter-face ((((type tty)) :bold t :foreground "red") (t :foreground "chocolate1")))
   '(font-lock-constant-face ((((type tty)) :bold t :background "white" :foreground "blue") (t :background "darkslateblue" :foreground "chartreuse")))
   '(font-lock-doc-face ((((type tty)) :foreground "green") (t (:foreground "maroon1"))))
   '(font-lock-function-name-face ((((type tty)) :bold t :background "yellow" :foreground "blue") (t :background "#45D463DD4FF8" :foreground "yellow")))
   '(font-lock-regexp-grouping-backslash ((((type tty)) :foreground "red") (t (:foreground "red"))))
   '(font-lock-regexp-grouping-construct ((((type tty)) :foreground "yellow") (t (:foreground "yellow"))))
   '(font-lock-type-face ((((type tty)) :bold t :foreground "green") (t (:foreground "green"))))
   '(font-lock-warning-face ((t (:background "red" :foreground "white"))))
   '(header-line ((default :inherit mode-line) (((type tty)) :foreground "black" :background "yellow" :inverse-video nil) (((class color grayscale) (background light)) :background "grey90" :foreground "grey20" :box nil) (((class color grayscale) (background dark)) :background "#D58EFFFFFC18" :foreground "blue") (((class mono) (background light)) :background "white" :foreground "black" :inverse-video nil :box nil :underline t) (((class mono) (background dark)) :background "black" :foreground "white" :inverse-video nil :box nil :underline t)))
   '(highlight-symbol-face ((((type tty)) :background "white" :foreground "black") (((class color) (background dark)) :background "gray30" :foreground "#AD0DE2FAFFFF") (((class color) (background light)) :background "gray90")))

   '(match ((((class color) (min-colors 88) (background light)) :background "yellow1") (((class color) (min-colors 88) (background dark)) :background "RoyalBlue3" :foreground "cyan") (((class color) (min-colors 8) (background light)) :background "yellow" :foreground "black") (((class color) (min-colors 8) (background dark)) :background "blue" :foreground "white") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
   '(moccur-face ((((type tty)) :bold t :foreground "red") (t :bold nil :foreground "red")))
   '(mode-line-buffer-id ((((class grayscale) (background light)) (:foreground "LightGray" :background "yellow" :weight bold)) (((class grayscale) (background dark)) (:foreground "DimGray" :background "yellow" :weight bold)) (((class color) (min-colors 88) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 88) (background dark)) (:foreground "yellow" :background "HotPink3")) (((class color) (min-colors 16) (background light)) (:foreground "Orchid" :background "yellow")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSteelBlue" :background "yellow")) (((class color) (min-colors 8)) (:foreground "blue" :background "yellow" :weight bold)) (t (:weight bold))))
   '(pulse-highlight-start-face ((((class color) (min-colors 88) (background dark)) :background "#AAAA33") (((class color) (min-colors 88) (background light)) :background "#FFFFAA") (((class color) (min-colors 8)) :background "blue" :foreground "red")))
   '(region ((((class color) (min-colors 88) (background dark)) :background "#4CAA4CAA4CAA") (((class color) (min-colors 88) (background light)) :background "lightgoldenrod2") (((class color) (min-colors 16) (background dark)) :background "wheat") (((class color) (min-colors 16) (background light)) :background "lightgoldenrod2") (((class color) (min-colors 8)) :background "blue" :foreground "red") (((type tty) (class mono)) :inverse-video t) (t :background "gray")))
   '(semantic-highlight-func-current-tag-face ((((type tty)) nil) (((class color) (background dark)) (:background "gray20")) (((class color) (background light)) (:background "gray90"))))
   '(zjl-elisp-hl-function-call-face ((((class grayscale) (background light)) :foreground "LightGray" :weight bold) (((class grayscale) (background dark)) :foreground "DimGray" :weight bold) (((class color) (min-colors 88) (background light)) :foreground "Orchid") (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue") (((class color) (min-colors 16) (background light)) :foreground "Orchid") (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue") (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold))))
   '(zjl-hl-function-call-face ((((class grayscale) (background light)) :foreground "LightGray" :weight bold) (((class grayscale) (background dark)) :foreground "DimGray" :weight bold) (((class color) (min-colors 88) (background light)) :foreground "Orchid") (((class color) (min-colors 88) (background dark)) :foreground "cornflower blue") (((class color) (min-colors 16) (background light)) :foreground "Orchid") (((class color) (min-colors 16) (background dark)) :foreground "LightSteelBlue") (((class color) (min-colors 8)) (:foreground "blue" :weight bold)) (t (:weight bold))))




   ;;   '(linum ((((background dark)) :foreground "#f92672") (t :foreground "gray")))		;;左边的行号颜色

   ;;   '(mode-line ((t (:background "gray10" :foreground "#4c83ff"))))
   ;;   '(mode-line-inactive ((t (:background "gray10" :foreground "gray30"))))

   '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
   '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil))))	;;powerline 颜色调整

   '(highlight ((t (:background "DarkOrange"))))
   '(isearch ((t (:background "deep pink" :foreground "black"))))
   '(isearch-fail ((t (:background "red4"))))
   '(lazy-highlight ((t (:background "yellow" :foreground "black"))))
   '(query-replace ((t (:background "#333333"))))
   '(Highline-face ((t (:background "SeaGreen"))))
   '(hl-line ((t (:background "#333333"))))
   '(italic ((t (nil))))
   '(left-margin ((t (nil))))
   '(text-cursor ((t (:background "yellow" :foreground "black"))))
   '(toolbar ((t (nil))))
   '(underline ((nil (:underline nil))))
   '(vertical-border ((t (:background "black" :foreground "#333333"))))
   '(zmacs-region ((t (:background "snow" :foreground "ble"))))

   '(ac-completion-face ((t (:foreground "darkgray" :underline t))))
   '(ac-candidate-face ((t (:background "gray60" :foreground "black"))))
   '(ac-selection-face ((t (:background "deep pink" :foreground "black"))))
   '(ac-yasnippet-candidate-face ((t (:background "gray60" :foreground "black"))))
   '(ac-yasnippet-selection-face ((t (:background "deep pink" :foreground "black"))))
   '(popup-isearch-match ((t (:background "black" :foreground "deep pink"))))
   '(popup-tip-face ((t (:background "#333333" :foreground "white"))))
   '(popup-scroll-bar-foreground-face ((t (:background "#0A0A0A"))))
   '(popup-scroll-bar-background-face ((t (:background "#333333"))))

   '(erc-notice-face ((t (:bold t :foreground "grey26"))))

   '(erc-action-face ((t (:foreground "#FF6400"))))
   ;;     (erc-bold-face ((t (:bold t :weight bold))))
   ;;     (erc-button ((t (:bold t :weight bold))))
   ;;     (erc-command-indicator-face ((t (:bold t :weight bold))))
   '(erc-current-nick-face ((t (:foreground "#FBDE2D"))))
   '(erc-dangerous-host-face ((t (:foreground "red"))))
   '(erc-default-face ((t (:foreground "#61CE3C"))))
   '(erc-direct-msg-face ((t (:foreground "orange"))))
   '(erc-error-face ((t (:foreground "red"))))
   '(erc-fool-face ((t (:foreground "dim gray"))))
   '(erc-header-line ((t (:background "grey90" :foreground "grey20"))))
   '(erc-input-face ((t (:foreground "#4c83ff"))))
   '(erc-inverse-face ((t (:background "Black" :foreground "White"))))
   '(erc-keyword-face ((t (:foreground "deep pink"))))
   '(erc-my-nick-face ((t (:bold t :foreground "deep pink" ))))
   '(erc-nick-default-face ((t (:foreground "grey57"))))
   '(erc-nick-msg-face ((t (:foreground "deep pink"))))

   '(erc-pal-face ((t (:bold t :foreground "Magenta" :weight bold))))
   '(erc-prompt-face ((t (:bold t :background "lightBlue2" :foreground "Black" :weight bold))))
   '(erc-timestamp-face ((t (:foreground "dim gray"))))
   '(erc-underline-face ((t (:underline t))))

   '(vhl/default-face ((t (:background "#333333"))))
   '(undo-tree-visualizer-active-branch-face ((t (:foreground "deep pink" :background "black"))))
   '(hl-sexp-face ((t (:background "grey9"))))

   '(browse-kill-ring-current-entry-face ((t (:background "#333333"))))

   ;; 原来的设置
   `(default ((t (:background ,nopcall-bg :foreground ,amelie-fg))))

   ;; Editor
   `(cursor ((t (:background "Magenta" :foreground "Magenta"))))
   ;;   `(cursor ((t (:background ,amelie-fg :foreground ,amelie-bg))))
   ;;(cursor-color . "#96CBFE")
   `(highlight ((t (:background ,amelie-bg-hi))))
   `(region ((t (:background ,nopcall-region-bg :foreground ,amelie-fg-hi))))
   `(header-line ((t (:foreground ,amelie-yellow
                                  :box (:line-width -1 :style released-button)))))
   ;; UI
   `(menu ((t (:foreground ,amelie-fg :background ,amelie-bg))))
   ;;   `(mode-line ((t (:foreground ,amelie-green-1
   ;;                                :background ,amelie-bg
   ;;                                :box (:line-width -1 :style pressed-button)))))
   ;;   `(mode-line-inactive ((t (:foreground ,amelie-grey-2
   ;;                                         :background ,amelie-bg
   ;;                                         :box (:line-width -1 :style released-button)))))
   '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
   '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil))))	;;powerline 颜色调整

   `(mode-line-buffer-id ((t (:foreground ,amelie-magenta :weight bold))))
   `(minibuffer-prompt ((t (:foreground ,amelie-yellow))))



   ;; font lock
   `(font-lock-comment-face ((t (:foreground ,amelie-grey-2))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,amelie-grey-3))))
   `(font-lock-constant-face ((t (:foreground ,amelie-cyan))))
   `(font-lock-builtin-face ((t (:foreground ,amelie-cyan))))
   `(font-lock-function-name-face ((t (:foreground ,nopcall-function-name-face :bold t))))
   `(font-lock-variable-name-face ((t (:foreground ,nopcall-variable-name-face))))
   `(font-lock-keyword-face ((t (:foreground ,nopcall-keyword-face :bold t))))
   `(font-lock-string-face ((t (:foreground ,amelie-yellow+1))))
   `(font-lock-doc-string-face ((t (:foreground ,amelie-fg-hi))))
   `(font-lock-type-face ((t (:foreground ,amelie-green+1))))

   `(ido-first-match ((t (:foreground "deep pink" :background , nopcall-bg))))
   `(ido-only-match ((t (:foreground "deep pink" :background , nopcall-bg))))
   `(ido-subdir ((t (:foreground "gray60" :background , nopcall-bg))))
   `(ido-indicator ((t (:foreground "black" :background "deep pink"))))


   ;;diff colours
   '(diff-removed ((t (:foreground "Red"))) 'now)
   '(diff-added ((t (:foreground "Green"))) 'now)

   ;;ediff
   '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
   '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
   '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
   '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
   '(ediff-current-diff-B ((((class color)) (:background "white"))))
   '(ediff-even-diff-A ((((class color)) nil)))
   '(ediff-even-diff-B ((((class color)) nil)))
   '(ediff-fine-diff-A ((((class color)) (:background "cyan"))))
   '(ediff-fine-diff-B ((((class color)) (:background "cyan"))))
   '(ediff-odd-diff-A ((((class color)) nil)))
   '(ediff-odd-diff-B ((((class color)) nil)))


   ;; whitespace-mode
   '(whitespace-space ((((class color) (background dark)) (:foreground "#444"))))
   '(whitespace-hspace ((((class color) (background dark)) (:foreground "#444"))))
   '(whitespace-tab ((((class color) (background nopcall-bg)) (:foreground "darkgray"))))
   '(whitespace-newline ((((class color) (background dark)) (:foreground "#444"))))
   '(whitespace-trailing ((((class color) (background dark)) (:foreground "#444"))))
   ;; removing inverse video on this
   ;;   '(whitespace-line ((((class color) (background dark)) (:foreground "#444"))))
   '(whitespace-space-before-tab ((((class color) (background dark)) (:foreground "#444"))))
   '(whitespace-indentation ((((class color) (background dark)) (:foreground "#444"))))
   '(whitespace-empty ((((class color) (background dark)) (:foreground "#444"))))
   '(whitespace-space-after-tab ((((class color) (background dark)) (:foreground "#444"))))

   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'nopcall)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; Amelie-theme.el ends here



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cyberpunk Colour Theme
;;
;; "and he'd still see the matrix in his sleep, bright lattices of logic
;; unfolding across that colorless void..."
;;                   William Gibson, Neuromancer.
;;

;;(require 'color-theme)
;;
;;;;;###autoload
;;(defun color-theme-cyberpunk ()
;;  "Cyberpunk colour theme by Sam Aaron."
;;  (interactive)
;;  (color-theme-install
;;   '(color-theme-cyberpunk
;;     ((background-color . "black")
;;      (background-mode . dark)
;;      (border-color . "black")
;;      (cursor-color . "#96CBFE")
;;      (foreground-color . "#EDEDED")
;;      (mouse-color . "sienna1"))
;;
;;     (default ((t (:background "black" :foreground "light gray"))))
;;     (blue ((t (:foreground "blue"))))
;;     (bold ((t (:bold t))))
;;     (bold-italic ((t (:bold t))))
;;     (border-glyph ((t (nil))))
;;     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
;;
;;
;;     (font-lock-builtin-face ((t (:foreground "#FF6400"))))
;;     (font-lock-comment-face ((t (:italic t :foreground "#8B8989"))))
;;     (font-lock-constant-face ((t (:foreground "#4c83ff"))))
;;     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
;;     (font-lock-function-name-face ((t (:foreground "deep pink"))))
;;     (font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
;;     (font-lock-preprocessor-face ((t (:foreground "gray57"))))
;;     (font-lock-reference-face ((t (:foreground "medium slate blue"))))
;;     (font-lock-reference-face ((t (:foreground "gray"))))
;;     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
;;     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))
;;     (font-lock-string-face ((t (:foreground "#61CE3C"))))
;;     (font-lock-type-face ((t (:foreground "#D8FA3C"))))
;;     (font-lock-variable-name-face ((t (:foreground "#D8FA3C"))))
;;     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
;;
;;     (gui-element ((t (:background "#333333" :foreground "#96CBFE"))))
;;;;     (region ((t (:foreground "black" :background "#7F073F"))))
;;     (region ((t ( :background "#7F073F"))))
;;     (mode-line ((t (:background "gray10" :foreground "#4c83ff"))))
;;     (mode-line-inactive ((t (:background "gray10" :foreground "gray30"))))
;;
;;     (highlight ((t (:background "DarkOrange"))))
;;     (isearch ((t (:background "deep pink" :foreground "black"))))
;;     (isearch-fail ((t (:background "red4"))))
;;     (lazy-highlight ((t (:background "yellow" :foreground "black"))))
;;     (query-replace ((t (:background "#333333"))))
;;     (Highline-face ((t (:background "SeaGreen"))))
;;     (hl-line ((t (:background "#333333"))))
;;     (italic ((t (nil))))
;;     (left-margin ((t (nil))))
;;     (text-cursor ((t (:background "yellow" :foreground "black"))))
;;     (toolbar ((t (nil))))
;;     (underline ((nil (:underline nil))))
;;     (vertical-border ((t (:background "black" :foreground "#333333"))))
;;     (zmacs-region ((t (:background "snow" :foreground "ble"))))
;;
;;     (diff-added ((t (:foreground "green"))))
;;     (diff-removed ((t (:foreground "red"))))
;;
;;     (magit-diff-add ((t (:foreground "green"))))
;;     (magit-diff-del ((t (:foreground "red"))))
;;     (magit-item-highlight ((t (:background "gray15"))))
;;     (magit-section-title ((t (:foreground "deep pink"))))
;;     (magit-diff-hunk-header ((t (:foreground "orange"))))
;;     (magit-branch ((t (:foreground "gold"))))
;;
;;     (eval-sexp-fu-flash ((t (:background "grey15" :foreground "DeepPink3"))))
;;     (nrepl-eval-sexp-fu-flash ((t (:background "grey15" :foreground "DeepPink3"))))
;;
;;     (ac-completion-face ((t (:foreground "darkgray" :underline t))))
;;     (ac-candidate-face ((t (:background "gray60" :foreground "black"))))
;;     (ac-selection-face ((t (:background "deep pink" :foreground "black"))))
;;     (ac-yasnippet-candidate-face ((t (:background "gray60" :foreground "black"))))
;;     (ac-yasnippet-selection-face ((t (:background "deep pink" :foreground "black"))))
;;     (popup-isearch-match ((t (:background "black" :foreground "deep pink"))))
;;     (popup-tip-face ((t (:background "#333333" :foreground "white"))))
;;     (popup-scroll-bar-foreground-face ((t (:background "#0A0A0A"))))
;;     (popup-scroll-bar-background-face ((t (:background "#333333"))))
;;
;;     (window-number-face ((t (:background "grey10" :foreground "#4c83ff"))))
;;
;;     (yas/field-highlight-face ((t (:background "deep pink" :foreground "black"))))
;;
;;     (show-paren-match-face ((t (:background "deep pink" :foreground "black"))))
;;
;;     (naeu-green-face ((t (:foreground "green" :background "black"))))
;;     (naeu-pink-face ((t (:foreground "deep pink" :background "black"))))
;;     (naeu-blue-face ((t (:foreground "medium slate blue" :background "black"))))
;;     (naeu-orange-face ((t (:foreground "#FBDE2D" :background "black"))))
;;     (naeu-red-face ((t (:foreground "orange" :background "black"))))
;;     (naeu-grey-face ((t (:foreground "gray30" :background "black"))))
;;
;;     (ido-first-match ((t (:foreground "deep pink" :background "black"))))
;;     (ido-only-match ((t (:foreground "deep pink" :background "black"))))
;;     (ido-subdir ((t (:foreground "gray60" :background "black"))))
;;     (ido-indicator ((t (:foreground "black" :background "deep pink"))))
;;
;;     (match ((t (:foreground "deep pink" :background "blackn"))))
;;     (minibuffer-prompt ((t (:foreground "#61CE3C" :background "black"))))
;;     (grep-match-face ((t (:foreground "black" :background "deep pink"))))
;;     (grep-hit-face ((t (:foreground "black" :background "red"))))
;;     (grep-context-face ((t (:foreground "black" :background "deep pink"))))
;;
;;     ;; ;;rainbow-delimiters [ {
;;     ;; (rainbow-delimiters-depth-1-face ((t (:foreground "dark gray"))))
;;     ;; (rainbow-delimiters-depth-2-face ((t (:foreground "green"))))
;;     ;; (rainbow-delimiters-depth-3-face ((t (:foreground "gold"))))
;;     ;; (rainbow-delimiters-depth-4-face ((t (:foreground "turquoise"))))
;;     ;; (rainbow-delimiters-depth-5-face ((t (:foreground "orange"))))
;;     ;; (rainbow-delimiters-depth-6-face ((t (:foreground "slate blue"))))
;;     ;; (rainbow-delimiters-depth-7-face ((t (:foreground "yellow"))))
;;     ;; (rainbow-delimiters-depth-8-face ((t (:foreground "light blue"))))
;;     ;; (rainbow-delimiters-depth-9-face ((t (:foreground "#7f7f7f"))))
;;     ;; (rainbow-delimiters-unmatched-face ((t (:foreground "white"))))
;;
;;     ;;rainbow-delimiters (
;;     (rainbow-delimiters-depth-1-face ((t (:foreground "dark red"))))
;;     (rainbow-delimiters-depth-2-face ((t (:foreground "dark green"))))
;;     (rainbow-delimiters-depth-3-face ((t (:foreground "deep pink"))))
;;     (rainbow-delimiters-depth-4-face ((t (:foreground "yellow"))))
;;     (rainbow-delimiters-depth-5-face ((t (:foreground "green"))))
;;     (rainbow-delimiters-depth-6-face ((t (:foreground "light blue"))))
;;     (rainbow-delimiters-depth-7-face ((t (:foreground "orange"))))
;;     (rainbow-delimiters-depth-8-face ((t (:foreground "slate blue"))))
;;     (rainbow-delimiters-depth-9-face ((t (:foreground "light gray"))))
;;     (rainbow-delimiters-unmatched-face ((t (:foreground "white"))))
;;
;;     (erc-notice-face ((t (:bold t :foreground "grey26"))))
;;
;;     (erc-action-face ((t (:foreground "#FF6400"))))
;;;;     (erc-bold-face ((t (:bold t :weight bold))))
;;;;     (erc-button ((t (:bold t :weight bold))))
;;;;     (erc-command-indicator-face ((t (:bold t :weight bold))))
;;     (erc-current-nick-face ((t (:foreground "#FBDE2D"))))
;;     (erc-dangerous-host-face ((t (:foreground "red"))))
;;     (erc-default-face ((t (:foreground "#61CE3C"))))
;;     (erc-direct-msg-face ((t (:foreground "orange"))))
;;     (erc-error-face ((t (:foreground "red"))))
;;     (erc-fool-face ((t (:foreground "dim gray"))))
;;     (erc-header-line ((t (:background "grey90" :foreground "grey20"))))
;;     (erc-input-face ((t (:foreground "#4c83ff"))))
;;     (erc-inverse-face ((t (:background "Black" :foreground "White"))))
;;     (erc-keyword-face ((t (:foreground "deep pink"))))
;;     (erc-my-nick-face ((t (:bold t :foreground "deep pink" ))))
;;     (erc-nick-default-face ((t (:foreground "grey57"))))
;;     (erc-nick-msg-face ((t (:foreground "deep pink"))))
;;
;;     (erc-pal-face ((t (:bold t :foreground "Magenta" :weight bold))))
;;     (erc-prompt-face ((t (:bold t :background "lightBlue2" :foreground "Black" :weight bold))))
;;     (erc-timestamp-face ((t (:foreground "dim gray"))))
;;     (erc-underline-face ((t (:underline t))))
;;
;;     (vhl/default-face ((t (:background "#333333"))))
;;     (undo-tree-visualizer-active-branch-face ((t (:foreground "deep pink" :background "black"))))
;;     (hl-sexp-face ((t (:background "grey9"))))
;;
;;     (browse-kill-ring-current-entry-face ((t (:background "#333333"))))
;;     ))
;;  )
;;
;;
;;
;;(custom-set-faces
;;
;; ;;nXhtml colours
;; '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))))
;; '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))))
;;
;; ;;ediff
;; '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
;; '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
;; '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
;; '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
;;; '(ediff-current-diff-B ((((class color)) (:background "white"))))
;;; '(ediff-even-diff-A ((((class color)) nil)))
;;; '(ediff-even-diff-B ((((class color)) nil)))
;;; '(ediff-fine-diff-A ((((class color)) (:background "cyan"))))
;;; '(ediff-fine-diff-B ((((class color)) (:background "cyan"))))
;;; '(ediff-odd-diff-A ((((class color)) nil)))
;;; '(ediff-odd-diff-B ((((class color)) nil)))
;; )
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Gandalf Colour Theme
;;;;
;;;; "I will not say do not weep, for not all tears are an evil."
;;;;                              Gandalf.
;;
;;(require 'color-theme)
;;
;;;;;###autoload
;;(defun color-theme-gandalf()
;;  "Gandalf colour theme by Sam Aaron"
;;  (interactive)
;;  (color-theme-install
;;   '(color-theme-gandalf
;;     ((background-color . "grey90")
;;      (background-mode . light)
;;      (border-color . "grey95")
;;      (cursor-color . "darkred")
;;      (foreground-color . "black")
;;      (mouse-color . "sienna1"))
;;     (default ((t (:background "white" :foreground "black"))))
;;     (blue ((t (:foreground "blue"))))
;;     (bold ((t (:bold t))))
;;     (bold-italic ((t (:bold t))))
;;     (border-glyph ((t (nil))))
;;     (buffers-tab ((t (:background "white" :foreground "black"))))
;;     (font-lock-builtin-face ((t (:foreground "dark blue"))))
;;     (font-lock-comment-face ((t (:italic t :foreground "dark green" :italic t))))
;;     (font-lock-constant-face ((t (:foreground "dark blue"))))
;;     (font-lock-doc-string-face ((t (:foreground "black"))))
;;     (font-lock-function-name-face ((t (:foreground "dark blue" :bold t))))
;;     (font-lock-keyword-face ((t (:foreground "black" :bold t))))
;;     (font-lock-preprocessor-face ((t (:foreground "black"))))
;;     (font-lock-reference-face ((t (:foreground "dark cyan"))))
;;
;;     (font-lock-regexp-grouping-backslash ((t (:foreground "black"))))
;;     (font-lock-regexp-grouping-construct ((t (:foreground "black"))))
;;
;;     (font-lock-string-face ((t (:foreground "dark green"  :bold t))))
;;
;;     (font-lock-type-face ((t (:foreground "blue"))))
;;     (font-lock-variable-name-face ((t (:foreground "dark cyan"))))
;;     (font-lock-warning-face ((t (:bold t :foreground "black"))))
;;     (gui-element ((t (:background "grey40" :foreground "#96CBFE"))))
;;     (region ((t (:background "#758BC6"))))
;;     (mode-line ((t (:background "grey50" :foreground "white"))))
;;     (mode-line-inactive ((t (:background "gray50" :foreground "black"))))
;;     (highlight ((t (:background "grey70"))))
;;     (isearch ((t (:background "deep pink" :foreground "black"))))
;;     (isearch-fail ((t (:background "red1"))))
;;     (query-replace ((t (:background "grey40"))))
;;     (hl-line ((t (:background "grey85"))))
;;     (Highline-face ((t (:background "SeaGreen"))))
;;     (italic ((t (nil))))
;;     (left-margin ((t (nil))))
;;     (text-cursor ((t (:background "yellow" :foreground "black"))))
;;     (toolbar ((t (nil))))
;;     (underline ((nil (:underline nil))))
;;     (vertical-border ((t (:background "black" :foreground "#333333"))))
;;     (zmacs-region ((t (:background "snow" :foreground "ble"))))
;;     (erc-default-face ((t (:foreground "dark green"))))
;;
;;     ; NICK: add ido, and a bit of minibuffer colour.
;;     (ido-first-match ((t (:foreground "black" :background "grey70"))))
;;     (ido-only-match ((t (:foreground "black" :background "grey95"))))
;;     (ido-subdir ((t (:foreground "white" :background "#758BC6"))))
;;     (ido-indicator ((t (:foreground "black" :background "deep pink"))))
;;     (minibuffer-prompt ((t (:foreground "dark blue" :background "grey85"))))
;;
;;     ;; magit
;;     (magit-item-highlight ((t (:background "gray15"))))
;;     (magit-diff-add ((t (:foreground "chartreuse3"))))
;;     (magit-diff-del ((t (:foreground "violet red"))))
;;     (magit-section-type ((t (:foreground "deep pink"))))
;;     (magit-diff-hunk-header ((t (:foreground "orange"))))
;;     (magit-branch ((t (:foreground "DarkGoldenRod"))))
;;
;;     ;;rainbow-delimiters (
;;     (rainbow-delimiters-depth-1-face ((t (:foreground "dark red"))))
;;     (rainbow-delimiters-depth-2-face ((t (:foreground "dark green"))))
;;     (rainbow-delimiters-depth-3-face ((t (:foreground "deep pink"))))
;;     (rainbow-delimiters-depth-4-face ((t (:foreground "brown"))))
;;     (rainbow-delimiters-depth-5-face ((t (:foreground "dark green"))))
;;     (rainbow-delimiters-depth-6-face ((t (:foreground "dark blue"))))
;;     (rainbow-delimiters-depth-7-face ((t (:foreground "dark orange"))))
;;     (rainbow-delimiters-depth-8-face ((t (:foreground "slate blue"))))
;;     (rainbow-delimiters-depth-9-face ((t (:foreground "grey10"))))
;;     (rainbow-delimiters-unmatched-face ((t (:foreground "white"))))
;;
;;     (vhl/default-face ((t (:background "grey60"))))
;;     (undo-tree-visualizer-active-branch-face ((t (:foreground "deep pink" :background "grey40"))))
;;     )
;;   ))
;;
;;(custom-set-faces
;; ;;nXhtml colours
;; '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))))
;; '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))))
;;
;; '(eval-sexp-fu-flash ((((class color) (background dark)) (:background "grey15" :foreground "DeepPink3"))))
;;
;; ;;diff colours
;; '(diff-removed ((t (:foreground "Red"))) 'now)
;; '(diff-added ((t (:foreground "Green"))) 'now)
;;
;;
;; ;;ediff
;; '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
;; '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
;; '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
;; '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
;;; '(ediff-current-diff-B ((((class color)) (:background "white"))))
;;; '(ediff-even-diff-A ((((class color)) nil)))
;;; '(ediff-even-diff-B ((((class color)) nil)))
;;; '(ediff-fine-diff-A ((((class color)) (:background "cyan"))))
;;; '(ediff-fine-diff-B ((((class color)) (:background "cyan"))))
;;; '(ediff-odd-diff-A ((((class color)) nil)))
;;; '(ediff-odd-diff-B ((((class color)) nil)))
;; )

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:
