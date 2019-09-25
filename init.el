;; If you ever forget who you are
(setq user-full-name "Peter Thomsen")
(setq user-mail-address "pt@zangenberg.biz")

;; Just copied path settings..
(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/usr/bin:/bin" (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin")))
(require 'cl)

;; PACKAGES!!!!! <3<3<3
(load "package")
(package-initialize)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(defvar peter/packages '(auto-complete
                         autopair
                         flycheck
                         magit
                         markdown-mode
                         org
			 spacemacs-theme
			 )
  "Default packages")

;; Install and check for updates on emacs startup
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

;; We dont need no gui! I'm pro..
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)


;; Make marking behavior understandable to humans
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; Empty line markers
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

;; No tabs - indent with 2
(setq tab-width 2
      indent-tabs-mode nil)

;; Ain't got time to write yes/no - replace with y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Neat bindings
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-x g") 'magit-status)

;; Don't yell when I do something wrong..
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)

;; Please go away temporary files
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;; Init flyspell - spellchecker
(setq flyspell-issue-welcome-flag nil)
(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))
(setq-default ispell-list-command "list")

;; THEME SETTINGS
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Cycle through this set of themes
(setq my-themes '(spacemacs-dark spacemacs-light))
(setq spacemacs-theme-comment-bg nil)

(setq my-cur-theme nil)
(defun cycle-my-theme ()
  "Cycle through a list of themes, my-themes"
  (interactive)
  (when my-cur-theme
    (disable-theme my-cur-theme)
    (setq my-themes (append my-themes (list my-cur-theme))))
  (setq my-cur-theme (pop my-themes))
  (load-theme my-cur-theme t))

;; Switch to the first theme in the list above
(cycle-my-theme)

;; Bind this to C-t
(global-set-key (kbd "C-x t") 'cycle-my-theme)

;; Start to move configuration out to files

; load customizations
(add-hook 'after-init-hook '(lambda ()
                              (load "~/.emacs.d/settings/general-config.el")
			      (load "~/.emacs.d/settings/startup-config.el")
                              ))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list nil)
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))))
 '(package-selected-packages
   (quote
    (cuda-mode multiple-cursors auctex yasnippet spacemacs-theme markdown-mode magit flycheck autopair auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
