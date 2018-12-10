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
(set-face-attribute 'default nil :height 150)
(global-linum-mode 1)
(pending-delete-mode t)
(setq mac-command-modifier 'control)
(setq inhibit-startup-screen t)
;; (setq tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default electric-indent-inhibit t)
(global-auto-revert-mode 1)
(save-place-mode 1)
(put 'upcase-region 'disabled nil)
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))  ;; mac only

;; theme
(load-theme 'tango-dark)

;; projectile (fuzzy file search in project)
(require 'projectile)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching t)
(projectile-global-mode)

;; always enabled modes
(company-mode)  ;; auto-completion
(dumb-jump-mode)  ;; goto definition

;; enabling modes according to extension
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
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
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(fringe-mode nil nil (fringe))
 '(package-selected-packages
   (quote
    (restclient wgrep-ag expand-region php-mode solarized-theme magit multiple-cursors ag dumb-jump goto-last-change company web-mode projectile)))
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )