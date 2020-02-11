# .emacs.d
我的Emacs配置。

# 核心配置文件结构
## init.el :: 主入口文件

## site-lisp/ :: 开箱即用的模块化配置目录
### config/ :: 模块化配置文件存放目录
- init-config.el :: 模块化配置入口配置文件
- init-template.el :: 模块化配置模板文件
#### init/ :: 各个模块初始化配置文件存放目录
##### common/ :: 通用配置
- init-better-default.el :: 更好的默认配置
- init-hydra-one-key.el :: 基于hydra插件的快捷键统一配置（包含部分mode和插件的快捷键）
- init-my-function.el :: 自己编写的自定义函数
- init-package.el :: pachage相关配置
- init-quick-access.el :: 快速access配置
- init-theme.el :: 主题配置
- init-ui.el :: 界面相关配置
##### mode/ :: 各种mode的配置
- init-company-mode.el :: company-mode配置，主要是自动补全相关的
- init-dired-mode.el :: dired-mode配置
- init-eshell-mode.el :: eshell-mode配置
- init-markdown-mode.el :: markdown-mode配置
- init-org-mode.el :: org-mode配置
- init-python-mode.el :: python-mode配置
##### plugin/ :: 各种插件的配置
- init-atomic-chrome.el :: 用emacs编辑浏览器的文本输入框的内容的插件配置
- init-auto-save.el :: 自动保存插件配置
- init-awesome-pair.el :: 更好的配对插件配置
- init-awesome-tab.el :: Tab页插件配置
- init-company-english-helper.el :: 英语小助手插件的配置
- init-edit-server.el :: 编辑器服务后端配置
- init-grep-dired.el :: 目录全文文本查找配置
- init-helm.el :: helm插件配置
- init-insert-translated-name.el :: 插入翻译的中英文单词插件配置
- init-lazy-search.el :: lazy-search插件配置
- init-org-pomodoro.el :: org-mode番茄钟配置
- init-projectile.el :: projectile插件配置
- init-virtualenvwrapper.el :: 虚拟环境插件配置
- init-watch-other-window.el :: 浏览另一个窗口插件配置
- init-youdao-dictionary.el :: 有道词典插件配置

### my-extension/ :: 我自己写的插件存放目录
- `pasteex`: `org-mode`和`markdown-mode`下的剪贴板图片工具插件。
### extension/ :: 插件代码文件存放目录
#### themes/ :: 主题插件
#### auto-save/ :: 自动保存插件
#### youdao-dictionary/ :: 有道词典插件
#### ...

### org/ :: 快速访问入口org配置文件
- quick-access.org :: 全局的快速访问入口org配置文件

## local-list/ :: 本地化的模块化配置目录
