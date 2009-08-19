(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(ecb-options-version "2.32")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(jde-checkstyle-classpath (quote ("/usr/share/java/checkstyle.jar:/usr/share/java/commons-cli.jar:/usr/share/java/commons-beanutils.jar:/usr/share/java/commons-logging.jar:/usr/share/java/antlr.jar")))
 '(jde-enable-abbrev-mode t)
 '(jde-jdk-registry (quote (("1.6.0_03" . "/usr/lib/jvm/java-6-sun/"))))
 '(tabs-width 4))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :family "ascender-liberation.mono")))))

(autoload 'gtags-mode "gtags" "" t)

;; Move current line up or down with M-up or M-down
(defun move-line (n)
   "Move the current line up or down by N lines."
   (interactive "p")
   (let ((col (current-column))
         start
         end)
     (beginning-of-line)
     (setq start (point))
     (end-of-line)
     (forward-char)
     (setq end (point))
     (let ((line-text (delete-and-extract-region start end)))
       (forward-line n)
       (insert line-text)
       ;; restore point to original column in moved line
       (forward-line -1)
       (forward-char col))))
 
(defun move-line-up (n)
   "Move the current line up by N lines."
   (interactive "p")
   (move-line (if (null n) -1 (- n))))
 
(defun move-line-down (n)
   "Move the current line down by N lines."
   (interactive "p")
   (move-line (if (null n) 1 n)))

;; Keys
(global-set-key (kbd "A-<up>")   'move-line-up)
(global-set-key (kbd "A-<down>") 'move-line-down) 
(global-set-key (kbd "M-<up>")   'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down) 
(global-set-key "\M-g"           'goto-line)
(global-set-key "\C-l"           'goto-line)
(global-set-key "\M-F"           'indent-region)

;; Manual jde install
;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site/jde/lisp"))
(require 'jde)

;; IDO-Mode (emacs goodies)
;; File open and buffer switch helper
(require 'ido)
(ido-mode t)
;;(require 'un-define)


;; TXT2Tags
(add-to-list 'load-path "~/.emacs.d")
(setq auto-mode-alist (append (list
				'("\\.t2t$" . t2t-mode)
				)
			      (if (boundp 'auto-mode-alist) auto-mode-alist)
))
(autoload  't2t-mode "txt2tags-mode" "Txt2tags Mode" t)
(column-number-mode)

;; Detect indent - Para alguns modos: C/C++, Shell Script, perl, etc.
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Color Theme
(load-library "color-theme")
(color-theme-charcoal-black)

;; Errr.. can't remember
(put 'scroll-left 'disabled nil)

;; Mouse wheel scrolling
(mouse-wheel-mode t)

;; ===== Set the highlight current line minor mode =====
;;
;; In every buffer, the line which contains the cursor will be fully
;; highlighted
;(global-hl-line-mode 1)

;; ========== Set the fill column ==========
(setq-default fill-column 72)

;; ===== Turn on Auto Fill mode automatically in all modes =====

;; Auto-fill-mode the the automatic wrapping of lines and insertion of
;; newlines when the cursor goes over the column limit.

;; This should actually turn on auto-fill-mode by default in all major
;; modes. The other way to do this is to turn on the fill for specific modes
;; via hooks.
(setq auto-fill-mode 1)

;; Git
(require 'git)
(require 'git-blame)

;;; turn on syntax hilighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
