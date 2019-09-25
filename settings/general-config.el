
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


;; Auto-Pair
 (defun autopair-insert-opening ()
     (interactive)
     (when (autopair-pair-p)
       (setq autopair-action (list 'opening (autopair-find-pair) (point))))
     (autopair-fallback))

(add-to-list 'load-path "PATH") ;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;; Go to hell backup files..
(setq make-backup-files nil)

;; highlight parens
(show-paren-mode t)


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

;; futhark mode
(add-to-list 'load-path "~/.emacs.d/futhark-mode")
(require 'futhark-mode)

;; Column numbers plzz
(setq column-number-mode t)
