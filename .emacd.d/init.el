;;;;----------------------------------------------------------------------------
;;;; Author: Bohdan Sokolovskyi
;;;;----------------------------------------------------------------------------

;; This must come before configurations of installed packages.
;; Don't remove line above, just comment it
;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/inits")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;;;-----------------------------------------------------------------------------
;;; General settings
;;;-----------------------------------------------------------------------------

;; disable sound
(setq ring-bell-function 'ignore)

;; disable emacs warnings
(setq warning-minimum-level :emergency)

;; system coding
(progn
  (setq default-buffer-file-coding-system 'utf-8)
  (setq-default coding-system-for-read    'utf-8)
  (setq file-name-coding-system           'utf-8)
  (set-selection-coding-system            'utf-8)
  (set-keyboard-coding-system        'utf-8-unix)
  (set-terminal-coding-system             'utf-8)
  (prefer-coding-system                   'utf-8))

;; display time
(setq display-time-24hr-format t)
(display-time-mode             t)

;; scrolling settings
(setq scroll-step               1)
(setq scroll-margin            10) 
(setq scroll-conservatively 10000)

;; short message
(defalias 'yes-or-no-p 'y-or-n-p)

;; clipboard settings (common os buffer)
(setq x-select-enable-clipboard t)

;; highlight search results
(setq search-highlight        t)
(setq query-replace-highlight t)

;; end of file newlines
(setq require-final-newline    t)
(setq next-line-add-newlines nil)

;; indent settings 
(setq-default indent-tabs-mode nil)
(setq-default tab-width          4)
(setq-default c-basic-offset     4)
(setq-default standart-indent    4)
(global-set-key (kbd "RET") 'newline-and-indent)

;; other settings
(setq-default version-control      t
              auto-save-default    t
              backup-by-copying    t
              kept-new-versions    3
              kept-old-versions    1
              make-backup-files    nil
              delete-old-versions  t
              vc-make-backup-files t
              backup-directory-alist '(("." . "~/.emacs.d/backups")))
;;;-----------------------------------------------------------------------------



;;;-----------------------------------------------------------------------------
;;; Inits pacakges
;;;-----------------------------------------------------------------------------

(require 'lang-packages-init)
(require 'common-packages-init)
;;;-----------------------------------------------------------------------------



;;;-----------------------------------------------------------------------------
;;; Key binds
;;;-----------------------------------------------------------------------------

;; open slime
(global-set-key (kbd "C-c r") 'slime)

;; shell
(global-set-key (kbd "C-c s") 'shell)

;; show lisp of process
(global-set-key (kbd "C-c p") 'list-processes)

;; minimap
(global-set-key (kbd "C-c m") 'minimap-mode)
;;;-----------------------------------------------------------------------------

(provide 'init)
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(company-ghc-show-info t)
;;  '(package-selected-packages (quote (ghc racer company queue minimap))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(package-selected-packages
   (quote
    (kaolin-themes helm ghc racer company queue minimap)))
 '(safe-local-variable-values
   (quote
    ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook
            (quote write-contents-functions)
            (lambda nil
              (delete-trailing-whitespace)
              nil))
           (require
            (quote whitespace))
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-style face tabs trailing lines-tail)))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;;;-----------------------------------------------------------------------------
