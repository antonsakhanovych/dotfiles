;;; init-completion.el --- Minibuffer, in-buffer completion, snippets -*- lexical-binding: t; -*-

(setq enable-recursive-minibuffers t)

(use-package ivy
  :demand t
  :init (setq ivy-use-virtual-buffers t)
  :config (ivy-mode 1)
  :bind ("C-c C-r" . ivy-resume))

(use-package swiper
  :bind (("C-s" . swiper)
         ("C-r" . swiper-backward)))

(use-package counsel
  :bind (("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file)))

(use-package company
  :init (setq company-tooltip-align-annotations t)
  :hook (after-init . global-company-mode))

(use-package yasnippet
  :init
  (setq yas-snippet-dirs (list (expand-file-name "snippets" my/config-dir))
        yas-triggers-in-field nil)
  :config (yas-global-mode 1))

(provide 'init-completion)

;;; init-completion.el ends here
