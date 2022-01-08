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

;; Prior to Emacs v27, the `init.el' was supposed to handle the
;; initialisation of the package manager, by means of calling
;; `package-initialise'. Starting with Emacs v27, the default
;; behaviour is to start the package manager before loading the init
;; file.

;; Initialise installed packages
(setq package-enable-at-startup t)

(defvar package-quickstart)

;; Allow loading from the package cache
(setq package-quickstart t)

;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)

;; Disable GUI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(setq inhibit-splash-screen t)
(setq use-dialog-box t)         ; only for mouse events
(setq use-file-dialog nil)

(setq inhibit-startup-echo-area-message "jkoch") ; read the docstring
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)

;;; early-init.el ends here
