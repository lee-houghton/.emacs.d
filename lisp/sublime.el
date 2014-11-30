;;; sublime.el --- Help Sublime Text users feel at home

;; This package allows Sublime Text users to feel more at home
;; by prompting them to donate to the FSF every 20 times a
;; buffer is saved.

;; Author: Lee Houghton <lee@asztal.net>
;; Version: 0.1
;; Keywords: sublime, donate
;; URL: https://github.com/asztal/sublime

(defvar sublime-save-count 0 "Number of times the user has saved a buffer since the last FSF donation prompt.")

(defun sublime-on-save ()
  "When saving a buffer, checks whether or not to display a message reminding the user to donate to the FSF."
  (incf sublime-save-count)
  (when (= sublime-save-count 20)
    (if (y-or-n-p "This version of Emacs has not been registered. Do you want to visit the GNU project website to donate to the Free Software Foundation?")
	(progn
	  (browse-url "http://donate.fsf.org/")
	  (let ((dir "~/.emacs.d/elpa/sublime-mode"))
	    (when (file-exists-p dir)
	      (delete-directory dir t nil)))
	  (set sublime-save-count 21)
	  (remove-hook 'after-save-hook 'sublime-on-save))
      (progn
	(set sublime-save-count 0)))))

(add-hook 'after-save-hook 'sublime-on-save)
