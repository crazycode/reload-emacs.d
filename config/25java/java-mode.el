(require 'java-mode-indent-annotations)

(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode nil)
                            (java-mode-indent-annotations-setup)
                            ))