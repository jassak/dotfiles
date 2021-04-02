;; Load config file
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; -------------------------------------------------------------------------------- 
;; custom set variables
;; -------------------------------------------------------------------------------- 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-C-u-scroll t)
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages '(elpy spacemacs-theme evil))
 '(spacemacs-theme-comment-italic nil)
 '(spacemacs-theme-keyword-italic t)
 '(spacemacs-theme-underline-parens nil))
