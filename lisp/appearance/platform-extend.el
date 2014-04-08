;;http://www.dotemacs.de/multiemacs.html emacs configuration manuly
;;
(cond
     ((string-match "GNU" (emacs-version))
        (message "Customizing GNU Emacs. <(▰▰￣▽￣▰▰)>")
	;; GNU/EMACs
	(cond
         ; all the common things for different OS start here
             ((string-match "linux" system-configuration)
	      ;; OS Linux
	      (message "Customizing GNU Emacs for Linux. (●'◡'●)ﾉ♥")

	     )
	     ((string-match "darwin" system-configuration)
	      ;; OS Darwin
                (message "Customizing GNU Emacs for darwin. o<<(≧口≦)>>o")

		)
             ((string-match "nt4" system-configuration)
	      ;; OS Windows
                (message "Customizing GNU Emacs for Win NT. (╯‵□′)╯︵┻━┻")

	     )))
     ((string-match "XEmacs" (emacs-version))
      ;; XEmacs
      (message "customizing XEmacs. (●'◡'●)ﾉ♥")
      )
)

(provide 'platform-extend)
