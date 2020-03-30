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

(setq package-enable-at-startup nil)

(setq package-archives
      '(("elpa"         . "https://elpa.gnu.org/packages/")
        ("melpa"        . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))

(require 'org)
(setq vc-follow-symlinks t)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
