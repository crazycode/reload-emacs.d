(defun my-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))
(defun my-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s %s" font-name font-size)))

(defun my-set-font (english-fonts
                    english-font-size
                    chinese-fonts
                    &optional chinese-font-size)
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find if
  (let ((en-font (my-make-font-string
                  (find-if #'my-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'my-font-existsp chinese-fonts)
                            :size chinese-font-size)))

    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (message "Set English Font to %s" en-font)
    (set-face-attribute
     'default nil :font en-font)

    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (message "Set Chinese Font to %s" zh-font)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        zh-font))))


;; set my default font on emacs23 gui, auto select font.
(defun setup-emacs23-default-font (frame)
  ;;(interactive)
  (if (and (window-system frame) (>= emacs-major-version 23))
      (progn
        (my-set-font
         '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace" "Courier New") ":pixelsize=14"
         '("Microsoft Yahei" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))

        ;;(set-default-font "Yahei Consolas Hybrid-10")
        ;;(set-fontset-font (frame-parameter nil 'font)
        ;;                 'han '("Yahei Consolas Hybrid"."unicode-bmp"))
        ))
  )

(setup-emacs23-default-font (selected-frame))

(add-hook 'after-make-frame-functions
          (lambda (new-frame)
            (select-frame new-frame)
            (setup-emacs23-default-font new-frame)
            ))
