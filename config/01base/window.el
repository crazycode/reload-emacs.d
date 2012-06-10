;; 对窗口布局实现undo/redo
(setq winner-dont-bind-my-keys t)
(winner-mode t)
(global-set-key (kbd "C-c C-z") 'winner-undo)
(global-set-key (kbd "C-c C-y") 'winner-redo)
(global-set-key (kbd "C-c z") 'winner-undo)
(global-set-key (kbd "C-c y") 'winner-redo)

;; 可以用S-<up>、S-<right>跳转到上面、右边的窗口
(windmove-default-keybindings)
