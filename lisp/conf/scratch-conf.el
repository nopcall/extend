(setq daily-welcome-messages
      (list    "Miracles sometimes occur, but one has to work terribly for them."
	       "There are no secrets to success. It is the result of preparation, hard work, and learning from failure."
	       "Love the neighbor. But don't get caught.HAHAHA"
	       "Never put off the work till tomorrow what you can put off today."
	       ))
(defun random-welcome-message ()
  (nth (random (length daily-welcome-messages)) daily-welcome-messages))

(setq welcom-text (concat ";;
;;	" (random-welcome-message)	"
;;
" ))
(put-text-property 0 (length welcom-text) 'read-only t welcom-text)
(setq initial-scratch-message (concat welcom-text "
"))

(provide 'scratch-conf)
