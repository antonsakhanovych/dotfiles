;; Compilation keybindings
(require 'compile)
(global-set-key (kbd "C-c c") #'compile)
(global-set-key (kbd "C-c r") #'recompile)
(setq-default compile-command "")

;; Magit
(rc/require 'magit)
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)

;; Auto Completion
(rc/require 'company)
(require 'company)
(global-company-mode 1)

;; Compilation buffer color
(require 'ansi-color)

(defun prog/colorize-compilation-buffer ()
  (ansi-color-apply-on-region compilation-filter-start (point)))
(add-hook 'compilation-filter-hook 'prog/colorize-compilation-buffer)


(rc/require 'smartparens)
(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)
(add-hook 'prog-mode-hook #'sp-use-paredit-bindings)

(rc/require 'tree-sitter)
(rc/require 'tree-sitter-langs)
(global-tree-sitter-mode)
;; (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(rc/require 'yasnippet)
(require 'yasnippet)
(setq yas/triggers-in-field nil)
(setq yas-snippet-dirs '("~/.config/emacs/snippets"))
(yas-global-mode 1)

;; Ligatures
(rc/require 'ligature)

(ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                     ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                     "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                     "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                     "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                     "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                     "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                     "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                     ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                     "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                     "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                     "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                     "\\\\" "://"))
(global-ligature-mode t)

;;(setenv "PATH" (concat (getenv "PATH") ":" (getenv "HOME") "/.local/share/mise/shims"))
;;(setq exec-path (append exec-path (list (concat (getenv "HOME") ":" "/.local/share/mise/shims"))))
(require 'mise)
(add-hook 'after-init-hook #'global-mise-mode)

(rc/require 'polymode)
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
(require 'typst-mode)


(rc/require 'sly)
(setq inferior-lisp-program "ros -Q run")

(rc/require
 'rust-mode
 'typescript-mode
 'go-mode
 'lua-mode
 'nim-mode
 'markdown-mode
 'haskell-mode
 'hindent
 'ormolu
 'zig-mode)


;; c3
;; (setq treesit-language-source-alist
;;   '((c3 "https://github.com/c3lang/tree-sitter-c3")))
;; (add-to-list 'treesit-language-source-alist
;;   '(c3 "https://github.com/c3lang/tree-sitter-c3"))
;; (treesit-install-language-grammar 'c3)
;; (require 'c3-ts-mode)

(defun prog/set-up-whitespace-handling ()
  (interactive)
;;  (whitespace-mode 1)
  (add-to-list 'write-file-functions #'delete-trailing-whitespace))

(add-hook 'prog-mode-hook #'prog/set-up-whitespace-handling)

;; Haskell
(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-doc-mode)
(add-hook 'haskell-mode-hook 'hindent-mode)

(push "~/.elib/contrib/reformatter.el" load-path)
(push "~/.elib/contrib/ormolu.el" load-path)
(load-library "ormolu")
(add-hook 'haskell-mode-hook 'ormolu-format-on-save-mode)

;; Python

;; (rc/require 'elpy)
;; (elpy-enable)


;; Coq
(rc/require 'proof-general)

;; Typescript
(rc/require 'tide)
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

;; if you use typescript-mode
(add-hook 'typescript-mode-hook #'setup-tide-mode)
;; if you use treesitter based typescript-ts-mode (emacs 29+)
(add-hook 'typescript-ts-mode-hook #'setup-tide-mode)
