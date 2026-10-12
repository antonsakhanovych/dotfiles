;;; init-org.el --- Org mode: agenda, capture, babel -*- lexical-binding: t; -*-

(defun org/file (name)
  "Return the absolute path of NAME inside `org-directory'."
  (expand-file-name name org-directory))

(use-package org
  :ensure nil
  :hook (org-mode . org-indent-mode)
  :bind (("C-c a c" . org-capture)
         ("C-c a a" . org-agenda)
         ("C-c a r" . org-refile))
  :init
  (setq calendar-week-start-day 1
        org-directory "~/Org")
  :config
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)

  (setq org-agenda-files (mapcar #'org/file '("Inbox.org" "Tasks.org"
                                              "Meets.org" "Birthdays.org")))

  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "WORK(r)"
           "MEET(m)"
           "PAY(y)"
           "ALMA(a)"
           "PROJ(p)"           ; contains other tasks
           "SELF(s)"
           "WAIT(w)"
           "BIRTHDAY(b)"
           "|"
           "DONE(d)"
           "CANCELLED(c)")))

  ;; A form, not a function; org evals it for each agenda entry.
  (setq org-agenda-skip-function
        '(org-agenda-skip-entry-if 'todo '("BIRTHDAY")))

  (setq org-agenda-custom-commands
        '(("v" "A better agenda view"
           ((tags "PRIORITY=\"A\""
                  ((org-agenda-overriding-header "High-priority unfinished tasks:")))
            (tags "PRIORITY=\"B\""
                  ((org-agenda-overriding-header "Medium-priority unfinished tasks:")))
            (tags "PRIORITY=\"C\""
                  ((org-agenda-overriding-header "Low-priority unfinished tasks:")))
            (tags "customtag"
                  ((org-agenda-overriding-header "Tasks marked with customtag:")))
            (agenda "")))
          ("n" "Next Week's Agenda"
           ((agenda ""
                    ((org-agenda-span 7)
                     (org-agenda-start-day "+1mon")))
            (todo "")))))

  (setq org-priority-faces
        '((?A :foreground "#fe8019" :weight bold)
          (?B :foreground "#ecc100" :weight bold)
          (?C :foreground "#8ec07c" :weight bold))
        org-agenda-block-separator 8411)

  (setq org-capture-templates
        `(("t" "Templates for tasks")
          ("ti" "Tasks" entry (file ,(org/file "Tasks.org"))
           "** TODO %?\nDEADLINE: %^T\n")
          ("th" "Homework" entry (file ,(org/file "Tasks.org"))
           "** ALMA %?\nDEADLINE: %^T")
          ("tc" "Class" entry (file ,(org/file "Tasks.org"))
           "** ALMA %?\nSCHEDULED: %^T")
          ("y" "Payment" entry (file ,(org/file "Inbox.org"))
           "** PAY %?\nDEADLINE: %^t\nAmount: %^{Amount}")
          ("m" "Schedule a meeting" entry (file ,(org/file "Meets.org"))
           "* MEET %?\nSCHEDULED: %^T\nPlace: ")
          ("b" "Record a Birthday" entry (file ,(org/file "Birthdays.org"))
           "* BIRTHDAY %?\nDATE: %^t")
          ("p" "Create a project" entry (file ,(org/file "Tasks.org"))
           "** PROJ %?\nDEADLINE: %^T")))

  (setq org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        org-src-content-indentation 0))

(provide 'init-org)

;;; init-org.el ends here
