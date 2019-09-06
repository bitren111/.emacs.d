;;; pasteex-mode.el --- Save clipboard image to disk file, and insert file link to current point.

;; Filename: pasteex-mode.el
;; Description: Save clipboard image to disk file, and insert file link to current point.
;; Author: m2fox <dnxbjyj@126.com>
;; Maintainer: m2fox <dnxbjyj@126.com>
;; Copyright (C) 2019, m2fox, all rights reserved.
;; Created: 2019-09-02 19:24:53
;; Version: 1.0
;; Last-Updated: 2019-09-02 19:24:53
;;           By: m2fox
;; URL: https://github.com/dnxbjyj/pasteex-mode
;; Keywords:
;; Compatibility: GNU Emacs 25.3
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Save clipboard image to disk file, and insert file link to current point.
;;
;; It's an Emacs extension, with it you can just use one key to save clipboard
;; image to disk file, and at the same time insert the file link(org-mode/markdown-mode)
;; or file path(other mode) to current point.

;;; Installation:

;; Download PasteEx.exe from: https://github.com/huiyadanli/PasteEx/releases
;;
;; Put `pasteex-mode.el` to your `load-path`. The `load-path` is usually `~/elisp/`.
;; It's set in your `~/.emacs` file like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;; (require 'pasteex-mode)
;;
;; Set `PasteEx.exe` executable file path to environment PATH, or set the variable
;; `pasteex-executable-path` in your config file, like this:
;; (setq pasteex-executable-path "D:/program/PasteEx/PasteEx.exe")
;;
;; Bind your favority key to function `pasteex-image`, like this:
;; (define-key pasteex-mode-map (kbd "C-c i") 'pasteex-image)
;;
;; After you make a screenshot to clipboard, or copy a PNG image file to clipboard,
;; then just press `C-c i` shortcut, and the file link or path will be inserted to your buffer
;; immediately, the screenshot image file is saved to `./img/` directory by default. 

;;; Customize:
;;
;; `pasteex-executable-path' can customize by:
;;      M-x customize-group RET pasteex-mode RET
;;

;;; Change log:
;;
;; 2019-09-02 Mon
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require


;;; Code:
(defgroup pasteex nil
  "Save clipboard image to disk file, and insert file path to current buffer."
  :group 'pasteex)

(defcustom pasteex-executable-path "pasteex"
  "Pasteex executable file path."
  :type 'string
  :group 'pasteex)

(defun pasteex-image ()
  "Save clipboard image to disk file, and insert file path to current buffer."
  (interactive)
  ;; validate pasteex-executable-path
  (unless (executable-find pasteex-executable-path)
    (user-error "You need to add `pasteex' executable to environment PATH, or set `pasteex-executable-path' value."))
  ;; check if buffer has a file name
  (unless (buffer-file-name)
    (user-error "Current buffer is not related to any file."))
  ;; make img dir if not exists
  (setq img-dir (concatenate 'string (file-name-directory (buffer-file-name)) "/img/"))
  (unless (file-directory-p img-dir)
    (make-directory img-dir))
  ;; build image file name (use `pasteex_screenshot' as prefix, following buffer name, following datetime string)
  (setq img-file-name (format "pasteex_screenshot_%s_%s.png" (file-name-base (buffer-file-name)) (format-time-string "%Y%m%d%H%M%S")))
  ;; save image file to img-dir by invoking pasteex executable command
  (shell-command (format "%s /q %s %s" pasteex-executable-path img-dir img-file-name))
  (setq relative-img-file-path (concatenate 'string "./img/" img-file-name))
  ;; check is png file or not
  (unless (is-png-file relative-img-file-path)
    ;; delete the generated file
    (delete-file relative-img-file-path)
    (user-error "There is no image on clipboard."))
  ;; insert image file path (relative path)
  (insert (build-img-file-insert-path relative-img-file-path)))

(defun build-img-file-insert-path (file-path)
  "Build image file path that to insert to current buffer."
  (cond
   ((string-equal major-mode "markdown-mode") (format "![](%s)" file-path))
   ((string-equal major-mode "org-mode") (format "[[%s]]" file-path))
   (t file-path)))

(defun is-png-file (file-path)
  "Check a file is png file or not."
  (with-temp-buffer
    (insert-file-contents file-path)
    (hexl-mode)
    (setq file-magic-number (buffer-substring-no-properties 11 20))
    ;; png file magic number is `8950 4e47'
    (if (string-equal file-magic-number "8950 4e47")
	t
      nil)))

;;;###autoload
(define-minor-mode pasteex-mode
  "Save clipboard image to disk file, and insert file path to current buffer."
  :lighter " pasteex"
  :keymap (let ((map (make-sparse-keymap)))
	    map))

;;;###autoload
(add-hook 'org-mode-hook 'pasteex-mode)
;;;###autoload
(add-hook 'markdown-mode-hook 'pasteex-mode)

(provide 'pasteex-mode)
;;; pasteex-mode.el ends here
