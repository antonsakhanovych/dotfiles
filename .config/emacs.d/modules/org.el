(rc/require 'org)
(require 'org)
(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(add-hook 'org-mode-hook 'org-indent-mode)

;; Variables
(setq calendar-week-start-day 1
      org-directory "~/Org"
      org-agenda-files '("~/Org/Inbox.org" "~/Org/Tasks.org" "~/Org/Meets.org" "~/Org/Birthdays.org" ))
;; Commands
(setq org-todo-keywords
        '((sequence
           "TODO(t)"           ; A task that is ready to be tackled
           "WORK(r)"
           "MEET(m)"           ; Meetings
           "PAY(y)"
           "ALMA(a)"
           "PROJ(p)"           ; A project that contains other tasks
           "SELF(s)"           ; Time to spend
           "WAIT(w)"           ; Something is holding up this task
           "BIRTHDAY(b)"
           "|"                 ; The pipe necessary to separate "active" states and "inactive" states
           "DONE(d)"           ; Task has been completed
           "CANCELLED(c)" )))  ; Task has been cancelled


(setq org-agenda-skip-function
  #'(org-agenda-skip-entry-if 'todo '("BIRTHDAY")))

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

;; Templates
(setq org-capture-templates
      '(("t" "Templates for tasks")
        ("ti" "Tasks" entry (file "~/Org/Tasks.org")
         "** TODO %?\nDEADLINE: %^T\n")
        ("th" "Homework" entry (file "~/Org/Tasks.org")
         "** ALMA %?\nDEADLINE: %^T")
        ("tc" "Class" entry (file "~/Org/Tasks.org")
         "** ALMA %?\nSCHEDULED: %^T")
        ("y" "Payment" entry (file "~/Org/Inbox.org")
         "** PAY %?\nDEADLINE: %^t\nAmount: %^{Amount}")
        ("m" "Schedule a meeting" entry (file "~/Org/Meets.org")
         "* MEET %?\nSCHEDULED: %^T\nPlace: ")
        ("b" "Record a Birthday" entry (file "~/Org/Birthdays.org")
         "* BIRTHDAY %?\nDATE: %^t")
        ("p" "Create a project" entry (file "~/Org/Tasks.org")
         "** PROJ %?\nDEADLINE: %^T")
        ))


;; CodeBlocks display
(setq org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0)


;; Keybinds
(global-set-key (kbd "C-c a c") #'org-capture)
(global-set-key (kbd "C-c a a") #'org-agenda)
(global-set-key (kbd "C-c a r") #'org-refile)
