(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ;;(local-set-key "\t" 'hippie-expand)
            (local-set-key (kbd "<return>") 'textmate-next-line)
            ;;(local-set-key "\C-h" 'ri)
            (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
            (local-set-key "\C-c\C-h" 'ri-ruby-show-args)
            ))
