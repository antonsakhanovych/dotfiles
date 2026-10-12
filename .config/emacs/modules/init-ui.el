;;; init-ui.el --- Appearance, scrolling, line numbers -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(font . "Iosevka 15"))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t
      use-dialog-box nil
      confirm-kill-emacs 'y-or-n-p
      confirm-kill-processes nil)

(setq scroll-conservatively 101
      scroll-margin 20
      hscroll-margin 0)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(global-visual-line-mode 1)
(show-paren-mode 1)

;; Zoom like every other app.
(global-set-key (kbd "C-=") #'text-scale-increase)
(global-set-key (kbd "C--") #'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") #'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") #'text-scale-decrease)

(use-package gruvbox-theme
  :config (load-theme 'gruvbox t))

(use-package ligature
  :config
  (ligature-set-ligatures
   'prog-mode
   '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
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
  (global-ligature-mode t))

(provide 'init-ui)

;;; init-ui.el ends here
