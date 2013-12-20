;;; package --- .emacs.d/personal/my.el

;;; Commentary:
;; Personal EMACS settings
;;
(require 'package)
 (add-to-list 'package-archives
              '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


(defvar my-packages '(color-theme-solarized auto-complete ac-nrepl popup undo-tree))


(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Pasting
(setq x-select-enable-clipboard t)
(setq-default inhibit-startup-screen t)

;; Colors
;;(disable-theme 'zenburn)
(load-theme 'solarized-dark t)

;; Always show column numbers.
(setq-default column-number-mode t)

;; Sunrise Commander
;;(require 'sunrise-commander)
;;(global-set-key (kbd "C-c x") 'sunrise)
;;(global-set-key (kbd "C-c X") 'sunrise-cd)

;; For easy window scrolling up and down.
(global-set-key "\M-n" 'scroll-up-line)
(global-set-key "\M-p" 'scroll-down-line)

;; For easier access to regex search/replace.
(defalias 'qrr 'query-replace-regexp)

;; Some default eldoc facilities
;; (add-hook 'nrepl-connected-hook
;; (defun pnh-clojure-mode-eldoc-hook ()
;; (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
;; (nrepl-enable-on-existing-clojure-buffers)))


;; ;; Clojure speific emacs
 (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
 (setq nrepl-hide-special-buffers t) ; hides *server..repl stufff

;;Cider settings

;;(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-popup-stacktraces nil)
;;(setq cider-repl-popup-stacktraces t)
(setq cider-auto-select-error-buffer t)
(setq nrepl-buffer-name-show-port t)
(setq cider-repl-display-in-current-window t)

(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000) ; the default is 500
(setq cider-repl-history-file "~/.emacs.d/nrepl-history")

 (add-hook 'cider-repl-mode-hook 'subword-mode)
;;  (add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(global-rainbow-delimiters-mode)
(smartparens-global-strict-mode)

;; Auto Complete
(require 'auto-complete)
(global-set-key [C-tab] 'auto-complete)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)

(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode 'global-auto-complete-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions 'auto-complete))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(eval-after-load "cider"
  '(define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc))
