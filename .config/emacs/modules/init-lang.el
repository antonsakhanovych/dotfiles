;;; init-lang.el --- Language modes -*- lexical-binding: t; -*-

;; Everything else (Rust, Go, Lua, TypeScript, Markdown, ...) uses the built-in
;; tree-sitter modes, see init-treesit.el. No language servers.

;; Modes in local/
(use-package simpc-mode
  :ensure nil
  :mode ("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(use-package c3-ts-mode
  :ensure nil
  :mode ("\\.c3[it]?\\'" . c3-ts-mode))

;; The built-in markdown-ts-mode needs a markdown-inline grammar and is not
;; associated with .md files by default.
(use-package markdown-mode
  :defer t)

(use-package racket-mode
  :defer t)

(use-package zig-mode
  :defer t)

(provide 'init-lang)

;;; init-lang.el ends here
