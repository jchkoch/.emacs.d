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

(when (version < emacs-version "27.0")
  (require 'package)

  (setq package-enable-at-startup nil)
  
  (setq package-archives
	'("melpa"        . "https://melpa.org/packages/"))

  (unless (package--initialized (package-initialize)))

  (require 'org)
  (org-babel-load-file (concat user-emacs-directory "config.org")))
