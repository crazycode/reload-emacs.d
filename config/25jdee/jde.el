(setq defer-loading-jde t)
(setq jde-plugins-directory "~/.emacs.d/vendor/25jdee/jde-plugins")

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

