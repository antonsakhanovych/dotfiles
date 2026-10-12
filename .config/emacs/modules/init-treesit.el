;;; init-treesit.el --- Built-in tree-sitter -*- lexical-binding: t; -*-

;; Prefer the built-in *-ts-modes over the classic ones. Emacs asks to install
;; a missing grammar the first time a file needs it.
(use-package treesit
  :ensure nil
  :init
  (setopt treesit-enabled-modes t
          treesit-font-lock-level 4)
  :config
  ;; Emacs has no source for this grammar; install it with
  ;; M-x treesit-install-language-grammar.
  (add-to-list 'treesit-language-source-alist
               '(c3 "https://github.com/c3lang/tree-sitter-c3")))

(provide 'init-treesit)

;;; init-treesit.el ends here
