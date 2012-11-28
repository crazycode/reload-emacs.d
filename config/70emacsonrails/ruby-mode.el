(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

;; (defun crazycode/indent-and-complete ()
;;   "Indent line and Complete if point is at end of left a leave word."
;;   (interactive)
;;   (cond
;;    ;; hippie-expand
;;    ((looking-at "\\_>")
;;     ;; skip message output
;;     (flet ((message (format-string &rest args) nil))
;;       (hippie-expand nil))))
;;   ;; always indent line
;;   (indent-for-tab-command))

;;  (setq hippie-expand-try-functions-list
;;        '(
;;          yas-hippie-try-expand
;;          try-expand-dabbrev
;;          try-expand-dabbrev-visible
;;          try-expand-dabbrev-all-buffers
;;          try-expand-dabbrev-from-kill
;;          try-complete-file-name
;;          try-complete-file-name-partially
;;          try-complete-lisp-symbol
;;          try-complete-lisp-symbol-partially
;;          try-expand-line
;;          try-expand-line-all-buffers
;;          try-expand-list
;;          try-expand-list-all-buffers
;;          try-expand-whole-kill))

;;(global-set-key (kbd "<tab>") 'crazycode/indent-and-complete)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(require 'yari)
(defun ri-bind-key ()
   (local-set-key [f1] 'yari-anything))

(add-hook 'ruby-mode-hook 'ri-bind-key)

(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (textmate-mode t)
;;            (local-set-key (kbd "TAB") 'crazycode/indent-and-complete)
            (local-set-key (kbd "<return>") 'ruby-reindent-then-newline-and-indent)
            (local-set-key (kbd "RET") 'ruby-reindent-then-newline-and-indent)
            ))
