;;;;;;;;;; 包加载入口 ;;;;;;;;;;
;; 更好的默认设置
(require 'init-better-default)
;; 加载company-mode的自定义配置
(require 'init-company-mode)
;; 加载dired模式的自定义配置
(require 'init-dired)
;; 按键绑定
(require 'init-key-binding)
;; 自定义函数
(require 'init-my-function)
;; org-mode配置
(require 'init-org-mode)
;; org-pomodoro插件配置
(require 'init-org-pomodoro)
;; 加载包
(require 'init-package)
;; 主题设置
(require 'init-theme)
;; 界面外观设置
(require 'init-ui)
;; 滚动另一个窗口插件配置
(require 'init-watch-other-window)
;; 有道词典配置
(require 'init-youdao-dictionary)

;; 提供init-config模块
(provide 'init-config)
