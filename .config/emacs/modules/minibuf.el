(rc/require 'ivy 'counsel 'swiper)
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(global-set-key "\C-s" 'swiper)
(global-set-key "\C-r" 'swiper-backward)

(global-set-key (kbd "M-x") 'counsel-M-x)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
