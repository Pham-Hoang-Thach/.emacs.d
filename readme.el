(setq custom-safe-themes t)
(load-theme 'modus-operandi)

;; invoke `eval-last-sexp' for (w32-select-font)
(set-face-attribute 'default nil  :font "iA Writer Quattro S-12")

(set-face-attribute 'variable-pitch nil :font "iA Writer Quattro S-13")
(set-face-attribute 'fixed-pitch nil :font "iA Writer Mono S-12")
(set-face-attribute 'default nil :font "iA Writer Mono S-12")
(set-fontset-font nil 'symbol (font-spec :family "Segoe UI Symbol" :size 12.0))
(add-hook 'text-mode-hook 'variable-pitch-mode)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Enable Ivy mode in general
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Add Counsel and Swiper search functions
(global-set-key (kbd "C-c f r") #'counsel-recentf)
(global-set-key (kbd "C-c C-s") #'swiper)

;; Replace default "M-x" and "C-x C-f" with Counsel version
(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)

;; Replace describe-function and describe-variable with Counsel version
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; Set the body text width
(setq olivetti-body-width 80)

;; Enable Olivetti for text-related mode such as Org Mode
(add-hook 'text-mode-hook 'olivetti-mode)

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
(setq-default indent-tabs-mode nil)
(setq pop-up-windows nil)
(tool-bar-mode 0) 
(tooltip-mode  1)
(scroll-bar-mode 0)
(menu-bar-mode 0) ;menu bar is explicitly turned on for beginners. Change the value to 0.

;; Line cursor and no blink
(set-default 'cursor-type  '(bar . 1))
(blink-cursor-mode 0)

;; Line spacing, can be 0 for code and 1 or 2 for text
(setq-default line-spacing 2)

;; Underline line at descent position, not baseline position
(setq x-underline-at-descent-line t)

;; Avoid #file.org# to appear
(auto-save-visited-mode)
(setq create-lockfiles nil)

;; Avoid filename.ext~ to appear
(setq make-backup-files nil)

(show-paren-mode 1)

(setq langtool-language-tool-jar  "D:/LanguageTool-5.2/languagetool-commandline.jar")
(require 'langtool)
(setq langtool-java-bin "C:/Program Files/Java/jre1.8.0_281/bin/java.exe")
(setq langtool-default-language "en-US")

(setq org-latex-create-formula-image-program 'dvipng)

;; PDF export
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (latex . t)
   (R . t)
  ))

;; Tell Emacs where sqlite3.exe is stored
(add-to-list 'exec-path "D:/Emacs/bin/sqlite-tools-win32-x86-3350200")

;; Org-roam directory
(setq org-roam-directory "D:/Git.New/WORG/Roam")

;; Tell Emacs to start org-roam-mode when Emacs starts
(add-hook 'after-init-hook 'org-roam-mode)

;; Define key bindings for Org-roam
(global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle-display)
(global-set-key (kbd "C-c n i") #'org-roam-insert)
(global-set-key (kbd "C-c n /") #'org-roam-find-file)
(global-set-key (kbd "C-c n b") #'org-roam-switch-to-buffer)
(global-set-key (kbd "C-c n d") #'org-roam-find-directory)

;; Recommendation for Windows users for performance
(setq org-roam-db-update-method 'immediate)

;; Let's also assign C-z to undo here
(global-set-key (kbd "C-z") 'undo) ;Emacs default is bound to hide Emacs.

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; Path to Graphviz
(setq org-roam-graph-executable "D:/Emacs/bin/stable_windows_10_msbuild_Release_Win32_graphviz-2.47.0-win32/Graphviz/bin/dot.exe")

;; Display graphs in Chrome
(setq org-roam-graph-viewer "C:/Program Files/Google/Chrome/Application/chrome.exe")

;; Set up bibliography
(setq org-ref-default-bibliography '("D:/Git.New/WORG/bibtex.bib"))
(setq bibtex-completion-bibliography "D:/Git.New/WORG/bibtex.bib")
(global-set-key (kbd "<f6>") #'org-ref-helm-insert-cite-link)

;; Org-roam-bibtex
(require `org-roam-bibtex)
(add-hook 'after-init-hook #'org-roam-bibtex-mode)
(define-key org-roam-bibtex-mode-map (kbd "C-c n a") #'orb-note-actions)

(setq org-noter-notes-search-path '("D:/Git.New/WORG/Roam/Notes"))
(setq org-noter-always-create-frame nil)
(setq org-noter-separate-notes-from-heading t)

(pdf-loader-install)
;; Auto revert
;; (add-hook 'TeX-after-compilation-finished-functions  #'TeX-revert-document-buffer)

(setq bibtex-completion-pdf-field "File")

(require 'org-tempo)

(defun langtool-autoshow-detail-popup (overlays)
  (when (require 'popup nil t)
    ;; Do not interrupt current popup
    (unless (or popup-instances
                ;; suppress popup after type `C-g` .
                (memq last-command '(keyboard-quit)))
      (let ((msg (langtool-details-error-message overlays)))
        (popup-tip msg)))))

(setq langtool-autoshow-message-function
     'langtool-autoshow-detail-popup)
