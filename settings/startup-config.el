;;Load IDO on startup
(require 'ido)
(ido-mode t)

;;Load auto-complete-mode
(require 'auto-complete)
(global-auto-complete-mode t)

;;Load column number
(setq column-number-mode t)

;;Remove temporary files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
