;;; ox-word.el --- Collection of functions to export to MS Word documents
;; Collection of ideas to get Word documents

;; * Using pandoc via LaTeX

;; Use #+PANDOC-CSL: /Users/jkitchin/Downloads/elsevier-with-titles.csl to set
;; the bibliography style. You can get the csl files from
;; https://www.zotero.org/styles


;;; Commentary:
;;

;;; Code:

(defun ox-export-via-latex-pandoc-to-docx-and-open (&optional async subtreep visible-only body-only options)
  "Export the current org file as a docx via LaTeX."
  (interactive)
  (let* ((bibfiles (mapcar 'expand-file-name (org-ref-find-bibliography)))
	 (temp-bib)
	 (bibtex-entries)
	 biboption
	 csl
	 ;; this is probably a full path
	 (current-file (buffer-file-name))
	 (basename (file-name-sans-extension current-file))
	 (tex-file (concat basename ".tex"))
	 (docx-file (concat basename ".docx")))

    (save-buffer)

    ;; I make a temp bibfile because my big one causes pandoc to choke. This
    ;; should only create a file with the required entries.
    (when bibfiles
      (setq bibtex-entries (let* ((bibtex-files bibfiles)
				  (keys (reverse (org-ref-get-bibtex-keys)))
				  (bibtex-entry-kill-ring-max (length keys))
				  (bibtex-entry-kill-ring '()))

			     (save-window-excursion
			       (cl-loop for key in keys
					do
					(bibtex-search-entry key t)
					(bibtex-kill-entry t)))
			     (mapconcat
			      'identity
			      bibtex-entry-kill-ring
			      "\n\n"))
	    temp-bib (make-temp-file "ox-word-" nil ".bib")
	    biboption (format " --bibliography=%s " temp-bib))
      (with-temp-file temp-bib
	(insert bibtex-entries)))

    (setq csl (cdr (assoc "PANDOC-CSL"
			  (org-element-map (org-element-parse-buffer) 'keyword
			    (lambda (key) (cons
					   (org-element-property :key key)
					   (org-element-property :value key)))))))
    (if csl (setq csl (format " --csl=%s " csl))
      (setq csl " "))
    
    (org-latex-export-to-latex async subtreep visible-only body-only options)

    (when (file-exists-p docx-file) (delete-file docx-file))
    (shell-command (format
		    "pandoc -s -S %s%s\"%s\" -o \"%s\""
		    biboption
		    csl
		    tex-file
		    docx-file))
    (when (file-exists-p temp-bib)
      (delete-file temp-bib))
    (org-open-file docx-file '(16))))

(defun ox-export-via-latex-pandoc-to-html-and-open (&optional async subtreep visible-only body-only options)
  "Export the current org file as a html via LaTeX."
  (interactive)
  (let* ((bibfile (expand-file-name (car (org-ref-find-bibliography))))
	 (temp-bib)
	 (bibtex-entries)
	 biboption
	 csl
	 ;; this is probably a full path
	 (current-file (buffer-file-name))
	 (basename (file-name-sans-extension current-file))
	 (tex-file (concat basename ".tex"))
	 (html-file (concat basename ".html")))

    (save-buffer)

    ;; I make a temp bibfile because my big one causes pandoc to choke. This
    ;; should only create a file with the required entries.
    (when bibfile
      (setq bibtex-entries (let* ((bibtex-files (org-ref-find-bibliography))
				  (keys (reverse (org-ref-get-bibtex-keys)))
				  (bibtex-entry-kill-ring-max (length keys))
				  (bibtex-entry-kill-ring '()))

			     (save-window-excursion
			       (cl-loop for key in keys
					do
					(bibtex-search-entry key t)
					(bibtex-kill-entry t)))
			     (mapconcat
			      'identity
			      bibtex-entry-kill-ring
			      "\n\n"))
	    temp-bib (make-temp-file "ox-html-" nil ".bib")
	    biboption (format " --bibliography=%s " temp-bib))
      (with-temp-file temp-bib
	(insert bibtex-entries)))

    (setq csl (cdr (assoc "PANDOC-CSL"
			  (org-element-map (org-element-parse-buffer) 'keyword
			    (lambda (key) (cons
					   (org-element-property :key key)
					   (org-element-property :value key)))))))
    (if csl (setq csl (format " --csl=%s " csl))
      (setq csl " "))


    (org-latex-export-to-latex async subtreep visible-only body-only options)

    (when (file-exists-p html-file) (delete-file html-file))
    (shell-command (format
		    "pandoc -s -S %s%s%s -o %s"
		    biboption
		    csl
		    tex-file
		    html-file))
    (when (file-exists-p temp-bib)
      (delete-file temp-bib)) 
    (browse-url html-file)))


(org-export-define-derived-backend 'MSWord 'latex
  :menu-entry
  '(?w "Export to MS Word"
       ((?p "via Pandoc/LaTeX" ox-export-via-latex-pandoc-to-docx-and-open))))

(org-export-define-derived-backend 'pandoc-html 'latex
  :menu-entry
  '(?h "Export to HTML"
       ((?p "via Pandoc/LaTeX" ox-export-via-latex-pandoc-to-html-and-open))))

(provide 'ox-word)

;;; ox-word.el ends here
