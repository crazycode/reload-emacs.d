(require 'project-root)

(setq project-roots
      `(("Generic Perl Project"
         :root-contains-files ("t" "lib")
         :filename-regex ,(regexify-ext-list '(pl pm))
         :on-hit (lambda (p) (message (car p))))
        ("Ror project"
         :root-contains-files ("Gemfile" "app" "db" "public")
         :filename-regex ,(regexify-ext-list '(rb html css js cucumber yml))
         :exclude-paths ("logs" "tmp"))
        ("Ruby project"
         :root-contains-files ("Gemfile" "Rakefile")
         :filename-regex ,(regexify-ext-list '(rb html txt md rdoc css js cucumber yml))
         :exclude-paths ("logs" "tmp"))
        ("Emacs dotfile"
         :root-contains-files ("init.el")
         :filename-regex ,(regexify-ext-list '(el yasnippet))
         :exclude-paths ("auto-save-list" "backup" "snippets" "tmp"))
        ("Web Project"
         :root-contains-files ("app" "test" "conf")
         :filename-regex ,(regexify-ext-list '(java html css js yml xml conf rb))
         :exclude-paths ("modules" "lib" "logs" "test-result" "precompiled" "eclipse"))
        ))

(global-set-key (kbd "C-c p f") 'project-root-find-file)
(global-set-key (kbd "C-c p g") 'project-root-grep)
(global-set-key (kbd "C-c p a") 'project-root-ack)
(global-set-key (kbd "C-c p d") 'project-root-goto-root)
(global-set-key (kbd "C-c p l") 'project-root-browse-seen-projects)
(global-set-key (kbd "C-c p M-x")
                'project-root-execute-extended-command)

(global-set-key (kbd "C-c p s")
                (lambda () (interactive)
                  (with-project-root
                      (ansi-term (getenv "SHELL")
                                 (concat (car project-details) "-shell")))))

(global-set-key
 (kbd "C-c p v")
 (lambda ()
   (interactive)
   (with-project-root
    (let ((root (cdr project-details)))
      (cond
       ((file-exists-p ".svn")
        (svn-status root))
       ((file-exists-p ".git")
        (git-status root))
       (t
        (svn-status root)))))))
