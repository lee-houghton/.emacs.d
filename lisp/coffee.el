(eval-after-load "coffee-mode"
  (lambda ()
    (define-key coffee-mode-map (kbd "C-c r") 'coffee-compile-region)))
