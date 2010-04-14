(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\|txt\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-hide-leading-stars t)

(setq org-todo-keywords
      (list "TODO(t)" "STARTED(s!)" "WAITING(w@)" "|" "CANCELED(c)" "DONE(d)"))
(setq org-agenda-files
      (list "~/Dropbox/org/personal.org"
            "~/Dropbox/org/idea.org"
            "~/Dropbox/org/fost.org"
            "~/Dropbox/org/todo.org"))
(defun todo ()
  (interactive)
  (find-file "~/Dropbox/org/todo.org")
  )

;; setup org-mode remember
(setq org-default-notes-file "~/Dropbox/org/notes")
(define-key global-map [f12] 'org-remember)

(setq org-remember-templates
      '(("TODO" ?t "* TODO %?\n %x\n %a" "~/Dropbox/org/todo.org" "Tasks")
        ("IDEA" ?i "* IDEA %?\n %x\n %a" "~/Dropbox/org/idea.org" "Idea")
        ))