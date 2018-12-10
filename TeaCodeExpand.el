;;; TeaCodeExpand.el --- Expansion of text by TeaCode program. -*- lexical-binding: t; -*-
;;; Copyright (C) 2018 Richard Guay

;;; Author: Richard Guay <raguay@customct.com>
;;; Keywords: lisp
;;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; This code is used to expand the current line in TeaCode
;; program on the macOS machine. It is currently the bare bones
;; in terms of functionality.
;;
;;; Code:

(defun TeaCodeExpand ()
  "Expand the current line with TeaCode."
  (interactive)
  (let
      ((ans (shell-command-to-string
             (concat
              "/usr/bin/osascript "
              " -l "
              " JavaScript "
              " -e "
              " 'Application(\"TeaCode\").expandAsJson(\""
              (replace-regexp-in-string "\n$" "" (thing-at-point 'line t))
              "\" , { \"extension\": \""
              (file-name-extension (buffer-file-name) t)
              "\" })'")
             )
            )
       )
       (let
          ((tcjson (json-read-from-string ans)))
          (let
              ((txt (cdr (assoc 'text tcjson)))
               (cursorp (cdr (assoc 'cursorPosition tcjson)))
               (foundText (cdr (assoc 'foundPattern tcjson))))
              (delete-region (line-beginning-position) (line-end-position))
              (insert txt)
              (backward-char (- (length txt) cursorp))
          )
      )
  )
)
(global-set-key (kbd "A-C-e") 'TeaCodeExpand)

(provide 'TeaCodeExpand)
;;; TeaCodeExpand.el ends here
