;; Lee-specific stuff.

(global-set-key
 (kbd "<f12>")
 (lambda ()
   (interactive)
   (find-file "~/.emacs.d/init.el")))

(put 'dired-find-alternate-file 'disabled nil)

(global-set-key (kbd "C-l") 'kill-whole-line)

;; C-<return> opens a new line, indents, and pushes the part of the line
;; after the cursor onto a new line as well. Useful for JavaScript functions.
(defun open-line-and-indent ()
  (interactive)
  (open-line 1)
  (newline-and-indent))
(global-set-key (kbd "C-<return>") 'open-line-and-indent)

;; F8 removes tabs from the buffer.
;; F9 toggles white space viewing.
(global-set-key
 (kbd "<f8>")
 (lambda ()
   (interactive)
   (tabify (point-min) (point-max))))

(global-set-key (kbd "<f9>") 'whitespace-mode)

