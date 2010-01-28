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