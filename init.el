;; Initialize packages and add MELPA to the list.
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Much nicer than Helm!
(ido-mode t)

;; Turn off annoying things.
(tool-bar-mode 0)
(electric-layout-mode 0)
(setq indent-tabs-mode nil)
(setq inhibit-startup-screen t)

;; Turn on some useful things.
(electric-indent-mode t)
(electric-pair-mode t)
(desktop-save-mode t)
(show-paren-mode t)
(setq save-place t)
(require 'saveplace)
(delete-selection-mode t)
(toggle-save-place-globally t)

;; Default settings.
(setq default-tab-width 4)
(setq tab-width 4)
(set-default 'fill-column 100)

;; Backup files
(setq auto-save-default nil)
(setq backup-directory-alist
      '(("" . "~/.emacs.d/backups")))

;; Identify yourself.

(setq user-full-name "Lee Houghton")
(setq user-mail-address "lee@theconnectgroup.net")

;; Theme.
(load-theme 'gruvbox t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(dolist (f '("css" "editing" "er" "haskell" "html" "js" "keys" "markdown" "mc" "sublime" "batch" "sequel"))
  (load-file (concat "~/.emacs.d/lisp/" f ".el")))
