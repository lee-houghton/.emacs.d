(require 'scss-mode)
(require 'rainbow-mode)

(add-to-list 'rainbow-html-colors-major-mode-list 'web-mode)
(add-to-list 'rainbow-html-colors-major-mode-list 'scss-mode)

; No need to do this since we have a live compiler that does this for us.
(setq scss-compile-at-save nil)
