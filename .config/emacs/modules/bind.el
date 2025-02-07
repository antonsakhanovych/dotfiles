(global-set-key (kbd "C-x C-b") 'ibuffer)
;; zoom in/out like we do everywhere else.
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(defun bind/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'bind/duplicate-line)

;;; multiple cursors
(rc/require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

(rc/require 'move-text)
(global-set-key (kbd "M-n") 'move-text-down)
(global-set-key (kbd "M-p") 'move-text-up)

(rc/require 'dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; grep command stolen from here:
;; https://stegosaurusdormant.com/emacs-ripgrep/
(require 'grep)

;; grep
(grep-apply-setting
 'grep-command "rg --color=auto --null -nH --no-heading -e ")
;; lgrep
(grep-apply-setting
 'grep-template "rg --color=auto --null --no-heading -g '!*/' -e <R> <D>")
;; rgrep
(grep-apply-setting
 'grep-find-template "rg --color=auto --null -nH --no-heading -e <R> <D>")

;; grep-find
(grep-apply-setting
 'grep-find-command
 '("rg --color=auto -n -H --no-heading -e '' $(git rev-parse --show-toplevel || pwd)" . 40))


(global-set-key (kbd "C-x C-g g") 'grep)
(global-set-key (kbd "C-x C-g l") 'lgrep)
(global-set-key (kbd "C-x C-g r") 'rgrep)
(global-set-key (kbd "C-x C-g f") 'grep-find)

(rc/require 'olivetti)
(require 'olivetti)

(defun distraction-free ()
    "Distraction-free writing environment using Olivetti package."
    (interactive)
    (if (equal olivetti-mode nil)
        (progn
          (window-configuration-to-register 1)
          (delete-other-windows)
          (text-scale-set 2)
          (olivetti-mode t))
      (progn
        (if (eq (length (window-list)) 1)
            (jump-to-register 1))
        (olivetti-mode 0)
        (text-scale-set 0))))

(global-set-key (kbd "<f9>") #'distraction-free)
