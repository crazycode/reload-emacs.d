;;; recently opened file
(require 'recentf)
(setq recentf-max-saved-items 300)
(recentf-mode 1)

;; add at the front of list, don't conncect to remote hosts
(add-to-list 'recentf-keep 'file-remote-p)

;;; refer to lgfang-init.el for latest update


(setq ido-enable-flex-matching t)

(defun my-recentf-open ()
  "open recent files.  In ido style if applicable --lgfang"
  (interactive)
  (let* ((path-table (mapcar
                      (lambda (x) (cons (file-name-nondirectory x) x))
                      recentf-list))
         (file-list (mapcar (lambda (x) (file-name-nondirectory x))
                            recentf-list))
         (complete-fun (if (require 'ido nil t)
                           'ido-completing-read
                         'completing-read))
         (fname (funcall complete-fun "File Name: " file-list)))
    (find-file (cdr (assoc fname path-table)))))

(define-key global-map "\C-c\C-r" 'my-recentf-open)
