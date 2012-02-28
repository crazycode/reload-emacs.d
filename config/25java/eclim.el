(require 'eclim)

(setq eclim-auto-save t)
(global-eclim-mode)

(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)