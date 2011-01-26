(require 'color-theme)
(color-theme-initialize)

;;(color-theme-jsc-dark)

;;(color-theme-dark-laptop)   ;;2008-02-22

;;(color-theme-gnome2)
;;(color-theme-dark-blue)
;;(color-theme-tty-dark)
;;(color-theme-comidia)  ;;2008-03-01

;;(color-theme-emacs-nw)

;;(color-theme-blue)

;;(color-theme-ir-black)

;; hook: test win sys to rerun ctheme
(defun set-win-color-theme(frame)
  ;; must be current for local ctheme
  (select-frame frame)
  ;; test winsystem
  (let ((color-theme-is-global nil))
    (if (window-system frame)
        (color-theme-blackboard)
        ;; (color-theme-blue)
      (color-theme-tty-dark)
      )
    )
  )
;; hook on after-make-frame-functions
(add-hook 'after-make-frame-functions 'set-win-color-theme)

;; default start - if non daemon
(set-win-color-theme (selected-frame))

