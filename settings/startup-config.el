;; Load Ido-mode on startup
(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)

;; Auto-complete
(require 'auto-complete-config)
(ac-config-default)


;;Remove temporary files
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
