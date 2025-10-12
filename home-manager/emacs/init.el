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

(use-package faces
  :ensure nil
  :hook (after-init . setup-fonts)
  :config
  (defun setup-fonts ()
    "Setup fonts."
    (when (display-graphic-p)
      ;; Set default font
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
      (cl-loop for font in '("JetbrainsMono Nerd Font"
                             "Menlo"
			     "Hack"
                             "Monaco")
	       when (find-font (font-spec :name font))
               return (progn
                        (set-face-attribute 'mode-line nil :family font :height 140)
                        (when (facep 'mode-line-active)
                          (set-face-attribute 'mode-line-active nil :family font :height 140))
                        (set-face-attribute 'mode-line-inactive nil :family font :height 140)))
      (cl-loop for font in '("Apple Symbols"
			     "Segoe UI Symbol"
			     "Symbola"
			     "Symbol")
	       when (find-font (font-spec :name font))
               return (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend))
      (cl-loop for font in '("Noto Color Emoji" "Apple Color Emoji" "Segoe UI Emoji")
	       when (find-font (font-spec :name font))
               return (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend))
      (cl-loop for font in '("LXGW Neo Xihei"
			     "LXGW WenKai Mono"
			     "WenQuanYi Micro Hei Mono"
                             "PingFang SC"
			     "Microsoft Yahei UI"
			     "Simhei")
	       when (find-font (font-spec :name font))
               return (progn
                        (setq face-font-rescale-alist `((,font . 1.3)))
                        (set-fontset-font t 'han (font-spec :family font)))))))

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

(use-package display-fill-column-indicator
  :ensure nil
  :hook (prog-mode . display-fill-column-indicator-mode))

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

(use-package evil-nerd-commenter
  :after (evil)
  :bind
  (:map evil-normal-state-map
	("gcc" . evilnc-comment-or-uncomment-lines))
  (:map evil-visual-state-map
	("gc" . evilnc-comment-or-uncomment-lines)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init)
;;; init.el ends here
