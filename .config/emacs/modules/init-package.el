;;; init-package.el --- Package archives, use-package, environment -*- lexical-binding: t; -*-

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Keep Customize output out of this config.
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Refresh only when there is no cached index (fresh install).
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t
      use-package-expand-minimally t)

;; Take PATH from the login shell so rg, git and compilers are found.
(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

(provide 'init-package)

;;; init-package.el ends here
