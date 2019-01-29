(require 'package)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA Stable" . 5)
        ("MELPA"        . 0)))
(package-initialize)
;; (package-refresh-contents)

;; change path for auto-save and auto-backup
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs-saves")))
(setq auto-save-file-name-transforms
  `((".*" "~/.emacs.d/emacs-saves/" t)))

;; built-in settings
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t)
(set-face-attribute 'default nil :height 150)
(global-linum-mode 1)
(pending-delete-mode t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
;;(setq mac-command-modifier 'control)  ;; mac only
;; (setq tab-width 4)
;; (setq-default indent-tabs-mode nil)
;; setq-default electric-indent-inhibit t)
(global-auto-revert-mode 1)
(save-place-mode 1)
(global-hl-line-mode 1)
(blink-cursor-mode -1)
(put 'upcase-region 'disabled nil)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))  ;; mac only
(add-to-list 'exec-path "/usr/local/bin/")
(global-set-key (kbd "<f8>") 'speedbar)
(setq smerge-command-prefix "\C-cm")

;; theme
(load-theme 'dracula)

;; projectile (fuzzy file search in project)
(require 'projectile)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(projectile-global-mode)

;; always enabled modes
(add-hook 'after-init-hook 'global-company-mode)  ;; auto-completion

;; goto definition
(setq dumb-jump-selector 'helm)
(dumb-jump-mode)

;; enabling modes according to extension
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;; goto last change
(global-set-key (kbd "C-{") 'goto-last-change)
(global-set-key (kbd "C-}") 'pop-global-mark)

;; expand-region (from: emacs-rocks)
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-|") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(define-key mc/keymap (kbd "<return>") nil)

;; helm
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(helm-autoresize-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(helm-mode 1)

;; helm-projectile
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; markdown realtime preview
(global-set-key (kbd "<f9>") 'flymd-flyit)

;; auto-detect indentation style
(require 'dtrt-indent)
(dtrt-indent-global-mode 1)

;; community hosted lisp
(add-to-list 'load-path "~/.emacs.d/user-lisp/php-eldoc")
(require 'php-eldoc)

;; load user lisp
(add-to-list 'load-path "~/.emacs.d/user-lisp")
(require 'defuns)

;; calls from user-lisp
(global-set-key (kbd "M-n") 'move-fast-next)
(global-set-key (kbd "M-p") 'move-fast-previous)
(global-set-key (kbd "C-S-j") 'move-line-down)
(global-set-key (kbd "C-S-k") 'move-line-up)
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "C-S-d") 'duplicate-line)
(global-set-key (kbd "M-S-w") 'copy-current-line)
(add-hook 'before-save-hook 'cleanup-buffer-safe)

;; automatically added code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "51ba4e2db6df909499cd1d85b6be2e543a315b004c67d6f72e0b35b4eb1ef3de" "617341f1be9e584692e4f01821716a0b6326baaec1749e15d88f6cc11c288ec6" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(fringe-mode nil nil (fringe))
 '(package-selected-packages
   (quote
    (helm-projectile helm-ag zerodark-theme dracula-theme dtrt-indent flymd helm restclient wgrep-ag expand-region php-mode solarized-theme magit multiple-cursors ag dumb-jump goto-last-change company web-mode projectile)))
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
