;;;;; Theme ;;;;;
;; Cycle through this set of themes
(setq my-themes '(spacemacs-dark spacemacs-light solarized-dark))
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
