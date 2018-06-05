;; init.el --- Emacs Configuration
;; ------------------------------------------------

;; Install Packages
;; ------------------------------------------------

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap `diminish`
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
