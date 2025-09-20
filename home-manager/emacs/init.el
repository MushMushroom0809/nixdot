;;; init.el --- -*- lexical-binding: t; coding: utf-8; -*-
;;; Commentary:
;;; Code:

;;; BUILT-IN
(use-package use-package
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
  (setq-default gc-cons-threshold most-positive-fixnum)
  (setq-default gc-cons-percentage 0.6)
  (setq-default use-short-answers t)
  (setq-default default-frame-alist
		'((menu-bar-lines . 0)
		  (tool-bar-lines . 0)
		  (vertical-scroll-bars)))
  (setq-default display-line-numbers 'relative))

(use-package ns-win
  :ensure nil
  :config
  (setq mac-option-modifier 'meta))

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
					       ((eq system-type 'darwin) 120)
					       ((eq system-type 'windows-nt) 90)
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
  (c-mode . line-number-mode)
  (c++-mode . line-number-mode)
  (python-mode . line-number-mode)
  (json-mode . line-number-mode)
  (yaml-mode . line-number-mode)
  (toml-mode . line-number-mode)
  (nix-mode . line-number-mode)
  (markdown-mode . line-number-mode)
  (lua-mode . line-number-mode)
  (emacs-lisp-mode . line-number-mode)
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

(use-package treesit
  :ensure nil
  :config
  (setq treesit-language-source-alist
	'((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
	  (c . ("https://github.com/tree-sitter/tree-sitter-c"))
	  (cmake . ("https://github.com/uyha/tree-sitter-cmake"))
	  (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
	  (csharp . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
	  (css . ("https://github.com/tree-sitter/tree-sitter-css"))
	  (clojure . ("https://github.com/sogaiu/tree-sitter-clojure"))
	  (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
	  (elisp . ("https://github.com/Wilfred/tree-sitter-elisp"))
	  (elixir "https://github.com/elixir-lang/tree-sitter-elixir" "main" "src" nil nil)
	  (go . ("https://github.com/tree-sitter/tree-sitter-go"))
	  (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
	  (haskell "https://github.com/tree-sitter/tree-sitter-haskell" "master" "src" nil nil)
	  (html . ("https://github.com/tree-sitter/tree-sitter-html"))
	  (java . ("https://github.com/tree-sitter/tree-sitter-java.git"))
	  (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
	  (json . ("https://github.com/tree-sitter/tree-sitter-json"))
	  (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
	  (make . ("https://github.com/alemuller/tree-sitter-make"))
	  (markdown . ("https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src"))
	  (markdown-inline . ("https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/src"))
	  (mojo . ("https://github.com/HerringtonDarkholme/tree-sitter-mojo"))
	  (nix . ("https://github.com/nix-community/nix-ts-mode"))
	  (ocaml . ("https://github.com/tree-sitter/tree-sitter-ocaml" nil "ocaml/src"))
	  (org . ("https://github.com/milisims/tree-sitter-org"))
	  (python . ("https://github.com/tree-sitter/tree-sitter-python"))
	  (php . ("https://github.com/tree-sitter/tree-sitter-php"))
	  (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
	  (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
	  (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
	  (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
	  (sql . ("https://github.com/m-novikov/tree-sitter-sql"))
	  (scala "https://github.com/tree-sitter/tree-sitter-scala" "master" "src" nil nil)
	  (toml "https://github.com/tree-sitter/tree-sitter-toml" "master" "src" nil nil)
	  (vue . ("https://github.com/merico-dev/tree-sitter-vue"))
	  (kotlin . ("https://github.com/fwcd/tree-sitter-kotlin"))
	  (yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))
	  (zig . ("https://github.com/GrayJack/tree-sitter-zig")))))

;;; VIM-LIKE
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :hook
  (after-init . evil-mode))

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

(use-package evil-goggles
  :hook
  (evil-mode . evil-goggles-mode)
  :config
  (setq evil-goggles-pulse t)
  (setq evil-goggles-blocking-duration 1.500)
  (setq evil-goggles-async-duration 0.900)
  (setq evil-goggles-duration 1.500)
  (evil-goggles-use-diff-faces))

(use-package evil-args
  :bind
  (:map evil-inner-text-objects-map
	("a" . evil-inner-arg))
  (:map evil-outer-text-objects-map
	("a" . evil-outer-arg))
  (:map evil-normal-state-map
	("H" . evil-backward-arg)
	("L" . evil-forward-arg))
  (:map evil-motion-state-map
	("H" . evil-backward-arg)
	("L" . evil-forward-arg)))

(use-package evil-indent-plus
  :bind
  (:map evil-inner-text-objects-map
	("i" . evil-indent-plus-i-indent)
	("i" . evil-indent-plus-a-indent)
	("I" . evil-indent-plus-i-indent-up)
	("I" . evil-indent-plus-a-indent-up)
	("J" . evil-indent-plus-i-indent-up-down)
	("J" . evil-indent-plus-a-indent-up-down)))

;;; UI
(use-package doom-themes
  :hook
  (after-init . (lambda () (load-theme 'doom-palenight t))))

(use-package doom-modeline
  :hook
  (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 5)
  (setq doom-modeline-minor-modes t))

(use-package minions
  :hook
  (doom-modeline-mode . minions-mode))

(use-package solaire-mode
  :hook
  (doom-modeline-mode . solaire-global-mode))

(use-package hide-mode-line
  :hook
  (eshell-mode . hide-mode-line-mode)
  (dired-sidebar-mode . hide-mode-line-mode)
  (eat-mode . hide-mode-line-mode))

(use-package centaur-tabs
  :bind
  (:map evil-normal-state-map
        ("g t" . centaur-tabs-forward)
        ("g T" . centaur-tabs-backward))
  :defer 2
  :config
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-height 25)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-icon-type 'nerd-icons)
  (setq centaur-tabs-set-bar 'left)
  (centaur-tabs-mode))

(use-package colorful-mode
  :hook
  (prog-mode . colorful-mode))

(use-package indent-bars
  :hook ((prog-mode yaml-mode) . indent-bars-mode)
  :config
  (setq indent-bars-color '(highlight :face-bg t :blend 0.425))
  (setq indent-bars-no-descend-string t)
  (setq indent-bars-display-on-blank-lines nil)
  (setq indent-bars-prefer-character t))

(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

(use-package nerd-icons-ibuffer
  :hook
  (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package nerd-icons-dired
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package beacon
  :hook
  (after-init . beacon-mode))

(use-package auto-highlight-symbol
  :hook
  (prog-mode . global-auto-highlight-symbol-mode))

(use-package highlight-numbers
  :hook
  (prog-mode . highlight-numbers-mode))

(use-package highlight-defined
  :hook
  (emacs-lisp-mode . highlight-defined-mode))

(use-package winum
  :hook
  (doom-modeline-mode . winum-mode))

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

(use-package nerd-icons-ivy-rich
  :hook
  (ivy-mode . nerd-icons-ivy-rich-mode))

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

(use-package vundo
  :commands (vundo))

(use-package avy
  :bind
  (("M-g l" . avy-goto-line)
   ("M-g c" . avy-goto-char-timer)
   ("M-g w" . avy-goto-word-0)))

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

(use-package symbol-overlay
  :bind
  (("M-i" . symbol-overlay-put)
   ("M-g n" . symbol-overlay-jump-next)
   ("M-g p" . symbol-overlay-jump-prev)
   ("M-g r" . symbol-overlay-remove-all))
  :hook
  (prog-mode . symbol-overlay-mode))

(use-package ace-window
  :bind
  ([remap other-window] . ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(use-package eat
  :commands (eat)
  :custom
  (eat-term-name "xterm-256color"))

(use-package quickrun
  :commands (quickrun)
  :config
  (setq quickrun-focus-p nil)
  (setq quickrun-truncate-lines nil))

(use-package scratch
  :commands (scratch))

(use-package dired-sidebar
  :commands (dired-sidebar-toggle-sidebar))

(use-package magit
  :commands (magit))

(use-package minimap
  :commands (minimap-mode)
  :config
  (setq minimap-window-location 'right)
  (setq minimap-update-delay 0.2)
  (setq minimap-width-fraction 0.09)
  (setq minimap-minimum-width 12))

(use-package find-file-in-project
  :commands (ffip))

(use-package aggressive-indent
  :hook
  (prog-mode . aggressive-indent-mode))

;;; LANGUAGE
(use-package pyvenv
  :hook
  (python-mode . pyvenv-mode))

(use-package lua-mode
  :config
  (setq-default lua-indent-level 2)
  (setq-default lua-indent-nested-block-content-align nil)
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

;;; FORMATTER
(use-package apheleia
  :hook
  (prog-mode . apheleia-global-mode))

(provide 'init)
;;; init.el ends here
