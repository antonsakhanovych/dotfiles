;;; init-vcs.el --- Version control -*- lexical-binding: t; -*-

(use-package magit
  :bind (("C-c m s" . magit-status)
         ("C-c m l" . magit-log)))

(provide 'init-vcs)

;;; init-vcs.el ends here
