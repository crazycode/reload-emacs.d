(setq defer-loading-jde t)

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
