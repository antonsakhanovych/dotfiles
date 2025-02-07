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

;; (require 'simpc-mode)
;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

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
 'hindent)

;; c3
(setq treesit-language-source-alist
  '((c3 "https://github.com/c3lang/tree-sitter-c3")))
(add-to-list 'treesit-language-source-alist
  '(c3 "https://github.com/c3lang/tree-sitter-c3"))
(treesit-install-language-grammar 'c3)
(require 'c3-ts-mode)

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

;; Python

(rc/require 'elpy)
(elpy-enable)


;; Coq
(rc/require 'proof-general)
