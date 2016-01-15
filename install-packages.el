(require 'package)

(package-initialize)
(package-refresh-contents)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(dolist (p '(circe clippy coffee-mode expand-region
	     figlet gh git-commit-mode git-gutter+ git-rebase-mode
	     gitconfig github-browse-file github-clone gitignore-mode
	     gruvbox-theme haskell-mode how-many-lines-in-project js2-mode
	     keyfreq lorem-ipsum magit mark-multiple markdown-mode
	     multiple-cursors nyan-mode nyan-prompt pgdevenv rainbow-mode
	     scss-mode unbound web-mode zencoding-mode undo-tree dos
         csharp-mode uuidgen))
  (package-install p))
