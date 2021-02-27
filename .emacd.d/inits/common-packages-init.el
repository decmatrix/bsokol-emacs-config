;;;;----------------------------------------------------------------------------
;;;; Author: Bohdan Sokolovskyi
;;;;----------------------------------------------------------------------------


;;;----------------------------------------------------------------------------
;;; helper packages
;;;----------------------------------------------------------------------------
;; dash
(el-get-bundle! dash)

;; autothemer
(el-get-bundle! autothemer)

;; bs
(require 'bs)

;; memoize
(el-get-bundle! memoize)

;; page break lines
(el-get-bundle! page-break-lines)

;; projectile
(el-get-bundle! projectile)

;; powerline
(el-get-bundle powerline)
;;;;----------------------------------------------------------------------------


;;;----------------------------------------------------------------------------
;;; packages
;;;----------------------------------------------------------------------------

;; cua mode
(cua-mode t)

;; paren mode
(show-paren-mode t)
(setq show-paren-style 'expression)

;; kaolin theme
(el-get-bundle! kaolin-themes
  :url "https://github.com/ogdenwebb/emacs-kaolin-themes.git"
  (load-theme 'kaolin-aurora t))

;; paredit
(el-get-bundle! paredit
  (autoload 'enable-paredit-mode
    "paredit"
    "Turn on pseudo-structural editing of Lisp code.")
  (add-hook 'prog-mode-hook #'enable-paredit-mode)
  (add-hook 'slime-repl-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)
  (add-hook 'clojure-mode-hook #'enable-paredit-mode))

;; neotree
(el-get-bundle! neotree
 (setq neo-theme 'nerd)
  (global-set-key [f8] 'neotree-toggle))

;; treemacs
(el-get-bundle treemacs)

;; centaur tabs
(el-get-bundle centaur-tabs
 (centaur-tabs-mode t)
 (global-set-key (kbd "C-<prior>")  'centaur-tabs-backward)
 (global-set-key (kbd "C-<next>") 'centaur-tabs-forward)
 (centaur-tabs-headline-match)
 (setq centaur-tabs-style "bar")
 (setq centaur-tabs-height 32)
 (setq centaur-tabs-set-icons t))

;; dashboard
(el-get-bundle dashboard
 (dashboard-setup-startup-hook)
 (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
 (setq dashboard-banner-logo-title "Ah Shit, Here We Go Again")

 (setq dashboard-items '((recents  . 5)
                         (bookmarks . 5)
                         (projects . 5)
                         (agenda . 5)
                         (registers . 5)))

 (setq dashboard-set-heading-icons t)
 (setq dashboard-set-file-icons t)
 (setq dashboard-set-navigator t))

;; ssh
(el-get-bundle! ssh
  (add-hook 'ssh-mode-hook
            (lambda ()
              (setq ssh-directory-tracking-mode t)
              (shell-dirtrack-mode t)
              (setq dirtrackp nil))))

;; highlight mode
(el-get-bundle! highlight-symbol
  (global-set-key [(control f3)] 'highlight-symbol)
  (global-set-key [f3] 'highlight-symbol-next)
  (global-set-key [(shift f3)] 'highlight-symbol-prev)
  (global-set-key [(meta f3)] 'highlight-symbol-query-replace))

;; elscreen
(el-get-bundle elscreen)

;; linum+
(el-get-bundle! linum+
  (global-linum-mode))

;; ido
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

;; ibuffer
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)
(global-set-key (kbd "<f2>") 'bs-show)

;; gitsum
(el-get-bundle! gitsum
    :url "https://github.com/leahneukirchen/gitsum.git")

;; dump jump
(el-get-bundle! dumb-jump)

;; undo tree
(el-get-bundle! undo-tree
  :url "https://github.com/akhayyat/emacs-undo-tree.git"
  (global-undo-tree-mode))

;; goto line preview
(el-get-bundle! goto-line-preview)

;; highlight parentheses
(el-get-bundle! highlight-parentheses)

;; visual regexp
(el-get-bundle! visual-regexp)

;; hl todo
(el-get-bundle! hl-todo
  (global-hl-todo-mode)
  (setq hl-todo-keyword-faces
        '(("WARNING" . "FF0000")
          ("TODO"   . "#FF0000")
          ("FIXME"  . "#FF0000")
          ("DEBUG"  . "#A020F0")
          ("GOTCHA" . "#FF4500")
          ("STUB"   . "#1E90FF"))))

;; all icons
(el-get-bundle all-the-icons)

;; popup
(el-get-bundle! popup)

;; auto complete
(el-get-bundle auto-complete
    (global-auto-complete-mode)
  (ac-linum-workaround)
  (setq ac-auto-start t)
  (global-set-key (kbd "C-<tab>") 'auto-complete)
  (global-set-key (kbd "M-n") 'ac-expand)
  (global-set-key (kbd "M-p") 'ac-previous))

;; ac slime
(el-get-bundle! ac-slime
    (add-hook 'slime-mode-hook 'set-up-slime-ac)
  (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
  (eval-after-load "auto-complete"
    '(progn
      (add-to-list 'ac-modes 'slime-repl-mode)
      (add-to-list 'ac-modes 'lisp-mode-hook)
      (add-to-list 'ac-modes 'emacs-lisp-mode-hook)))
  (add-hook 'prog-mode-hook '(lambda () (auto-complete-mode 1)))
  (add-hook 'lisp-mode-hook '(lambda () (auto-complete-mode 1)))
  (add-to-list 'ac-modes 'lisp-mode))

;; magit
(el-get-bundle magit)

;; magit svn
(el-get-bundle! magit-svn)

;; minimap
(el-get-bundle! minimap)

;; rainbow delimiters
(el-get-bundle! rainbow-delimiters
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)) 

;;;;----------------------------------------------------------------------------

(provide 'common-packages-init)
