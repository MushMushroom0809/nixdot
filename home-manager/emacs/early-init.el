;;; early-init.el --- -*- lexical-binding: t; coding: utf-8; -*-
;;; Commentary:
;;; Code:

(when (or (featurep 'esup-child) (fboundp 'profile-dotemacs) (daemonp) (boundp 'startup-now) noninteractive)
  (setq package-enable-at-startup nil))
(set-language-environment "UTF-8")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold most-positive-fixnum)
(setq initial-major-mode 'fundamental-mode)
(setq inhibit-startup-screen t)
(setq inhibit-startup-message t)
(setq inhibit-default-init t)
(setq default-frame-alist '((menu-bar-lines . 0) (tool-bar-lines . 0) (horizontal-scroll-bars) (vertical-scroll-bars)))

(provide 'early-init)
;;; early-init.el ends here
