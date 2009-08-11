(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
            '(lambda ()
               (yas/minor-mode-on)
               ))

