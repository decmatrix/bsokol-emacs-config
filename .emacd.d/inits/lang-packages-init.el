;;;;----------------------------------------------------------------------------
;;;; Author: Bohdan Sokolovskyi
;;;;----------------------------------------------------------------------------



;;;----------------------------------------------------------------------------
;;; Common lisp
;;;----------------------------------------------------------------------------
;; setup your settings
;; (el-get-bundle! slime
;;     :url "https://github.com/slime/slime.git"
;;     :features slime-autoloads)
;; some problems with build slime, use el-get-bundle if can, but i used quicklisp slime helper
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(add-hook 'slime-mode-hook #'mod-prettify-symbols)

(el-get-bundle! common-lisp-snippets)

;; lisp keywords -> symbols settings
(defun mod-prettify-symbols ()
  (push '("lambda"  . ?λ) prettify-symbols-alist)
  (push '(">=" . ?≥) prettify-symbols-alist)
  (push '("<=" . ?≤) prettify-symbols-alist)
  ;(push '("defun" . ?𝒇) prettify-symbols-alist)
  (push '("/=" . ?≠) prettify-symbols-alist)
  ;(push '("nil" . ?∅) prettify-symbols-alist)
)

(global-prettify-symbols-mode)
(add-hook 'lisp-mode-hook #'mod-prettify-symbols)

;; lisp idents
(setq lisp-indent-function  'common-lisp-indent-function)

;; highlight lisp forms
(defun lisp-add-keywords (face-name keyword-rules)
   (let* ((keyword-list (mapcar #'(lambda (x)
                                    (symbol-name (cdr x)))
                                keyword-rules))
          (keyword-regexp (concat "(\\("
                                  (regexp-opt keyword-list)
                                  "\\)[ \n]")))
     (font-lock-add-keywords 'lisp-mode
                             `((,keyword-regexp 1 ',face-name))))
   (mapc #'(lambda (x)
             (put (cdr x)
                  ;; scheme-indent-function
                  'common-lisp-indent-function
                  (car x)))
         keyword-rules))

(lisp-add-keywords
 'font-lock-keyword-face
 '((1 . aif)
   (1 . awhen)))
;;;----------------------------------------------------------------------------

(provide 'lang-packages-init)
