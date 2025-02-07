(add-to-list 'default-frame-alist '(font . "Iosevka 15"))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq indent-tabs-mode nil)
(setq compilation-scroll-output t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(setq scroll-conservatively 101)
(setq scroll-margin 20)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq use-dialog-box nil)
(save-place-mode 1)
(setq next-line-add-newlines t)
(setq confirm-kill-processes nil)
(setq hscroll-margin 0)
(setq dired-dwim-target t)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-visual-line-mode t)
(setq confirm-kill-emacs 'y-or-n-p)


;; modes
(show-paren-mode 1)


;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(rc/require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
