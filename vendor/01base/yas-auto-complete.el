;;
;; Put this in your .emacs:
;; 		(require 'yas-auto-complete)
;;
;; To use in a given major-mode, e.g., js-mode, use:
;;		(add-hook 'js-mode-hook (lambda () (yas-minor-mode-on)))
;;		(add-hook 'js-mode-hook (lambda () (add-to-list 'ac-sources `ac-new-yas-source)))
;;
;; Works best with the following:
;;		(define-key ac-complete-mode-map "\t" 'ac-complete)
;;		(define-key ac-complete-mode-map "\r" nil)
;;		(setq yas-trigger-key "TAB")
;;

(require 'yasnippet)

(defvar yas-candidates nil)

(defun init-yas-candidates ()
	(let ((table (yas-get-snippet-tables major-mode)))
		(if table
		  (let (candidates (list))
				(mapcar (lambda (mode)          
				  (maphash (lambda (key value)    
					(push key candidates))          
				  (yas-table-hash mode))) 
				table)				
			(setq yas-candidates candidates)))))
			
			
(defvar ac-new-yas-source
	'(	(init . init-yas-candidates)
		(candidates . yas-candidates)
		(action . yas-expand)
		(symbol . "a")))

(provide 'yas-auto-complete)
