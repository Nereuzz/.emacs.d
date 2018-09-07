(setq user-full-name "Peter Thomsen")
(setq user-mail-address "thomsenpeter1995@hotmail.com")

(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))
(require 'cl)

;;Package-manager
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(setq package-archive-enable-alist '(("melpa" magit f)))

(defvar peter/packages '(autopair
			  emojify
                          fsharp-mode
			  auctex
			  flycheck
			  gist
			  graphviz-dot-mode
			  magit
			  marmalade
			  solarized-theme
			  spacemacs-theme
			  undo-tree
			  auto-complete
			  yasnippet
			  neotree
			  haskell-mode
			  )
  "Default packages")

(defun peter/packages-installed-p ()
  (loop for pkg in peter/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

 (unless (peter/packages-installed-p)
   (message "%s" "Refreshing package database...")
   (package-refresh-contents)
   (dolist (pkg peter/packages)
     (when (not (package-installed-p pkg))
       (package-install pkg))))

;; Initial start
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

;;Disable scrollbar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)


;;Theme
(if window-system
    (load-theme 'solarized-dark t)
  (load-theme 'wombat t))

;;Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;;replace "yes" and "no" with y and n
(defalias 'yes-or-no-p 'y-or-n-p)


;;Keybindings - fix 2 meta keys problem (2 ALT keys)
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

; load customizations
(add-hook 'after-init-hook '(lambda ()
                              (load "~/.emacs.d/settings/general-config.el")
                              (load "~/.emacs.d/settings/latex-config.el")
                              (load "~/.emacs.d/settings/theme-config.el")
                              (load "~/.emacs.d/settings/startup-config.el")
                              (load "~/.emacs.d/settings/python-config.el")
                              ))

;; Bind comment region to C-;
(global-set-key (kbd "C-;") 'comment-region)

;; undo-tree mode
(global-undo-tree-mode)
(put 'set-goal-column 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (exec-path-from-shell auctex-latexmk yasnippet undo-tree spacemacs-theme solarized-theme neotree marmalade magit graphviz-dot-mode gist fsharp-mode emojify autopair auto-complete auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Delete backup-files
(setq make-backup-files nil)

;; indent options
(setq tab-width 2
      indent-tabs-mode nil)
