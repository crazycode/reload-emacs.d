;; reStructuredText major mode.
(autoload 'rst-mode "rst" nil t)
(add-to-list 'auto-mode-alist '("\\.rst$" . rst-mode))
(add-hook 'rst-adjust-hook 'rst-toc-update)

