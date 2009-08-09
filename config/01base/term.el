(add-hook 'after-make-frame-functions
          (lambda (new-frame)
            (select-frame new-frame)
            (when (and (not (window-system frame))
                       (string-match "^xterm" (getenv "TERM")))
              (require 'xterm-title)
              (xterm-title-mode 1))
            ))
