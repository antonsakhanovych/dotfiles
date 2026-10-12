;;; init.el --- Emacs configuration entry point -*- lexical-binding: t; -*-

;; init.el is symlinked into ~/.config/emacs, but modules/ and local/ are not
;; all linked, so look them up next to the real file.
(defconst my/config-dir
  (file-name-directory (file-truename (or load-file-name user-init-file)))
  "Directory holding the real copy of this configuration.")

(add-to-list 'load-path (expand-file-name "modules" my/config-dir))
(add-to-list 'load-path (expand-file-name "local" my/config-dir))

(require 'init-package)
(require 'init-ui)
(require 'init-editing)
(require 'init-completion)
(require 'init-search)
(require 'init-vcs)
(require 'init-compile)
(require 'init-treesit)
(require 'init-lang)
(require 'init-org)
(require 'init-writing)

;;; init.el ends here
