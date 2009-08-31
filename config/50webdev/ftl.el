(require 'ftl)
(setq auto-mode-alist (cons '("\\.ftl$" . html-mode) auto-mode-alist))

;;(autoload 'turn-on-ftl-mode "ftl" nil t)
(add-hook 'html-mode-hook 'turn-on-ftl-mode t t)
;;(add-hook 'xml-mode-hook 'turn-on-ftl-mode t t)
;;(add-hook 'text-mode-hook 'turn-on-ftl-mode t t)

;;(setq auto-mode-alist (cons (cons "\\.ftl$" 'ftl-mode) auto-mode-alist))
