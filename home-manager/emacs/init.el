;;; init.el --- -*- lexical-binding: t no-byte-compile: t -*-
;;; Commentary:
;;; Code:

;;; BUILTIN
(use-package use-package
  :ensure nil
  :custom
  (use-package-always-ensure t)
  (use-package-always-defer t)
  (use-package-expand-minimally t)
  (use-package-enable-imenu-support t))

(use-package emacs
  :ensure nil
  :custom
  (gc-cons-percentage 0.6)
  (gc-cons-threshold most-positive-fixnum)
  (frame-inhibit-implied-resize t)
  :config
  (setq-default tab-width 2))

(use-package package
  :ensure nil
  :custom
  (package-enable-at-startup nil)
  (package-quickstart t)
  :config
  (package-initialize)
  (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                           ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                           ("melpa" . "https://melpa.org/packages/")
                           ("melpa-stable" . "https://stable.melpa.org/packages/"))))

(use-package startup
  :ensure nil
  :custom
  (inhibit-startup-message t)
  (initial-major-mode 'fundamental-mode))

(use-package files
  :ensure nil
  :custom
  (auto-save-default nil)
  (make-backup-files nil))

(use-package cus-edit
  :ensure nil
  :custom (custom-file (concat (file-name-as-directory user-emacs-directory) "custom.el")))

(use-package simple
  :ensure nil
  :defer 5
  :config
  (line-number-mode)
  (column-number-mode)
  (size-indication-mode)
  (setq-default indent-tabs-mode nil))

(use-package faces
  :ensure nil
  :hook (after-init . setup-fonts)
  :config
  (defun setup-fonts ()
    (cl-loop for font in '("JetbrainsMono Nerd Font" "SF Mono" "Menlo" "Consolas")
             when (find-font (font-spec :name font)) 
             return (set-face-attribute 'default nil
                                        :family font
                                        :height (cond ((eq system-type 'darwin) 130)
                                                      ((eq system-type 'gnu/linux) 110)
                                                      (t 100))))
    (cl-loop for font in '("SF Mono" "Menlo" "SF Pro Display" "Helvetica")
             when (find-font (font-spec :name font)) 
             return (progn
                      (set-face-attribute 'mode-line nil :family font :height 120)
                      (when (facep 'mode-line-active)
                        (set-face-attribute 'mode-line-active nil :family font :height 120))
                      (set-face-attribute 'mode-line-inactive nil :family font :height 120)))
    (cl-loop for font in '("Apple Symbols" "Segoe UI Symbol" "Symbola" "Symbol")
             when (find-font (font-spec :name font)) 
             return (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend))
    (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji" "Segoe UI Emoji")
             when (find-font (font-spec :name font)) 
             return (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))
    (cl-loop for font in '("LXGW WenKai Mono" "PingFang SC" "Microsoft Yahei UI")
             when (find-font (font-spec :name font)) 
             return (progn
                      (setq face-font-rescale-alist `((,font . 1.3)))
                      (set-fontset-font t 'han (font-spec :family font))))))

(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-mode))

(use-package paren
  :ensure nil
  :hook (prog-mode . show-paren-mode))

(use-package display-line-numbers
  :ensure nil
  :hook (prog-mode . display-line-numbers-mode))

(use-package hl-line
  :ensure nil
  :hook (prog-mode . hl-line-mode))

(use-package which-key
  :ensure nil
  :defer 5
  :config
  (which-key-mode))

(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode)
  :bind (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error)))

;;; ELPA/MELPA
(use-package evil
  :hook (after-init . evil-mode))

(use-package evil-escape
  :hook (evil-mode . evil-escape-mode)
  :config
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init)
;;; init.el ends here
