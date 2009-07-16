(require 'yasnippet)
(add-to-list 'yas/extra-mode-hooks
             'ruby-mode-hook)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/01base/yasnippet/snippets")
(yas/load-directory "~/.emacs.d/vendor/70rubyonrails/emacs-rails-reloaded/snippets")
;;(setq yas/root-directory "~/.emacs.d/snippets")
