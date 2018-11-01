(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(elfeed-feeds
   (quote
    ("https://www.journals.elsevier.com/thin-walled-structures/rss")))
 '(ledger-reports
   (quote
    (("bal ^Assets:Chalmers:Studentkår" "ledger ")
     ("bal ^Income ^Expenses" "ledger bal ^Income ^Expenses")
     ("reg Expenses:Cash -b 2018/07/20" "ledger -f main.ledger reg Expenses:Cash -b 2018/07/20")
     (#("bal Assets:PCFinancial -e 2017/10/01" 0 1
	(idx 2))
      "ledger bal")
     (#("reg Liabilities:VISA" 0 1
	(idx 6))
      "ledger ")
     (#("reg Assets:PCFinancial:Chequing" 0 1
	(idx 5))
      "ledger reg")
     (#("bal" 0 1
	(idx 1))
      "%(binary) -f %(ledger-file) bal")
     (#("reg" 0 1
	(idx 4))
      "%(binary) -f %(ledger-file) reg")
     (#("payee" 0 1
	(idx 3))
      "%(binary) -f %(ledger-file) reg @%(payee)")
     (#("account" 0 1
	(idx 0))
      "%(binary) -f %(ledger-file) reg %(account)"))))
 '(org-agenda-files
   (quote
    ("/winc/jk/myLife/gcal-sync/gmail-gcal.org" "/winc/jk/myLife/gcal-sync/private-gcal.org" "/winc/jk/myLife/gcal-sync/ualberta-gcal.org" "/winc/jk/myLife/birthdays.org" "/winc/jk/myLife/bob.org" "/winc/jk/myLife/chalmers.org" "/winc/jk/myLife/contacts.org" "/winc/jk/myLife/monika.org" "/winc/jk/myLife/other.org" "/winc/jk/myLife/refile.org" "/winc/jk/myLife/todo.org")))
 '(org-directory "/winc/jk/myLife")
 '(package-selected-packages
   (quote
    (dashboard org-notebook pamparam org-clock-convenience pass org-super-agenda elfeed-org magithub tango-2-theme scimax-org-babel-ipython-upstream ob-ipython dired-sidebar pyenv-mode org-noter ace-window org-tree-slide calfw-gcal calfw org-gcal org-vcard 2048-game dash which-key use-package undo-tree try spinner python-mode projectile password-store org-ref markdown-mode magit log4e ledger-mode gntp exec-path-from-shell elpy ein diminish cdlatex auctex)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
