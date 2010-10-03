;; using Emacs 23.2 and the embedded CEDET
(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/jar/malabar")
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;; If you want to mimic the IDEish compile-on-save
;; behaviour, add the following as well::
(add-hook 'malabar-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'malabar-compile-file-silently
                      nil t)))
