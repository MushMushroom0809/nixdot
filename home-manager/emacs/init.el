;;; init.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; BUILTIN PACKAGES
(use-package use-package
  :ensure nil
  :custom
  (use-package-always-ensure t)
  (use-package-always-defer t)
  (use-package-expand-minimally t)
  (use-package-enable-imenu-support t))

(use-package package
  :ensure nil
  :custom
  (package-enable-at-startup nil)
  :config
  (package-initialize)
  (setq package-quickstart t)
  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
			   ("elpa" . "https://elpa.gnu.org/packages/")
			   ("nongnu" . "https://elpa.nongnu.org/nongnu/"))))

(use-package emacs
  :ensure nil
  :config
  (setq gc-cons-percentage 0.6)
  (setq gc-cons-threshold most-positive-fixnum)
  (setq default-frame-alist '((menu-bar-lines . 0)
			      (tool-bar-lines . 0)
			      (horizontal-scroll-bars)
			      (vertical-scroll-bars))))

(use-package faces
  :ensure nil
  :hook (after-init . setup-fonts)
  :config
  (defun setup-fonts ()
    "Setup fonts."
    (when (display-graphic-p)
      (cl-loop for font in '("JetbrainsMono Nerd Font"
			     "Menlo"
			     "Hack"
			     "Monaco")
	       when (find-font (font-spec :name font))
	       return (set-face-attribute 'default nil
					  :family font
					  :height (cond ((eq system-type 'darwin) 140)
							((eq system-type 'windows-nt) 110)
							(t 100))))
      (cl-loop for font in '("JetbrainsMono Nerd Font" "Menlo" "Hack")
	       when (find-font (font-spec :name font))
               return (progn
                        (set-face-attribute 'mode-line nil :family font :height 140)
                        (when (facep 'mode-line-active)
                          (set-face-attribute 'mode-line-active nil :family font :height 140))
                        (set-face-attribute 'mode-line-inactive nil :family font :height 140)))
      (cl-loop for font in '("Apple Symbols" "Segoe UI Symbol")
	       when (find-font (font-spec :name font))
               return (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend))
      (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji" "Segoe UI Emoji")
	       when (find-font (font-spec :name font))
               return (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))
      (cl-loop for font in '("LXGW Neo Xihei" "LXGW WenKai Mono")
	       when (find-font (font-spec :name font))
               return (progn
                        (setq face-font-rescale-alist `((,font . 1.3)))
                        (set-fontset-font t 'han (font-spec :family font)))))))

(use-package cus-edit
  :ensure nil
  :custom
  (custom-file (concat user-emacs-directory "custom.el")))

(use-package which-key
  :ensure nil
  :hook (after-init . which-key-mode))

(use-package files
  :ensure nil
  :custom
  (auto-save-default nil)
  (make-backup-files nil))

(use-package startup
  :ensure nil
  :custom
  (inhibit-startup-message t)
  (initial-major-mode 'fundamental-mode))

(use-package simple
  :ensure nil
  :hook
  (prog-mode . line-number-mode)
  (prog-mode . column-number-mode)
  (prog-mode . size-indication-mode))

(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-local-mode))

(use-package hl-line
  :ensure nil
  :hook (prog-mode . hl-line-mode))

(use-package display-line-numbers
  :ensure nil
  :hook (prog-mode . display-line-numbers-mode))

(use-package ibuffer
  :ensure nil
  :bind
  (([remap list-buffers] . ibuffer)))

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :bind
  (("M-n" . flymake-goto-next-error)
   ("M-p" . flymake-goto-prev-error)))

;;; INSTALLED PACKAGES
(use-package evil
  :hook (after-init . evil-mode)
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil))

(use-package evil-escape
  :hook (evil-mode . evil-escape-mode)
  :config
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2))

(use-package evil-collection
  :defer 2
  :config
  (evil-collection-init))

(use-package evil-nerd-commenter
  :after (evil)
  :bind
  (:map evil-normal-state-map
	("gcc" . evilnc-comment-or-uncomment-lines))
  (:map evil-visual-state-map
	("gc" . evilnc-comment-or-uncomment-lines)))

(use-package evil-matchit
  :hook (evil-mode . global-evil-matchit-mode))

(use-package doom-themes)
(use-package zenburn-theme)
(use-package solarized-theme)
(use-package color-theme-sanityinc-tomorrow)
(use-package color-theme-sanityinc-solarized)
(use-package spacemacs-theme)
(use-package monokai-theme)
(use-package gruvbox-theme)
(use-package dracula-theme)
(use-package material-theme)
(use-package vscode-dark-plus-theme)
(use-package moe-theme)
(use-package catppuccin-theme
  :hook (after-init . (lambda () (load-theme 'catppuccin t)))
  :custom-face
  (default ((t (:background "#11111b"))))
  (line-number-current-line ((t (:foreground "#a6e3a1" :bold t)))))

(use-package doom-modeline
  :hook (prog-mode . doom-modeline-mode)
  :config
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-minor-modes t))

(use-package minions
  :hook (doom-modeline-mode . minions-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package colorful-mode
  :hook (prog-mode . colorful-mode))

(use-package indent-bars
  :hook ((prog-mode yaml-mode) . indent-bars-mode)
  :config
  (setq indent-bars-color '(highlight :face-bg t :blend 0.525))
  (setq indent-bars-no-descend-string t)
  (setq indent-bars-prefer-character t)
  (setq indent-bars-display-on-blank-lines nil))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package diredfl
  :hook (dired-mode . diredfl-global-mode))

(use-package page-break-lines
  :hook (after-init . global-page-break-lines-mode))

(use-package diff-hl
  :hook
  (after-init . global-diff-hl-mode)
  (dired-mode . diff-hl-dired-mode))

(use-package helpful
  :bind
  (([remap describe-function] . helpful-callable)
   ([remap describe-variable] . helpful-variable)
   ([remap describe-key] . helpful-key)
   ([remap describe-command] . helpful-command)
   ("C-h C-d" . helpful-at-point)))

(use-package xclip
  :hook (after-init . xclip-mode))

(use-package gcmh
  :hook (after-init . gcmh-mode))

(use-package hl-todo
  :hook ((prog-mode yaml-mode) . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        '(("TODO" warning bold)
          ("FIXME" error bold)
          ("REVIEW" font-lock-keyword-face bold)
          ("HACK" font-lock-constant-face bold)
          ("DEPRECATED" font-lock-doc-face bold)
          ("NOTE" success bold)
          ("BUG" error bold)
          ("XXX" font-lock-constant-face bold))))

(use-package corfu
  :hook
  (prog-mode . global-corfu-mode)
  (global-corfu-mode . corfu-popupinfo-mode)
  :config
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.24)
  (setq corfu-auto-prefix 1)
  (setq global-corfu-modes '((not erc-mode circe-mode help-mode vterm-mode) t))
  (setq corfu-cycle t)
  (setq corfu-count 12)
  (setq corfu-max-width 100)
  (setq corfu-popupinfo-delay '(0.4 . 0.2)))

(use-package nerd-icons-corfu
  :after (corfu)
  :init
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package cape
  :after (corfu)
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package yasnippet-capf
  :after (cape)
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))

(use-package yasnippet
  :hook (prog-mode . yas-global-mode))

(use-package yasnippet-snippets
  :after (yasnippet))

(use-package vertico
  :hook (after-init . vertico-mode)
  :config
  (setq vertico-count 12)
  :bind
  (:map vertico-map
	("RET" . vertico-directory-enter)
	("DEL" . vertico-directory-delete-char)
	("M-DEL" . vertico-directory-delete-word)))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion))))
  (orderless-component-separator #'orderless-escapable-split-on-space))

(use-package marginalia
  :hook (after-init . marginalia-mode))

(use-package nerd-icons-completion
  :after marginalia
  :hook
  (marginalia-mode . nerd-icons-completion-mode)
  (marginalia-mode . nerd-icons-completion-marginalia-setup))

(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :bind
  (([remap isearch-forward] . consult-line)
   ([remap Info-search] . consult-info)
   ([remap recentf-open-files] . consult-recent-file)
   ("C-c M-x" . consult-mode-command)
   ("C-c h" . consult-history)
   ("C-c k" . consult-kmacro)
   ("C-c i" . consult-info)
   ("C-c r" . consult-ripgrep)
   ("C-c T" . consult-theme)
   ("C-." . consult-imenu)
   ("C-c c e" . consult-colors-emacs)
   ("C-c c w" . consult-colors-web)
   ("C-c c f" . describe-face)
   ("C-c c l" . find-library)
   ("C-c c t" . consult-theme)
   ("M-g e" . consult-compile-error)
   ("M-g f" . consult-flymake)
   ("M-g g" . consult-goto-line)
   ("M-g M-g" . consult-goto-line)
   ("M-g o" . consult-outline)
   ("M-g m" . consult-mark)
   ("M-g k" . consult-global-mark)
   ("M-g i" . consult-imenu)
   ("M-g I" . consult-imenu-multi)
   ("M-s d" . consult-find)
   ("M-s D" . consult-locate)
   ("M-s g" . consult-grep)
   ("M-s G" . consult-git-grep)
   ("M-s r" . consult-ripgrep)
   ("M-s l" . consult-line)
   ("M-s L" . consult-line-multi)
   ("M-s k" . consult-keep-lines)
   ("M-s u" . consult-focus-lines)
   ("M-s e" . consult-isearch-history))
  (:map minibuffer-local-map
	("M-s" . consult-history)
	("M-r" . consult-history)))

(use-package lua-mode
  :config
  (setq-default lua-indent-level 2)
  (setq-default lua-indent-nested-block-content-align nil)
  (setq-default lua-indent-close-paren-align nil))

(use-package nix-mode)
(use-package typescript-mode)
(use-package ruby-mode)
(use-package rust-mode)
(use-package go-mode)
(use-package toml-mode)
(use-package yaml-mode)
(use-package csv-mode)

(provide 'init)
;;; init.el ends here
