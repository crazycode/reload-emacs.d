(require 'yasnippet)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" "~/.emacs.d/snippets2"           ;; personal snippets
        ))

(yas-global-mode 1)

;;; use popup menu for yas-choose-value
(require 'popup)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

;; (setq yas-prompt-functions '(yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))
(setq yas-prompt-functions '(yas-dropdown-prompt yas-ido-prompt yas-no-prompt))


(setq yas-indent-line 'auto)

