(require 'org)
(require 'org-exp)
(require 'org-latex)
(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\)$" . org-mode))
(setq org-log-done t)
(setq org-startup-indented nil)
(setq org-confirm-babel-evaluate nil)

(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\|txt\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)

(setq org-todo-keywords
      (list "TODO(t)" "STARTED(s!)" "WAITING(w@)" "|" "CANCELED(c)" "DONE(d)"))
(setq org-agenda-files
      (list "~/Dropbox/org/personal.org"
            "~/Dropbox/org/idea.org"
            "~/Dropbox/org/sdo.org"
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

(add-hook 'org-mode-hook
          (lambda()
            (textmate-mode -1)
            ))


;; 翻译
(setq org-archive-tag "归档")
(setq org-clock-string "记时:")
(setq org-closed-string "结束:")
(setq org-comment-string "评注")
(setq org-deadline-string "截止期限:")
(setq org-quote-string "引用")
(setq org-scheduled-string "日程安排:")
(setq org-todo-keywords (quote ((sequence "待做"  "取消" "完成"))))
;;export
(setq org-export-default-language "zh")
(add-to-list 'org-export-language-setup  '("zh" "作者" "日期" "目录" "脚注"))
;; html
(setq org-export-html-coding-system 'utf-8)
(setq org-export-html-style-include-default nil)
(setq org-export-html-style-include-scripts nil)

;; latex
(setq org-export-latex-coding-system 'utf-8)
(setq org-export-latex-date-format "%Y-%m-%d")
(setq org-latex-to-pdf-process '("xelatex -interaction nonstopmode %s"
                                 "xelatex -interaction nonstopmode %s"))
(setq org-export-latex-classes  '(("article" "\\documentclass[hyperref,fntef,UTF8,winfonts]{ctexart}"
                                   ("\\section{%s}" . "\\section*{%s}")
                                   ("\\subsection{%s}" . "\\subsection*{%s}")
                                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
                                  ("report" "\\documentclass[hyperref,fntef,UTF8,winfonts]{ctexrep}"
                                   ("\\part{%s}" . "\\part*{%s}")
                                   ("\\chapter{%s}" . "\\chapter*{%s}")
                                   ("\\section{%s}" . "\\section*{%s}")
                                   ("\\subsection{%s}" . "\\subsection*{%s}")
                                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
                                  ("book" "\\documentclass[hyperref,fntef,UTF8,winfonts]{ctexbook}"
                                   ("\\part{%s}" . "\\part*{%s}")
                                   ("\\chapter{%s}" . "\\chapter*{%s}")
                                   ("\\section{%s}" . "\\section*{%s}")
                                   ("\\subsection{%s}" . "\\subsection*{%s}")
                                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
                                  ("beamer" "\\documentclass[winfonts,UTF8,fntef,hyperref]{ctexart}" org-beamer-sectioning)))
(setq org-export-latex-default-packages-alist '(("" "amsthm" t)
                                        ("" "geometry" nil)
                                        ("" "verbatim" t)
                                        ("" "color" t)
                                        ("" "tikz" t)))

