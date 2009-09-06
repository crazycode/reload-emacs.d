(setq defer-loading-jde t)
(setq jde-plugins-directory "~/.emacs.d/vendor/25jdee/jde-plugins")
(setq jde-compile-enable-kill-buffer t) ;;编译成功时关闭提示buffer

;; 编辑.java文件时加载jde
(if defer-loading-jde
    (progn
      ;; setq ad init.el
      (require 'cedet)
      (require 'jde-autoload)
      (require 'jde-eclipse-compiler-server)
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
            (append
             '(("\\.java\\'" . jde-mode))
             auto-mode-alist)))
  (require 'jde))

