;; Function keys
(global-set-key [f1] 'manual-entry)
(global-set-key [f2] 'info)
(global-set-key [f3] 'repeat-complex-command)
(global-set-key [f4] 'advertised-undo)
(global-set-key [f5] 'eval-current-buffer)
(global-set-key [f6] 'buffer-menu)
(global-set-key [f7] 'other-window)
(global-set-key [f8] 'find-file)


(defun my-switch-to-last-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer)))

(global-set-key (kbd "C-`") 'other-window)
(global-set-key (kbd "C-;") 'ido-switch-buffer)
(global-set-key "\M-`" 'my-switch-to-last-buffer)