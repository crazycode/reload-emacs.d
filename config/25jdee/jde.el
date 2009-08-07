(setq defer-loading-jde t)
(setq jde-plugins-directory "~/.emacs.d/vendor/25jdee/jde-plugins")
(setq jde-mvn-nexus-url "http://192.168.208.186/nexus")
;; to read:
;;
;;  (setq defer-loading-jde t)
;;
;; 编辑.java文件时加载jde
;; (if defer-loading-jde
;;     (progn
;;       (require 'jde)
;;       (autoload 'jde-mode "jde" "JDE mode." t)
;;       (setq auto-mode-alist
;;             (append
;;              '(("\\.java\\'" . jde-mode))
;;              auto-mode-alist)))
;;   (require 'jde))

;; setq ad init.el
(require 'cedet)
(require 'jde-autoload)

(require 'jde-eclipse-compiler-server)
