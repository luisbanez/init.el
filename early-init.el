;; minimize garbage collection for faster startup
(setq gc-cons-threshold most-positive-fixnum)

;; PACKAGES
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(use-package doom-themes
  :defer t
  :ensure t)

(use-package visible-mark
  :defer t
  :ensure t)

(use-package eldoc-box
  :defer t
  :ensure t)

(use-package disable-mouse
  :ensure t
  :defer t)

(use-package vertico
  :ensure t
  :defer t)

;; transient mark mode
(transient-mark-mode -1)
(setq-default tab-width 4)

;; annoying backups!!!
(setq backup-directory-alist ' ((".". "~/.emacs.d/backups")))

;; windmove (S-<left>/<right> to switch windows)
(windmove-default-keybindings)

;; disable eglot autoformatting
(use-package eglot
  :defer t
  :config
  (add-to-list 'eglot-ignored-server-capabilities :documentOnTypeFormattingProvider))

;; indentation width in c-ts-mode
(setq-default indent-tabs-mode nil)
(setq c-ts-mode-indent-offset 4)
(setq-default c-ts-mode-indent-style 'bsd)

;; brackets
(electric-pair-mode 1)
  
;; custom keybinds
(bind-key* "C-d" 'delete-region) ;; delete region without copying
(bind-key* "M-RET" 'eldoc-box-help-at-point)
(bind-key* "C-a" 'back-to-indentation)
(bind-key* "M-w" 'copy-region-as-kill)
(bind-key* "C-x C-SPC" 'pop-to-mark-command)
(bind-key* "C-x C-<up>" 'flymake-goto-prev-error)
(bind-key* "C-x C-<down>" 'flymake-goto-next-error)
