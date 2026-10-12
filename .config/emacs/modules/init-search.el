;;; init-search.el --- ripgrep-backed grep, jump to definition -*- lexical-binding: t; -*-

;; Based on https://stegosaurusdormant.com/emacs-ripgrep/
(use-package grep
  :ensure nil
  :bind (("C-x C-g g" . grep)
         ("C-x C-g l" . lgrep)
         ("C-x C-g r" . rgrep)
         ("C-x C-g f" . grep-find))
  :config
  (grep-apply-setting
   'grep-command "rg --hidden --color=auto --null -nH --no-heading -e ")
  (grep-apply-setting
   'grep-template "rg --hidden --color=auto --null --no-heading -g '!*/' -e <R> <D>")
  (grep-apply-setting
   'grep-find-template "rg --hidden --color=auto --null -nH --no-heading -e <R> <D>")
  (grep-apply-setting
   'grep-find-command
   '("rg --hidden --glob '!.git' --color=auto -n -H --no-heading -e '' $(git rev-parse --show-toplevel || pwd)" . 64)))

(use-package dumb-jump
  :defer t
  :init (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(provide 'init-search)

;;; init-search.el ends here
