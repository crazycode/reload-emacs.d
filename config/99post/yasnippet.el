(require 'yasnippet)
;;(add-to-list 'yas/extra-mode-hooks
;;             'ruby-mode-hook)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/90yasnippet/snippets")
(yas/load-directory "~/.emacs.d/vendor/01base/yasnippet/snippets")
;;(setq yas/root-directory "~/.emacs.d/snippets")

(setq yas/global-mode t)
(setq yas/indent-line 'auto)
;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (make-variable-buffer-local 'yas/trigger-key)
;;              (setq yas/trigger-key [tab])))

;;(add-hook 'ruby-mode-hook 'yas/minor-mode-on)
