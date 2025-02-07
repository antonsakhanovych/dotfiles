(package-initialize)

(add-to-list 'load-path (expand-file-name "~/.config/emacs/local"))
(load "~/.config/emacs/modules/rc.el")
(load "~/.config/emacs/modules/bind.el")
(load "~/.config/emacs/modules/vars.el")
(load "~/.config/emacs/modules/prog.el")
(load "~/.config/emacs/modules/minibuf.el")
(load "~/.config/emacs/modules/org.el")
(load "~/.config/emacs/modules/misc.el")



(rc/require 'gruvbox-theme)
(load-theme 'gruvbox t)
