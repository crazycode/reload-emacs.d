;; helper function
(defun my-add-subdirs-to-load-path (dir)
  (let ((default-directory (concat dir "/")))
    (setq load-path (cons dir load-path))
    (normal-top-level-add-subdirs-to-load-path)))

(my-add-subdirs-to-load-path "~/.emacs.d/vendor")

;; 机器相关的设置放在init.el
(setq
 jde-jdk (quote ("1.6"))
 jde-compiler (quote ("javac" ""))
 jde-jdk-registry (quote (("1.6" . "/usr/lib/jvm/java-6-openjdk")))
 jde-global-classpath (quote ("~/.emacs.d/vendor/25jdee/jde-2.3.6/classes" "/usr/lib/jvm/java-6-openjdk/"))
 jde-sourcepath (quote ("$JAVA_HOME/src" "." "./src" ""))
 jde-compile-option-debug (quote ("all" (t nil nil)))
 )

;; confluence
(setq confluence-url "http://192.168.208.186/wiki/rpc/xmlrpc")
(setq confluence-default-space-alist (list (cons confluence-url "fost")))

(load "~/.emacs.d/my-custom.el")
(mapc 'load (directory-files "~/.emacs.d/config/01base" t "\.el$"))
(mapc 'load (directory-files "~/.emacs.d/config/20languages" t "\.el$"))
(mapc 'load (directory-files "~/.emacs.d/config/50webdev" t "\.el$"))
(mapc 'load (directory-files "~/.emacs.d/config/70emacsonrails" t "\.el$"))
(mapc 'load (directory-files "~/.emacs.d/config/85authoring" t "\.el$"))
(mapc 'load (directory-files "~/.emacs.d/config/99post" t "\.el$"))

(put 'downcase-region 'disabled nil)
