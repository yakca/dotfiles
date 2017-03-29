;;; init.el -- yakca's Emacs config

;;; Commentary:
;; yakca's Emacs config

;;; Code:

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; bootstrap 'use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; add /usr/local/bin to path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

;;;; package install and config

(use-package free-keys
  :ensure t
  :init
  (global-set-key (kbd "C-h C-k") 'free-keys))

(use-package js2-mode
  :ensure t)

(use-package json-mode
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package scss-mode
  :ensure t)

(use-package flycheck
  :ensure t
  ;; :init (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint))))

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark t))

(use-package ace-window
  :ensure t
  :init
  (global-set-key (kbd "M-[") 'ace-window)
  :config
  (setq-default aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
                aw-dispatch-always t))

(use-package projectile
  :ensure t
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; stop slow start up with helm (arch wiki)
(use-package tramp
  :init
  (setq-default tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no"))

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.

(use-package helm
  :ensure t
  :init
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 50)
    (helm-mode))

  (use-package helm-projectile
    :ensure t
    :init
    (helm-projectile-on)
    (setq projectile-completion-system 'helm)
    (setq projectile-indexing-method 'alien) ;; external indexing, mainly for windows
    (setq projectile-switch-project-action 'helm-projectile))
  :bind (("C-c m" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-c h o" . helm-occur)
         ("C-c h SPC" . helm-all-mark-rings)
         ("C-x C-f" . helm-find-files))
  :config
  (setq-default helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
                helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
                helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
                helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
                helm-ff-file-name-history-use-recentf t
                helm-M-x-fuzzy-match                  t ; fuzzy matching for M-x
                helm-buffers-fuzzy-matching           t
                helm-recentf-fuzzy-match              t
                helm-semantic-fuzzy-match             t
                helm-imenu-fuzzy-match                t
                helm-locate-fuzzy-match               t
                helm-gtags-prefix-key                 "\C-cg")
  (when (executable-find "curl")
    (setq-default helm-google-suggest-use-curl-p t))
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action)) ; list actions using C-z)

(use-package helm-gtags
  :ensure t
  :init
  (progn
    (setq-default helm-gtags-ignore-case t
                  helm-gtags-auto-update t
                  helm-gtags-use-input-at-cursor t
                  helm-gtags-pulse-at-cursor t
                  helm-gtags-prefix-key "\C-cg"
                  helm-gtags-suggested-key-mapping t)

    ;; Enable helm-gtags-mode in Dired so you can jump to any tag
    ;; when navigate project tree with Dired
    (add-hook 'dired-mode-hook 'helm-gtags-mode)

    ;; Enable helm-gtags-mode in Eshell for the same reason as above
    (add-hook 'eshell-mode-hook 'helm-gtags-mode)

    ;; Enable helm-gtags-mode in languages that GNU Global supports
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'c++-mode-hook 'helm-gtags-mode)
    (add-hook 'java-mode-hook 'helm-gtags-mode)
    (add-hook 'asm-mode-hook 'helm-gtags-mode)

    ;; key bindings
    (with-eval-after-load 'helm-gtags
      (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
      (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
      (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
      (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
      (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
      (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup)))

(use-package auto-complete
  :ensure t
  :init
  (ac-config-default))

(use-package tern
  :ensure t
  :init
  (add-hook 'js-mode-hook (lambda() (tern-mode t)))
  (progn
    (use-package tern-auto-complete
      :ensure t
      :init
      (tern-ac-setup))))

;;;; general configuration

;; show trailing whitespaces
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show column-number in the mode line
(column-number-mode 1)

;; don't show the tool bar
(tool-bar-mode -1)

;; don't show the scroll bar
(scroll-bar-mode -1)

(add-hook 'before-save-hook 'whitespace-cleanup)

;; enable windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; backup and autosave files to tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; OS X config
(when (eq system-type 'darwin)
  (set-face-attribute 'default nil :family "Consolas")
  (set-face-attribute 'default nil :height 140)

  (setq mac-command-modifier 'meta))

;;;; language configuration

;; cpython style
(setq c-default-style "python"
      c-basic-offset 4)

;; gdb
(setq gdb-many-windows t
      gdb-show-main t)

;; css
(setq css-indent-offset 2)

;;;; custom functions

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (tern-auto-complete tern scss-mode magit helm-projectile free-keys projectile ace-window helm-gtags flycheck web-mode json-mode js2-mode use-package solarized-theme helm cmake-mode)))
 '(projectile-globally-ignored-files (quote ("TAGS" "GTAGS" "GRTAGS" "GPATH")))
 '(safe-local-variable-values
   (quote
    ((projectile-project-compilation-cmd . "make -C build -j16")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
