;;;;;;;;;; init-quick-access模块 ;;;;;;;;;;
;;;; Desc: 通用的快速访问按键配置

;;;; init-quick-access start here
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Require:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Code:
;; 快速打开elisp手册
(defun open-elisp-manual ()
  (interactive)
  (progn
    (info)
    (Info-menu "Elisp")))
(global-set-key (kbd "C-h C-x e") 'open-elisp-manual)

;; 在dired模式中打开.emacs.d目录: C-<f1>
(global-set-key (kbd "C-<f10>") '(lambda() (interactive) (dired "~/.emacs.d/")))

;; 快速打开配置文件init-config.el: <f2>
(global-set-key (kbd "C-<f11>") '(lambda() (interactive) (find-file "~/.emacs.d/site-lisp/config/init-config.el")))

;; 加载当前文件
(global-set-key (kbd "C-<f12>") 'load-file)

;; 快速提交git代码（need auto-commit.bat file in ~/.emacs.d/ directory）
(global-set-key (kbd "<f12>") (lambda() (interactive) (shell-command "start auto-commit.bat")))

;; 在文件夹中打开当前文件所在目录: C-c o
(global-set-key (kbd "C-c o") '(lambda() (interactive) (shell-command "start .\\")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Provide:
(provide 'init-quick-access)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; init-quick-access end here
