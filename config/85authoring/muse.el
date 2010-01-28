(require 'htmlize)
(require 'muse-mode)

(require 'muse-html)         ;添加html格式的支持
;;(require 'muse-latex)        ; 添加latex格式的支持
;;(require 'muse-texinfo)      ; 添加texinfo格式的支持
;;(require 'muse-docbook)      ; 添加docbook格式的支持
(require 'muse-wiki nil t)
(require 'muse-project)      ; 添加wiki project的支持

                                        ;设置编码方式为utf-8
(setq muse-html-meta-content-type (concat "text/html; charset=utf-8"))

                                        ;新建一个wiki工程
(setq muse-project-alist
      '(("my-wiki"
         ("~/gitworks/my-wiki" :default "index")
         (:base "html" :path "~/gitworks/my-wiki/publish"))))

;; 默认情况下 TAB 键会在各个链接之间跳转，我觉得没有什么用处，而且很烦人，我更喜欢让 TAB 键帮我缩进到正确的位置
(define-key muse-mode-map [tab] 'indent-for-tab-command)

;; TAB 键行使 outline 操作
;;(require 'org)
;;(define-key muse-mode-map (kdb "<tab>") 'org-cycle)
;;(define-key muse-mode-map (kbd "<S-iso-lefttab>") 'org-shifttab)
