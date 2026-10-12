;;; init-writing.el --- Prose: distraction-free mode, spelling, RFCs -*- lexical-binding: t; -*-

(setq ispell-dictionary "english")

(use-package olivetti
  :defer t)

(defun distraction-free ()
  "Toggle a distraction-free writing environment using Olivetti."
  (interactive)
  (require 'olivetti)
  (if (not olivetti-mode)
      (progn
        (window-configuration-to-register 1)
        (delete-other-windows)
        (text-scale-set 2)
        (olivetti-mode 1))
    (when (= (length (window-list)) 1)
      (jump-to-register 1))
    (olivetti-mode 0)
    (text-scale-set 0)))

(global-set-key (kbd "<f9>") #'distraction-free)

(use-package rfc-mode
  :defer t
  :init (setq rfc-mode-directory (expand-file-name "~/rfc/")))

(provide 'init-writing)

;;; init-writing.el ends here
