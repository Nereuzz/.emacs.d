;;Load IDO on startup
(require 'ido)
(ido-mode t)

;;Load auto-complete-mode
(require 'auto-complete)
(global-auto-complete-mode t)

;;Load Fill-coloumn-indicator
(require 'fill-column-indicator)
(define-globalized-minor-mode
 global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

