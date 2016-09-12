; python-mode
(setq py-install-directory "~/.emacs.d/python-mode-6.0.11")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;; use IPython
;(setq-default py-shell-name "/usr/local/bin/ipython")
;(setq-default py-which-bufname "IPython")

; switch to the interpreter after executing code
;(setq py-shell-switch-buffers-on-execute-p t)
;(setq py-switch-buffers-on-execute-p t)
; don't split windows
;(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
;(setq py-smart-indentation t)
