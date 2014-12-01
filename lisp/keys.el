;; As handy as it is in a terminak, it's more useful to kill the current buffer.
(global-set-key (kbd "C-x C-c")
				(lambda ()
				  (interactive)
				  (if (not (buffer-modified-p))
					  (kill-buffer (current-buffer))
					(kill-buffer))))

(global-set-key (kbd "<M-f4>") 'save-buffers-kill-terminal)
