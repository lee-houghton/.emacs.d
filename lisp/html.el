(require 'web-mode)
(require 'zencoding-mode)

(add-to-list 'auto-mode-alist '("\\.dust\\'" . web-mode))

(setq web-mode-engines-alist
      '(("dust" . "\\.dust\\'")))

(setq web-mode-enable-auto-pairing t)

(add-hook 'web-mode-hook 'zencoding-mode)
