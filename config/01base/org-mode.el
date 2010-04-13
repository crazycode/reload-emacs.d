
(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\|txt\)$" . org-mode))
(define-key global-map "C-cl" 'org-store-link)
(define-key global-map "C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-hide-leading-stars t)

(setq org-todo-keywords
      (list "TODO(t)" "STARTED(s!)" "WAITING(w@)" "|" "CANCELED(c)" "DONE(d)"))
(setq org-agenda-files
      (list "~/Dropbox/personal.org"
            "~/Dropbox/lab.org"
            "~/Dropbox/fost.org"
            "~/Dropbox/todo.org"))
(defun todo ()
  (interactive)
  (find-file "~/git/org/todo.org")
  )