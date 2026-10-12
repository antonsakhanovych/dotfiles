;;; init-editing.el --- Editing defaults, text manipulation, parens -*- lexical-binding: t; -*-

(setq make-backup-files nil
      next-line-add-newlines t
      global-auto-revert-non-file-buffers t
      dired-dwim-target t
      tramp-auto-save-directory "/tmp")

(setq-default indent-tabs-mode nil
              tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)

(global-auto-revert-mode 1)
(save-place-mode 1)

(defun edit/duplicate-line ()
  "Duplicate the current line below it, keeping point in the same column."
  (interactive)
  (let ((column (- (point) (pos-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(defun edit/scroll-down-half-page ()
  "Scroll down half a page while keeping the cursor centered."
  (interactive)
  (let ((ln (line-number-at-pos (point)))
        (lmax (line-number-at-pos (point-max))))
    (cond ((= ln 1) (move-to-window-line nil))
          ((= ln lmax) (recenter (window-end)))
          (t (move-to-window-line -1)
             (recenter)))))

(defun edit/scroll-up-half-page ()
  "Scroll up half a page while keeping the cursor centered."
  (interactive)
  (let ((ln (line-number-at-pos (point)))
        (lmax (line-number-at-pos (point-max))))
    (cond ((= ln 1) nil)
          ((= ln lmax) (move-to-window-line nil))
          (t (move-to-window-line 0)
             (recenter)))))

(global-set-key (kbd "C-x C-b") #'ibuffer)
(global-set-key (kbd "C-,") #'edit/duplicate-line)
(global-set-key (kbd "C-v") #'edit/scroll-down-half-page)
(global-set-key (kbd "M-v") #'edit/scroll-up-half-page)

(defun edit/trim-whitespace-on-save ()
  "Delete trailing whitespace when saving the current buffer."
  (add-hook 'before-save-hook #'delete-trailing-whitespace nil t))
(add-hook 'prog-mode-hook #'edit/trim-whitespace-on-save)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-\""        . mc/skip-to-next-like-this)))

(use-package move-text
  :bind (("M-n" . move-text-down)
         ("M-p" . move-text-up)))

(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config)
  (sp-use-paredit-bindings))

(provide 'init-editing)

;;; init-editing.el ends here
