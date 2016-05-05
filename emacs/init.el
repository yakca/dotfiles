(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(load-theme 'solarized-dark t)

; show column-number in the mode line
(column-number-mode 1)

; don't show the tool bar
(tool-bar-mode -1)

; don't show the scroll bar
(scroll-bar-mode -1)
