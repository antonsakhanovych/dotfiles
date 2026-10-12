;;; init-writing.el --- Spelling, RFCs -*- lexical-binding: t; -*-

(setq ispell-dictionary "english")

(use-package rfc-mode
  :defer t
  :init (setq rfc-mode-directory (expand-file-name "~/rfc/")))

(provide 'init-writing)

;;; init-writing.el ends here
