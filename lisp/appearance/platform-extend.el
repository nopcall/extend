;;http://www.dotemacs.de/multiemacs.html emacs configuration manuly
;;
(cond
 ((string-match "GNU" (emacs-version))						;; GNU/EMACs
  (message "<(▰▰￣▽￣▰▰)> Customizing GNU Emacs")
  (cond
   ((string-match "linux" system-configuration)
    (message "(●'◡'●)ﾉ♥ Customizing GNU Emacs for *Linux*")
    ;; do what you want
    )
   ((string-match "darwin" system-configuration)
    (message "o<<(≧口≦)>>o Customizing GNU Emacs for *Darwin*")
    ;; do what you want
    )
   ((string-match "nt4" system-configuration)
    (message "(╯‵□′)╯︵┻━┻ Customizing GNU Emacs for *WinNT*")
    ;; do what you want
    )))
 ((string-match "XEmacs" (emacs-version))					;; XEmacs
  (message "(●'◡'●)ﾉ♥ Customizing XEmacs")
  )
 )

(provide 'platform-extend)
