(defun crazycode/indent-and-complete ()
  "Indent line and Complete if point is at end of left a leave word."
  (interactive)
  (cond
   ;; hippie-expand
   ((looking-at "\\_>")
    ;; skip message output
    (flet ((message (format-string &rest args) nil))
      (hippie-expand nil))))
  ;; always indent line
  (indent-for-tab-command))

(setq hippie-expand-try-functions-list
      '(
        yas/hippie-try-expand
        try-expand-line
        try-expand-line-all-buffers
        try-expand-list
        try-expand-list-all-buffers
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name
        try-complete-file-name-partially
        try-complete-lisp-symbol
        try-complete-lisp-symbol-partially
        try-expand-whole-kill))

(global-set-key (kbd "<tab>") 'crazycode/indent-and-complete)
