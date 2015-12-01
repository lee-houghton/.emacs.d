;; Initialize packages and add MELPA to the list.
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Much nicer than Helm!
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Turn off annoying things.
(tool-bar-mode 0)
(electric-layout-mode 0)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq create-lockfiles nil)

;; Turn off some annoying default snippets
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;; Turn on some useful things.
(electric-indent-mode t)
(electric-pair-mode t)
(desktop-save-mode t)
(show-paren-mode t)
(setq save-place t)
(require 'saveplace)
(delete-selection-mode t)
(toggle-save-place-globally t)
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)

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

(add-to-list 'load-path "~/.emacs.d/lisp/")

(dolist (f '("coffee" "css" "editing" "er" "haskell" "html" "js2-stuff" "keys" "markdown" "mc" "sublime" "batch" "sequel" "yas" "brogrammer-theme"))
  (load-file (concat "~/.emacs.d/lisp/" f ".el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("806d8c827b214f5f60348114bd27c6dcb5d19047f7ac482ad61e8077a6c5ea60" default)))
 '(sql-connection-alist
   (quote
    (("portal"
      (sql-product
       (quote postgres))
      (sql-user "admin")
      (sql-database "portal")
      (sql-server "ctgtesting-serv"))))))
