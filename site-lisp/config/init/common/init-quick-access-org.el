;;;;;;;;;; init-quick-access-org module ;;;;;;;;;;
;;;; Desc:

;;;; init-quick-access-org starts here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
(defun bind-key-for-open-dir (path key-str in-where)
  "Quickly make a key bind for the operation of opening a directory in emacs dired-mode or in system explorer."
  ;;(interactive)
  (cond
   ((string-equal in-where "dired") (global-set-key (kbd key-str) '(lambda() (interactive) (dired path))))
   ((string-equal in-where "explorer") (global-set-key (kbd key-str) '(lambda() (interactive) (async-shell-command (format "start \"\" \"%s\"" path)))))
   (t (message "NOT support the operation: %s!" in-where))))

;; quickly open quick-access.org
;;(bind-key-for-open-dir "~/.emacs.d/site-lisp/org/quick-access.org" "C-<f1>" "dired")
(bind-key-for-open-dir "d:/" "C-<f4>" "dired")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access-org ends here
