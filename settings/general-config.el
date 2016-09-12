;;Spellchecker - english and danish
(setq ispell-program-name "aspell")
(setq ispell-program-name "aspell"
      ispell-dictionary "english"
      ispell-dictionary-alist
      (let ((default '("[A-Za-z]" "[^A-Za-z]" "[']" nil
                       ("-B" "-d" "english" "--dict-dir"
                        "/Library/Application Support/cocoAspell/aspell6-en-6.0-0")
                       nil iso-8859-1)))
        `((nil ,@default)
          ("english" ,@default))))

;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Auto-Pair
 (defun autopair-insert-opening ()
     (interactive)
     (when (autopair-pair-p)
       (setq autopair-action (list 'opening (autopair-find-pair) (point))))
     (autopair-fallback))

(add-to-list 'load-path "PATH") ;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;;Remove Backup Files
(setq make-backup-files nil)

;;Highlight Parenthesis
(show-paren-mode t)

;;Aspell
(setq exec-path (append "/usr/local/Cellar/aspell/0.60.6.1" exec-path))

;;Display time
(display-time-mode 1)
(setq display-time-string-forms
       '((propertize (concat " " 24-hours ":" minutes " ")
		     'face 'egoge-display-time)))

;; yasnippet
(require 'yasnippet)

(yas-global-mode 1)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets" ))

;; flyspell
(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")

;; Load "hl-mode"
(global-hl-line-mode)
