;;; init.el --- -*- lexical-binding: t; coding: utf-8; -*-
;;; Commentary:
;;; Code:

;;; BUILTIN
(use-package use-package
  :custom
  (use-package-always-ensure t)
  (use-package-always-defer t)
  (use-package-expand-minimally t)
  (use-package-enable-imenu-support t))

(use-package package
  :ensure nil
  :config
  (when (or (featurep 'esup-child)
            (daemonp)
            noninteractive)
    (package-initialize))
  (setq package-check-signature nil)
  (setq package-quickstart t)
  (setq package-archives
	'(("melpa" . "https://melpa.org/packages/")
	  ;; ("elpa-devel" . "https://elpa.gnu.org/devel/")
	  ;; ("org" . "https://orgmode.org/elpa/")
	  ;; ("marmalade" . "http://marmalade-repo.jrg/packages/")
	  ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
	  ;; ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/")
	  ("gnu" . "https://elpa.gnu.org/packages/")
	  ("nongnu" . "https://elpa.nongnu.org/nongnu/"))))

(use-package emacs
  :ensure nil
  :config
  (setq-default outline-margin-width 1)
  (setq-default use-short-answers t)
  (setq-default display-line-numbers 'relative))

(use-package startup
  :ensure nil
  :hook
  (emacs-startup . (lambda ()
		     (cl-loop for font in '("JetbrainsMono Nerd Font"
					    "Menlo"
					    "Hack"
					    "Monaco"
					    "Consolas")
			      when (find-font (font-spec :name font))
			      return (set-face-attribute
				      'default nil
				      :family font
				      :height (cond
					       ((eq system-type 'darwin) 130)
					       ((eq system-type 'windows-nt) 100)
					       (t 100))))))
  :custom
  (initial-major-mode 'fundamental-mode)
  (inhibit-startup-screen t)
  (inhibit-startup-message t)
  (inhibit-default-init t))

(use-package cus-edit
  :ensure nil
  :custom
  (custom-file (locate-user-emacs-file "custom.el")))

(use-package which-key
  :ensure nil
  :defer 2
  :config
  (which-key-mode))

(use-package autorevert
  :ensure nil
  :hook
  (after-init . global-auto-revert-mode))

(use-package repeat
  :ensure nil
  :hook
  (after-init . repeat-mode))

(use-package display-fill-column-indicator
  :ensure nil
  :hook
  (prog-mode . global-display-fill-column-indicator-mode))

(use-package paren
  :ensure nil
  :hook
  (prog-mode . show-paren-mode))

(use-package simple
  :ensure nil
  :hook
  (prog-mode . line-number-mode)
  (prog-mode . column-number-mode))

(use-package loaddefs
  :ensure nil
  :hook
  (after-init . save-place-mode)
  (prog-mode . electric-pair-mode))

(use-package ibuffer
  :ensure nil
  :bind
  (("C-x C-b" . ibuffer)))

(use-package dired
  :ensure nil
  :config
  (setq dired-dwim-target t)
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)
  (setq dired-listing-switches "-alh --group-directories-first"))

;;; EVIL
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :hook
  (after-init . evil-mode)
  :config
  (setq evil-shift-width 2)
  (evil-ex-define-cmd "wq" '(lambda () (interactive) (save-buffer) (kill-current-buffer)))
  (evil-ex-define-cmd "q" '(lambda () (interactive) (kill-current-buffer))))

(use-package evil-escape
  :hook
  (evil-mode . evil-escape-mode)
  :config
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2))

(use-package evil-collection
  :defer 2
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
  :after evil
  :bind
  (:map evil-normal-state-map
	("gcc" . evilnc-comment-or-uncomment-lines))
  (:map evil-visual-state-map
	("gc" . evilnc-comment-or-uncomment-lines)))

(use-package evil-matchit
  :hook
  (evil-mode . global-evil-matchit-mode))

(use-package evil-visualstar
  :hook
  (evil-mode . global-evil-visualstar-mode))

(use-package evil-snipe
  :hook
  (evil-mode . evil-snipe-mode)
  (evil-mode . evil-snipe-override-mode)
  :config
  (setq evil-snipe-scope  'whole-buffer))

;;; UI
(use-package colorful-mode
  :hook
  (prog-mode . colorful-mode))

(use-package indent-bars
  :hook ((prog-mode yaml-mode) . indent-bars-mode)
  :config
  (setq indent-bars-color '(highlight :face-bg t :blend 0.5))
  (setq indent-bars-no-descend-string t)
  (setq indent-bars-display-on-blank-lines nil)
  (setq indent-bars-prefer-character t))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;;; COMPLETION
(use-package ivy
  :hook
  (after-init . ivy-mode)
  :config
  (setq ivy-use-virutal-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 13)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "[%d/%d] ")
  (setq ivy-re-builders-alist `((t . ivy--regex-ignore-order))))

(use-package counsel
  :hook
  (ivy-mode . counsel-mode))

(use-package swiper
  :bind
  (("C-s" . swiper-isearch)))

(use-package ivy-rich
  :hook
  (ivy-mode . ivy-rich-mode))

(use-package wgrep
  :bind
  (:map grep-mode-map
	("C-c C-q" . wgrep-change-to-wgrep-mode))
  :commands
  (wgrep wgrep-change-to-wgrep-mode)
  :config
  (setq wgrep-auto-save-buffer t))

(use-package amx
  :hook
  (ivy-mode . amx-mode))

(use-package company
  :hook
  (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-annotation-padding 1)
  (setq company-tooltip-limit 10)
  (setq company-tooltip-maximum-width 80)
  (setq company-tooltip-margin 1)
  (setq company-format-margin-function 'company-text-icons-margin)
  (setq company-text-icons-add-background t)
  (setq company-backends
	'((company-capf :with company-yasnippet)
	  (company-dabbrev-code :with company-yasnippet)
	  (company-files :with company-yasnippet)
	  (company-keywords :with company-yasnippet)
	  (company-dabbrev :with company-yasnippet))))

(use-package company-box
  :hook (company-mode . company-box-mode)
  :init
  (setq company-box-backends-colors nil)
  (setq company-box-frame-behavior 'point)
  (setq company-box-scrollbar 'right)
  (setq company-box-doc-delay 0.3)
  (setq company-box-doc-text-scale-level -2))

(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :after yasnippet)

;;; SYNTAX CHECKER
(use-package flycheck
  :bind
  (("M-n" . flycheck-next-error)
   ("M-p" . flycheck-previous-error))
  :hook
  (prog-mode . global-flycheck-mode)
  :config
  (setq flycheck-buffer-switch-check-intermediate-buffers t)
  (setq flycheck-display-errors-delay 0.25)
  (setq flycheck-idle-change-delay 1.0))

;;; TOOL
(use-package exec-path-from-shell
  :when (memq window-system '(mac ns x))
  :defer 5
  :config
  (exec-path-from-shell-initialize))

(use-package xclip
  :hook
  (after-init . xclip-mode))

(use-package helpful
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h x" . helpful-command)
   ("C-h C-d" . helpful-at-point)))

(use-package diredfl
  :hook
  (dired-mode . diredfl-mode))

(use-package hl-todo
  :hook ((prog-mode yaml-mode) . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":")
  (setq hl-todo-keyword-faces
	'(("TODO" warning bold)
	  ("FIXME" error bold)
	  ("REVIEW" font-lock-keyword-face bold)
	  ("HACK" font-lock-constant-face bold)
	  ("DEPRECATED" font-lock-doc-face bold)
	  ("NOTE" success bold)
	  ("BUG" error bold)
	  ("XXX" font-lock-constant-face bold))))

(use-package diff-hl
  :hook
  (after-init . global-diff-hl-mode)
  (dired-mode . diff-hl-dired-mode)
  (after-init . global-diff-hl-show-hunk-mouse-mode))

(use-package ace-window
  :bind
  ([remap other-window] . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;;; LANGUAGE
(use-package pyvenv
  :hook
  (python-mode . pyvenv-mode))

(use-package lua-mode
  :config
  (setq-default lua-indent-level 2)
  (setq-default lua-indent-nested-block-content-align nil)
  (setq lua-indent-string-contents t)
  (setq-default lua-indent-close-paren-align nil))

(use-package csv-mode)
(use-package yaml-mode)
(use-package json-mode)
(use-package toml-mode)
(use-package markdown-mode)
(use-package nix-mode)

;;; LSP & DAP
(use-package lsp-mode
  :commands (lsp))

(use-package dap-mode
  :commands (dap-mode))

(provide 'init)
;;; init.el ends here
