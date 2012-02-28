(require 'yasnippet)
;;(add-to-list 'yas/extra-mode-hooks
;;             'ruby-mode-hook)
(yas/initialize)

;; Develop in ~/emacs.d/mysnippets, but also
;; try out snippets in ~/Downloads/interesting-snippets
;;(setq yas/root-directory '("~/.emacs.d/vendor/90snippets/my-snippets"
;;                           "~/.emacs.d/vendor/01base/yasnippet/snippets"))
(setq yas/snippet-dirs '("~/.emacs.d/vendor/90snippets/my-snippets"))

;; Map `yas/load-directory' to every element
;;(mapc 'yas/load-directory yas/root-directory)
(yas/load-directory yas/snippet-dirs)

(setq yas/global-mode t)
(setq yas/indent-line 'auto)
;; (add-hook 'ruby-mode-hook
;;           '(lambda ()
;;              (make-variable-buffer-local 'yas/trigger-key)
;;              (setq yas/trigger-key [tab])))

;;(add-hook 'ruby-mode-hook 'yas/minor-mode-on)
(setq yas/prompt-functions '(yas/dropdown-prompt yas/x-prompt))

