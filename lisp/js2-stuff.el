(require 'js2-mode)

(setq js2-global-externs '(app $ jsSHA dust moment async))
(setq js2-include-node-externs t)
(setq js2-indent-switch-body t)
(setq js2-missing-semi-one-line-override t)
(setq js2-strict-missing-semi-warning nil)

(with-eval-after-load "js2-mode"
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))
