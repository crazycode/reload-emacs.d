;; Function keys
(global-set-key [f1] 'manual-entry)
(global-set-key [f2] 'info)
;; F3 Macro begin record
;; F4 Macro end record or Run Macro
(global-set-key [f5] 'eval-current-buffer)
(global-set-key [f6] 'buffer-menu)
(global-set-key [f7] 'other-window)

;; F8 F9 used by org-mode
;; (global-set-key [f8] 'find-file)
;;(global-set-key [f9] 'repeat-complex-command)

;; F10 (menu-bar-open &optional FRAME)
(global-set-key [f11] 'advertised-undo)
;; F11 (org-remember &optional GOTO ORG-FORCE-REMEMBER-TEMPLATE-CHAR)

(defun my-switch-to-last-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer)))

(global-set-key (kbd "C-`") 'other-window)
(global-set-key (kbd "C-M-;") 'ido-switch-buffer)
(global-set-key "\M-`" 'my-switch-to-last-buffer)
