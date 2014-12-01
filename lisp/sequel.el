;; SQL

;; Run the currently selected piece of text.
;; Use SQLi if possible.
(add-hook
 'sql-mode-hook
 (lambda ()
   (sql-highlight-postgres-keywords)
   
   (define-key sql-mode-map (kbd "<f5>")
     (lambda ()
       (interactive)
       (let ((buf (sql-find-sqli-buffer)))
         ;;(if (nilp buf) (run-current-file)
         (if (use-region-p)
             (sql-send-region)
           (sql-send-buffer)))))

   (define-key sql-mode-map (kbd "<f9>")    
     (lambda ()
       (interactive)
       (let ((sql-server "localhost")
             (sql-database "portal")
             (sql-postgres-options '("-U" "lee")))
         (sql-postgres))))

   (defun sql-clear-sqli-buffer ()
     (interactive)
     (with-current-buffer (sql-find-sqli-buffer) (erase-buffer)))

   ;; Clears the SQLi buffer and sends the current SQL buffer contents for execution
   (define-key sql-mode-map (kbd "C-c C-w")
     (lambda ()
       (interactive)
       (sql-clear-sqli-buffer)
       (when (null sql-buffer)
         (setq sql-buffer (sql-find-sqli-buffer)))
       (sql-send-buffer)))

   (define-key sql-mode-map (kbd "C-c C-q") 'sql-clear-sqli-buffer)

   (define-key sql-mode-map (kbd "C-c C-f")
     (lambda ()
       (interactive)
       (let* ((function-name (thing-at-point 'symbol))
              (cmd (concat "select oid::regproc as name,
                                pg_catalog.pg_get_function_arguments(oid) as args
                            from pg_proc
                            where proname = lower('" function-name "');")))
		 (when (not (bufferp sql-buffer))
		   (setq sql-buffer (sql-find-sqli-buffer)))
         (sql-send-string cmd))))


   (define-key sql-mode-map (kbd "C-c C-t")
     (lambda ()
       (interactive)
       (let* ((table-name (thing-at-point 'symbol))
              (cmd (concat "select table_name, column_name, data_type, column_default, character_maximum_length as len from information_schema.columns where table_name = '" table-name "' order by ordinal_position;")))
		 (when (not (bufferp sql-buffer))
		   (setq sql-buffer (sql-find-sqli-buffer)))
         (sql-send-string cmd))))))
