(autoload 'ruby-mode "ruby-mode" "Load ruby-mode")

(setq rails-api-root "/usr/lib/ruby/gems/1.8/doc")
(setq ri-ruby-script "~/.emacs.d/vendor/20language/ri-emacs/ri-emacs.rb")
(autoload 'ri "ri-ruby" nil t)

(add-hook 'nxml-mode-hook  
          (lambda ()  
            (setq local-abbrev-table nxml-mode-abbrev-table)))  

;;(defun try-complete-abbrev (old)
;;  (if (expand-abbrev) t nil))
    
(require 'psvn)
(require 'rails)

;; associate ruby-mode with .rb files
(add-to-list 'auto-mode-alist '("\.rb$" . ruby-mode))
(setq auto-mode-alist  (cons '("\\.rjs$" . ruby-mode) auto-mode-alist))  
(setq auto-mode-alist  (cons '("\\.rake$" . ruby-mode) auto-mode-alist))  

(setq rails-always-use-text-menus t)

(modify-coding-system-alist 'file "\\.rhtml$" 'utf-8)
(modify-coding-system-alist 'file "\\.erb$" 'utf-8)

;;设置错误行背景颜色
;;(set-face-background (quote flymake-errline) "#962433")

;;mmm-output-submode-face
;;mmm-code-submode-face

;;(custom-set-faces
;; '(flymake-errline ((((class color)) (:background "DarkRed"))))
;; '(flymake-warnline ((((class color)) (:background "DarkBlue")))))

;; (custom-set-faces
;;  '(flymake-errline ((((class color)) (:background "#CFCFCF"))))
;;  '(flymake-warnline ((((class color)) (:background "#CFCFCF")))))
;; ;;(set-face-background (quote flymake-errline) "#F0F0F0")
;; (set-face-background (quote mmm-output-submode-face) "#F0F0F0")
;; (set-face-background (quote mmm-code-submode-face) "#F0F0F0")
