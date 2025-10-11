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
  (setq package-archives
	'(("melpa" . "https://melpa.org/packages/")
          ("elpa" . "https://elpa.gnu.org/packages/")
          ("nongnu" . "https://elpa.nongnu.org/nongnu/"))))

(use-package emacs
  :ensure nil
  :config
  (setq gc-cons-percentage 0.6)
  (setq gc-cons-threshold most-positive-fixnum)
  (setq default-frame-alist
	'((menu-bar-lines . 0)
          (tool-bar-lines . 0)
          (horizontal-scroll-bars)
          (vertical-scroll-bars))))

(use-package cus-edit
  :ensure nil
  :custom
  (custom-file (concat user-emacs-directory "custom.el")))

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

(use-package elec-pair
  :ensure nil
  :hook (prog-mode . electric-pair-local-mode))

(use-package hl-line
  :ensure nil
  :hook (prog-mode . hl-line-mode))

(use-package display-line-numbers
  :ensure nil
  :hook (prog-mode . display-line-numbers-mode))

(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode)
  :bind
  (("M-n" . flymake-goto-next-error)
   ("M-p" . flymake-goto-prev-error)))

;;; INSTALLED PACKAGES
(use-package evil
  :hook (after-init . evil-mode))

(use-package evil-escape
  :hook (evil-mode . evil-escape-mode)
  :config
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.2))

(provide 'init)
;;; init.el ends here
