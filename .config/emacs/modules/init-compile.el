;;; init-compile.el --- Compilation buffers -*- lexical-binding: t; -*-

(use-package compile
  :ensure nil
  :init
  (setq compilation-scroll-output t)
  (setq-default compile-command "")
  :bind (("C-c c" . compile)
         ("C-c r" . recompile))
  :hook (compilation-filter . ansi-color-compilation-filter))

(provide 'init-compile)

;;; init-compile.el ends here
