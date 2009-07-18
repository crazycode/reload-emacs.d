(require 'xterm-title)
(add-hook 'after-make-frame-functions
          (lambda (new-frame)
            (when (and (not window-system)
                       (string-match "^xterm" (getenv "TERM")))
              ;;(require 'xterm-title)
              (xterm-title-mode 1))
            ))
