;;; init-lang.el --- Language modes -*- lexical-binding: t; -*-

;; Rust, Go, Lua and TypeScript use the built-in tree-sitter modes (see
;; init-treesit.el). No language servers.

;; Modes in local/
(use-package simpc-mode
  :ensure nil
  :mode ("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(use-package c3-ts-mode
  :ensure nil
  :mode ("\\.c3[it]?\\'" . c3-ts-mode))

;; typst-mode requires it.
(use-package polymode
  :defer t)

(use-package typst-mode
  :ensure nil
  :mode ("\\.typ\\'" . typst-mode))

(use-package haskell-mode
  :hook ((haskell-mode . haskell-indent-mode)
         (haskell-mode . interactive-haskell-mode)
         (haskell-mode . haskell-doc-mode)))

(use-package ormolu
  :hook (haskell-mode . ormolu-format-on-save-mode))

(use-package proof-general
  :defer t)

;; Modes without a built-in tree-sitter variant
(use-package zig-mode :defer t)
(use-package nim-mode :defer t)
(use-package markdown-mode :defer t)
(use-package racket-mode :defer t)

(provide 'init-lang)

;;; init-lang.el ends here
