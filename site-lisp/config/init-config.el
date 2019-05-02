;;;;;;;;;; 包加载入口 ;;;;;;;;;; 
;;;; common start：通用设置
;; 更好的默认设置
(require 'init-better-default)
;; 按键绑定
(require 'init-key-binding)
;; 自定义函数
(require 'init-my-function)
;; 网络配置
(require 'init-network)
;; 加载包
(require 'init-package)
;; configuration for quick access org file
(require 'init-quick-access-org)
;; 快速访问按键配置
(require 'init-quick-access)
;; 主题设置
(require 'init-theme)
;; 界面外观设置
(require 'init-ui)
;;;; common end 

;;;; init mode star
;; config dired-mode
(require 'init-dired-mode)
;; config python-mode
(require 'init-python-mode)
;; config markdown-mode
(require 'init-markdown-mode)
;; config eshell-mode
(require 'init-eshell-mode)
;; config org-mode
(require 'init-org-mode)
;; config company-mode
(require 'init-company-mode)
;;;; init mode end

;;;; init plugin start
;; hydra
(require 'init-hydra-one-key)
;; edit server
(require 'init-edit-server)
;; edit text area by emacs in chrome
(require 'init-atomic-chrome)
;; lazy search config
(require 'init-lazy-search)
;; auto pair
;; (require 'init-awesome-pair)
;; company-english-helper
(require 'init-company-english-helper)
;; projectile config
(require 'init-projectile)
;; awesome-tab config
(require 'init-awesome-tab)
;; 自动保存插件
(require 'init-auto-save)
;; helm插件配置
(require 'init-helm)
;; 写代码中-英文翻译辅助插件
(require 'init-insert-translated-name)
;; org-pomodoro插件配置
(require 'init-org-pomodoro)
;; virtualenvwrapper虚拟化环境配置
(require 'init-virtualenvwrapper)
;; 滚动另一个窗口插件配置
(require 'init-watch-other-window)
;; Youdao dictionary config
(require 'init-youdao-dictionary)
;;;; init plugin end

;; provide init-config module
(provide 'init-config)
