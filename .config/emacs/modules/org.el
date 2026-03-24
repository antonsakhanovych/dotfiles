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


;; Latex
(rc/require 'auctex)
(setq TeX-parse-self t); Enable parse on load.
(setq TeX-auto-save t); Enable parse on save.
(setq-default TeX-master nil)
(setq TeX-PDF-mode t); PDF mode (rather than DVI-mode)

(setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.
(add-hook 'TeX-mode-hook
          (lambda () (TeX-fold-mode 1))); Automatically activate TeX-fold-mode.
(setq LaTeX-babel-hyphen nil); Disable language-specific hyphen insertion.

(setq LaTeX-csquotes-close-quote "}"
      LaTeX-csquotes-open-quote "\\enquote{")
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)
(add-hook 'TeX-mode-hook 'turn-on-reftex)
(eval-after-load 'reftex-vars; Is this construct really needed?
  '(progn
     (setq reftex-cite-prompt-optional-args t); Prompt for empty optional arguments in cite macros.
     ;; Make RefTeX interact with AUCTeX, http://www.gnu.org/s/auctex/manual/reftex/AUCTeX_002dRefTeX-Interface.html
     (setq reftex-plug-into-AUCTeX t)
     ;; So that RefTeX also recognizes \addbibresource. Note that you
     ;; can't use $HOME in path for \addbibresource but that "~"
     ;; works.
     (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))
;     (setq reftex-default-bibliography '("UNCOMMENT LINE AND INSERT PATH TO YOUR BIBLIOGRAPHY HERE")); So that RefTeX in Org-mode knows bibliography
     (setcdr (assoc 'caption reftex-default-context-regexps) "\\\\\\(rot\\|sub\\)?caption\\*?[[{]"); Recognize \subcaptions, e.g. reftex-citation
     (setq reftex-cite-format; Get ReTeX with biblatex, see https://tex.stackexchange.com/questions/31966/setting-up-reftex-with-biblatex-citation-commands/31992#31992
           '((?t . "\\textcite[]{%l}")
             (?a . "\\autocite[]{%l}")
             (?c . "\\cite[]{%l}")
             (?s . "\\smartcite[]{%l}")
             (?f . "\\footcite[]{%l}")
             (?n . "\\nocite{%l}")
             (?b . "\\blockcquote[]{%l}{}")))))

;; Fontification (remove unnecessary entries as you notice them) http://lists.gnu.org/archive/html/emacs-orgmode/2009-05/msg00236.html http://www.gnu.org/software/auctex/manual/auctex/Fontification-of-macros.html
(setq font-latex-match-reference-keywords
      '(
        ;; biblatex
        ("printbibliography" "[{")
        ("addbibresource" "[{")
        ;; Standard commands
        ;; ("cite" "[{")
        ("Cite" "[{")
        ("parencite" "[{")
        ("Parencite" "[{")
        ("footcite" "[{")
        ("footcitetext" "[{")
        ;; ;; Style-specific commands
        ("textcite" "[{")
        ("Textcite" "[{")
        ("smartcite" "[{")
        ("Smartcite" "[{")
        ("cite*" "[{")
        ("parencite*" "[{")
        ("supercite" "[{")
        ; Qualified citation lists
        ("cites" "[{")
        ("Cites" "[{")
        ("parencites" "[{")
        ("Parencites" "[{")
        ("footcites" "[{")
        ("footcitetexts" "[{")
        ("smartcites" "[{")
        ("Smartcites" "[{")
        ("textcites" "[{")
        ("Textcites" "[{")
        ("supercites" "[{")
        ;; Style-independent commands
        ("autocite" "[{")
        ("Autocite" "[{")
        ("autocite*" "[{")
        ("Autocite*" "[{")
        ("autocites" "[{")
        ("Autocites" "[{")
        ;; Text commands
        ("citeauthor" "[{")
        ("Citeauthor" "[{")
        ("citetitle" "[{")
        ("citetitle*" "[{")
        ("citeyear" "[{")
        ("citedate" "[{")
        ("citeurl" "[{")
        ;; Special commands
        ("fullcite" "[{")))

(setq font-latex-match-textual-keywords
      '(
        ;; biblatex brackets
        ("parentext" "{")
        ("brackettext" "{")
        ("hybridblockquote" "[{")
        ;; Auxiliary Commands
        ("textelp" "{")
        ("textelp*" "{")
        ("textins" "{")
        ("textins*" "{")
        ;; supcaption
        ("subcaption" "[{")))

(setq font-latex-match-variable-keywords
      '(
        ;; amsmath
        ("numberwithin" "{")
        ;; enumitem
        ("setlist" "[{")
        ("setlist*" "[{")
        ("newlist" "{")
        ("renewlist" "{")
        ("setlistdepth" "{")
        ("restartlist" "{")))
