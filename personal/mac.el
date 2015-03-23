;; Mac specific settings

;; MAC SPECIFIC
;; BUG - Read in PATH from .zprofile
;; (if (not (getenv "TERM_PROGRAM"))
;;     (setenv "PATH"
;;         (shell-command-to-string "source $HOME/.zprofile && printf $PATH")))

;; (when (memq window-system '(mac ns)) (exec-path-from-shell-initialize)) ;;Launching emacs from gui
        
(setq mac-command-modifier 'meta)
;; (setq mac-option-modifier 'alt)
(setq mac-option-modifier 'super)

;; Allow tabbing between frames
;; (x-focus-frame nil)
(global-set-key "\M-`" 'other-frame)


;(defun copy-from-osx ()
;  (shell-command-to-string "pbpaste"))

;(defun paste-to-osx (text &optional push)
;  (let ((process-connection-type nil))
;    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;      (process-send-string proc text)
;      (process-send-eof proc))))

;(setq interprogram-cut-function 'paste-to-osx)
;(setq interprogram-paste-function 'copy-from-osx)
