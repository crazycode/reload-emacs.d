;; (require 'org)
;; (require 'org-exp)
;; (require 'org-latex)

(require 'org-install)


(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\)$" . org-mode))

(setq org-startup-indented nil)
(setq org-confirm-babel-evaluate nil)

(setq calendar-week-start-day 1)
(setq case-fold-search t)
(setq org-agenda-ndays 7)
(setq org-agenda-repeating-timestamp-show-all nil)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-show-all-dates t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-todo-ignore-deadlines t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-with-date t)
(setq org-agenda-window-setup (quote other-window))
(setq org-fast-tag-selection-single-key nil)
(setq org-use-fast-todo-selection t)
(setq org-log-done (quote (done)))
(setq org-reverse-note-order nil)
(setq org-tags-column -78)
(setq org-tags-match-list-sublevels nil)
(setq org-time-stamp-rounding-minutes 5)
(setq org-use-fast-todo-selection t)
(setq org-use-tag-inheritance nil)
(setq org-columns-default-format "%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")

(add-to-list 'auto-mode-alist '("\.\(org\|org_archive\|txt\)$" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-hide-leading-stars t)


(setq org-log-done 'time)
(setq org-agenda-include-diary nil)
(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)

(add-hook 'org-agenda-mode-hook 'hl-line-mode)

(autoload 'remember "remember" nil t)
(autoload 'remember-region "remember" nil t)

;; #+SEQ_TODO: TODO(t) STARTED(s) WAITING(w) APPT(a) | DONE(d) CANCELLED(c) DEFERRED(f)
(setq org-todo-keywords-for-agenda
      (list "TODO(t)" "STARTED(s!)" "WAITING(w@)" "APPT(a)" "|" "CANCELED(c)" "DONE(d)" "DEFERRED(f)" ))

;; newgtd.org
;;   最主要的文件。包括TODO，项目，预定等，到了时间需要想到的东西都被记录在内。
;; newgtd.org_archive
;;   newgtd.org文件的档案文件。这里记录了已完成任务的履历。
;; someday.org
;; 　将来/也许（Someday/Maybe）文件。这里记录了我还没决定何时做的事情，比如像学习什么，想读的书，想去的地方，新项目的构思，想法等。这里的内容我会每周回顾。
;; journal.org
;;   这个文件作为电子笔记记录了Web地址，每天的笔记，摄影记录，读书笔记，会议笔记，行动记录等信息。
;; birthday.org
;;   记录生日或者是纪念日等信息。这个文件也是一个我的预定计划文件。
(setq org-agenda-files
      (list "~/Dropbox/org/journal.org"
            "~/Dropbox/org/newgtd.org"
            "~/Dropbox/org/work-journal.org"
            "~/Dropbox/org/someday.org"
            "~/Dropbox/org/birthday.org"
            ))
(setq org-refile-targets (quote (("newgtd.org" :maxlevel . 1) ("someday.org" :level . 2))))

;; 通过C-c a调出当天的场景计划: 如H为办公室及家列表
(setq org-agenda-custom-commands
      '(
        ;; 当前关注的项目
        ("P" "Projects"
         ((tags "PRJECT")
          (tags-todo "YABO")
          (tags-todo "CWDS")
          (tags-todo "17BOOKS")
          ))

        ("H" "Office and Home Lists"
         ((agenda)
          (tags-todo "OFFICE")
          (tags-todo "HOME")
          (tags-todo "COMPUTER")
          (tags-todo "READING")))

        ("D" "Daily Action List"
         (
          (agenda "" ((org-agenda-ndays 5)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))
        )
      )

(defun gtd ()
  (interactive)
  (find-file "~/Dropbox/org/newgtd.org")
  )

;; setup org-mode remember
(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file "~/Dropbox/org/.notes")

(org-remember-insinuate)
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

;;(define-key global-map [f12] 'org-remember)

;; 任何任务都应该用明确的动词来表征「Next Action」的行为，并记述该动词的目的和行为的目标。这样一来你不需要再次思考任务的形式，从而简单地执行。比如，与其写「周报告」不如以「总结这一周的来表述任务的内容更加能够容易理解该做什么。
;; 我用以下的词汇来表征任务表：
;; 处理，提问，回避，购买，变更，明确，收集，委托，从事，深思，想象，决定，延期，开发，废弃，重新实现，下载，输入，整理，跟踪，雇佣，改善，增加，报告，寻找，维持，测定，检测，订货，描画，打电话，设置优先级，购入，减少，记忆，修理，回复，调查，回顾，时间安排，卖，送，服务，指定，开始，停止，建议，规划，坐车，更新，升级，写。
(setq org-remember-templates
      '(
        ("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "~/Dropbox/org/newgtd.org" "Tasks")
        ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "~/Dropbox/org/privnotes.org")
        ("Journal" ?j "\n* %^{topic} %T \n%i%?\n" "~/Dropbox/org/journal.org")
        ("WorkJournal" ?w "\n* %^{topic} %T \n%i%?\n" "~/Dropbox/org/work-journal.org")
        ("IDEA" ?i "* IDEA %^{Idea description} ?\n %x\n %a" "~/Dropbox/org/idea.org" "Idea")
        ))

;; 模板设置，可以分别设置不同的格式。非常灵活.
;; f12后可以按s h t d u r分别调用这些模板，非常方便.
;; (setq org-remember-templates
;;       '(
;;         ;; 定义一些环境(context)模板
;;         ("学校" ?s "* TODO %?\n  %i %u" "~/Dropbox/org/newgtd.org" "在学校要做的事情")
;;         ("家里" ?h "* TODO %?\n  %i %u" "~/Dropbox/org/newgtd.org" "在家里要做的事情")
;;         ("电话" ?t "* TODO %?\n  %i %u" "~/Dropbox/org/newgtd.org" "需要打电话")
;;         ("书签" ?b "*  %?\n  %i %a" "~/Dropbox/org/bookmark.org" "程序源代码书签")
;;         ("网址" ?u "*  %?\n  %i" "~/Dropbox/org/url.org" "常用网址")
;;         ("信息" ?i "*  %?\n  %i" "~/Dropbox/org/information.org" "有用的信息")
;;         ("提醒" ?r "*  %?\n  %^T %i " "~/Dropbox/org/remember.org" "记住在特定时间要做的事，到时提醒我")
;;         ))

(define-key global-map [f8] 'remember)
(define-key global-map [f9] 'remember-region)
(define-key global-map "\C-cr" 'org-remember)
(global-set-key (kbd "C-c g") 'gtd)

(add-hook 'org-mode-hook
          (lambda()
            (textmate-mode -1)
            ))

(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))

;; 翻译
(setq org-archive-tag "归档")
(setq org-clock-string "记时:")
(setq org-closed-string "结束:")
(setq org-comment-string "评注")
(setq org-deadline-string "截止期限:")
(setq org-quote-string "引用")
(setq org-scheduled-string "日程安排:")
;; #+SEQ_TODO: TODO(t) STARTED(s) WAITING(w) APPT(a) | DONE(d) CANCELLED(c) DEFERRED(f)
(setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "APPT(a)" "|" "CANCELED(c)" "DONE(d)" "DEFERRED(f)"))))

;;export
(setq org-export-default-language "zh")
;; (add-to-list 'org-export-language-setup  '("zh" "作者" "日期" "目录" "脚注"))

;; html
(setq org-export-html-coding-system 'utf-8)
(setq org-export-html-style-include-default nil)
(setq org-export-html-style-include-scripts nil)
;; (setq org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">")

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
