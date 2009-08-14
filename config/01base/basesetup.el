;;启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp
(partial-completion-mode 1)
;;在minibuffer里启用自动补全函数和变量
(icomplete-mode 1)
;;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母
(fset 'yes-or-no-p 'y-or-n-p)
;;允许minibuffer自由变化其大小（指宽度）
(setq resize-mini-windows t)
;;当寻找一个同名的文件，自动关联上那个文件？
(setq uniquify-buffer-name-style 'forward)
;;在emacs读man文档时，使用当前buffer
(setq Man-notify-method 'pushy)
;;鼠标自动避开指针，如当你输入的时候，指针到了鼠标的位置，鼠标有点挡住视线了
(mouse-avoidance-mode 'animate)
;;允许自动打开图片，如wiki里面
(auto-image-file-mode)
;;可以操作压缩文档
;;(auto-compression-mode 1)
;;在minibuffer上面可以显示列号
(column-number-mode t)
;;显示默认的文档的宽度，看起来比较舒服？
;;(setq default-fill-column 60)

;;设置光标为短线
(setq-default cursor-type 'bar)

;;指针不要闪，我得眼睛花了
;;(blink-cursor-mode -1)

(transient-mark-mode 1)

;;当指针到一个括号时，自动显示所匹配的另一个括号
(show-paren-mode 1)
;;是用滚轴鼠标
(mouse-wheel-mode t)
;;去掉烦人的警告铃声
(setq visible-bell nil)
;;滚动页面时比较舒服，不要整页的滚动
(setq scroll-step 1
scroll-margin 3
scroll-conservatively 10000)
;;设定句子结尾，主要是针对中文设置
(setq sentence-end "\\([¡££¡£¿]\\|¡¡\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;去掉Emacs和gnus启动时的引导界面
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)
;;当指针移到另一行，不要新增这一行？d
(setq next-line-add-newlines nil)
;;不在文档最后自动插入空白一行，因为yasnippet有最后个空行回显示到最终文件中
(setq require-final-newline nil)  ;; t
(setq track-eol t)
;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)
;;设定删除保存记录为200，可以方便以后无限恢复
(setq kill-ring-max 200)
;;增大使用查找函数和变量的寻找范围
(setq apropos-do-all t)
;;是用aspell程序作为Emacs的拼写检查成学
;;(setq-default ispell-program-name "aspell")
;;使用narrow功能时的一个设置
(put 'narrow-to-region 'disabled nil)
;;改变emacs标题栏的标题
;;(setq frame-title-format "%b@spiker.cn")
;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)


(desktop-save-mode 1)

;; 默认工作目录
(if (>= emacs-major-version 23)
    (setq default-directory "~/gitworks")
  (setq default-directory "~/work"))

;;去掉工具栏
(tool-bar-mode nil)

;;备份设置
;;emacs还有一个自动保存功能，默认在~/.emacs.d/auto-save-list里，这个非常有用，我这里没有改动，具体可以参见Sams teach yourself emacs in 24hours(我简称为sams24)
;;启用版本控制，即可以备份多次
(setq version-control t)
;;备份最原始的版本两次，记第一次编辑前的文档，和第二次编辑前的文档
(setq kept-old-versions 2)
;;备份最新的版本五次，理解同上
(setq kept-new-versions 5)
;;删掉不属于以上7中版本的版本
(setq delete-old-versions t)
;;设置备份文件的路径
(setq backup-directory-alist '(("." . "~/.emacs.d/tmp")))
;;备份设置方法，直接拷贝
(setq backup-by-copying t)

 ;; 所有的备份文件转移到~/backups目录下
(setq backup-directory-alist (quote (("." . "~/.emacs.d/tmp"))))
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/var/tmp")。对于每个备份文件，保留最原始的两个版本和最新的
;; 五个版本。并且备份的时候，备份文件是复本，而不是原件。

;;不产生备份文件
;;(setq make-backup-files nil)

;;默认用空格代替tab
(setq-default indent-tabs-mode nil)

;;使用快速buffer切换
(iswitchb-mode 1)

;;在标题栏显示当前buffer所有位置
(setq frame-title-format '("Emacs@"system-name": %b %+%+ %f"))

;;设置在双栏模式下自动折行显示
(setq truncate-partial-width-windows nil)

;设定用户信息
(setq user-full-name "Tang Liqun")
(setq user-mail-address "crazycode@gmail.com")
;设置地理位置
(setq calendar-latitude 31.22)
(setq calendar-longitude 121.48)
(setq calendar-location-name "Shanghai")

;;加入行号显示
(require 'linum)
(global-linum-mode t)

;;高亮当前行
;;(global-hl-line-mode 1)

;;;设置c-o,这样在一行中的任何位置就可以直接新建一行了。相当于先c-e再enter
(global-set-key (kbd "C-o")
            '(lambda ()
               (interactive)
               (end-of-line 1)
               (newline-and-indent)))

;;对付重名 buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;(auto-revert-mode t)
(global-auto-revert-mode)

;;; Excellent package for better scrolling in emacs
;;; should be default package. But now it can be downloaded
;;; from: http://user.it.uu.se/~mic/pager.el
(require 'pager)

;;加强c-x c-b (buffer list)的功能，用起来和目录差不多, 按 g 刷新
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(ansi-color-for-comint-mode-on)

;;你是不是经常按 C-y 放进一个 kill-ring 里的单元。然后 M-y，M-y，…… 来寻找你需要的很久以前剪切下来的东西？很费事吧？用了 browse-kill-ring 就好了。你只需要把它绑定到一个热键，比如 C-c k: 就能出现这样一个buffer
;;(require 'browse-kill-ring)
;;(global-set-key [(control c)(k)] 'browse-kill-ring)

;; 设置ctrl+<tab>转换buffer.
(defalias 'switch-to-next-buffer 'bury-buffer)
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (nth (- (length (buffer-list)) 1) (buffer-list))))
(global-set-key [C-tab] 'switch-to-previous-buffer)
(global-set-key [C-S-tab] 'switch-to-next-buffer)

;; 设置ido模式，使用flex匹配
(require 'ido)                        ; ido readline
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

;; ;; make #! scripts executable after saving them
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(menu-bar-mode 0)  ;; 默认不打开菜单条，通过C-F10来切换打开

;; 有关界面和字体的配置
(add-hook 'after-make-frame-functions
          (lambda (new-frame)
            (select-frame new-frame)
            (scroll-bar-mode 0)
            (tool-bar-mode 0)
            ))

;; 保存时自动把TAB换成空格，同时清除掉尾部空格（除Makefile之类的文件外，见untabify-file.el)
(require 'untabify-file)

;; 所有类型中回车到新行时，都自动进行一下缩进.
(global-set-key (kbd "RET") 'newline-and-indent)


;; 代替M-x的快捷键，据说这样手舒服一点.
;;(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;;Winner Mode is a global minor mode. When activated, it allows to “undo” (and “redo”) changes in the window configuration with the key commands ‘C-x left’ and ‘C-x right’. In Emacs 22, these keybindings have been changed to ‘C-c left’ and ‘C-c right’.
(winner-mode 1)