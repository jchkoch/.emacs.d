;; init.el --- Emacs Configuration
;; ------------------------------------------------

;; Install Packages
;; ------------------------------------------------
(require 'package)

(setq package-archives
      '(("GNU ELPA"     . "http://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("MELPA"        . 5)	
        ("GNU ELPA"     . 0)))

(package-initialize)

;; Bootstrap `diminish` and `dash`
(unless (package-installed-p 'diminish)
  (package-refresh-contents)
  (package-install 'diminish))

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Basic Customizations
;; ------------------------------------------------
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Start the server
;; ------------------------------------------------
(server-start)

;; Load the config
;; ------------------------------------------------
(org-babel-load-file (concat user-emacs-directory "config.org"))

;; Set customized variables to seperate file
;; ------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
