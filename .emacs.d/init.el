;; Straight package manager (https://github.com/raxod502/straight.el)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)

;; -------------------------------------------------------------------------------- 
;; Customization
;; -------------------------------------------------------------------------------- 
;; No tool-bar / scroll-bar
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Global line numbers
(global-linum-mode 1)

;; Enable IDO mode
(ido-mode 1)
(setq ido-enabel-flex-matching t)
(setq ido-everywhere t)

;; Hide splash screen
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)  

;; No beep
(setq ring-bell-function 'ignore)

;; No wrap
(set-default 'truncate-lines t)

;; Terminal config
(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(global-set-key (kbd "<C-return>") 'ansi-term)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Scrolling
(setq scroll-conservatively 100)

;; Highlight active line
(when window-system (global-hl-line-mode t))

;; Prettify symbols
(global-prettify-symbols-mode t)

;; No autosave/backups
(setq make-backup-file nil)
(setq auto-save-default nil)

;; -------------------------------------------------------------------------------- 
;; Keybindings
;; -------------------------------------------------------------------------------- 
(windmove-default-keybindings)
(global-set-key (kbd "M-o") 'other-window)

;; -------------------------------------------------------------------------------- 
;; Install Packages
;; -------------------------------------------------------------------------------- 
(straight-use-package 'use-package)
(straight-use-package 'better-defaults)
(straight-use-package 'spacemacs-theme)
(straight-use-package 'evil)
(straight-use-package 'flycheck)
(straight-use-package 'blacken)
(straight-use-package 'magit)

;; -------------------------------------------------------------------------------- 
;; Config Packages
;; -------------------------------------------------------------------------------- 
;; Enable Evil
(setq evil-split-window-below t)
(setq vevil-split-window-right t)
(setq evil-disable-insert-state-bindings t)
(setq evil-want-C-u-delete t)
(setq evil-want-C-u-scroll t)
(setq evil-want-Y-yank-to-eol t)
(require 'evil)
(evil-mode 1)

;; Helm
(use-package helm
  :straight t)

;; Beacon
(use-package beacon
  :straight t
  :init (beacon-mode 1))

;; Spacemacs theme
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

;; Python
(use-package elpy
  :straight t
  :ensure t
  :init
  (elpy-enable))

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Which key
(use-package which-key
  :straight t
  :init (which-key-mode))

;; -------------------------------------------------------------------------------- 
;; Custom set variables
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil
		:extend nil
		:stipple nil
		:background "#292b2e"
		:foreground "#b2b2b2"
		:inverse-video nil
		:box nil
		:strike-through nil
		:overline nil
		:underline nil
		:slant normal
		:weight normal
		:height 190
		:width normal
		:foundry "nil"
		:family "JetBrainsMono Nerd Font Mono")))))
