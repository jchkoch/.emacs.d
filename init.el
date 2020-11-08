;; init.el --- Personal GNU Emacs configuration file.

;; Copyright (c) 2020 James Koch <jchkoch@gmail.com>
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; version 2
;; of the License.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This file sets up the essentials for incorporating my init org
;; file. This is known as "literate programming" and is helpful for
;; sharing Emacs configurations with wider audiences that include
;; novice users (of which I myself belong to).

;;; Code:

(require 'package)

(add-to-list 'package-archives
             '("melpa"        . "https://melpa.org/packages/"))

;; (package-initialize)

;; Make sure `use-package' is available.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure `use-package' prior to loading it.
(eval-when-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t)
  (setq use-package-compute-statistics nil)
  ;; The following is IMPORTANT. Write hooks using their real name
  ;; instead of a shorter version: after_init ==> `after-init-hook'
  ;;
  ;; This is to empower help commands with their contextual awareness,
  ;; such as `describe-symbol'.
  (setq use-package-hook-name-suffix nil))

(eval-when-compile
  (require 'use-package))

(use-package vc
  :config
  (setq vc-follow-symlinks t)) ; Because my dotfiles are managed that way

;; For my custom libraries
(add-to-list 'load-path "~/.emacs.d/lisp")

;; since Emacs 27.1
(let* ((conf "~/.emacs.d/config")
       (el (concat conf ".el"))
       (org (concat conf ".org")))
  (if (file-exists-p el)
      (load-file el)
    (use-package org)
    (org-babel-load-file org)))

;; prior to Emacs 27.1
;; Load my Org configuration file
;(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
