;; Add packag arcchives
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"  . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
(setq package-check-signature nil)
;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))       
(require 'bind-key)                
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; start every frame maximized
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(if (eq initial-window-system 'x)          ; if started by emacs command or desktop file
    (toggle-frame-maximized)
  (toggle-frame-fullscreen))
;; Battery display
(unless (equal "Battery status not available"
               (battery))
    (display-battery-mode 1))
(org-babel-load-file (expand-file-name "readme.org" user-emacs-directory))

;;===========================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-continuous t)
 '(org-agenda-files
   '("/mnt/tsys/projects/emacs/gtd/agenda.org" "/mnt/tsys/projects/emacs/gtd/inbox.org" "/mnt/tsys/projects/emacs/gtd/minutes.org" "/mnt/tsys/projects/emacs/gtd/reading.org"))
 '(org-capture-templates
   '(("i" "Inbox Entry" entry
      (file "/mnt/tsys/projects/emacs/gtd/inbox.org")
      (file "~/.emacs.d/capture/inbox.org")
      :empty-lines-before 1)
     ("m" "Meeting Entry" entry
      (file "/mnt/tsys/projects/emacs/gtd/agenda.org")
      (file "~/.emacs.d/capture/agenda.org")
      :empty-lines-before 1)))
 '(org-log-into-drawer t)
 '(package-selected-packages
   '(command-log-mode solaire-mode font-lock font-lock+ multiple-cursors org-superstar org-download yasnippet maxima julia-mode jupyter conda company ess org-roam-ui org-ref helm-bibtex org-roam-bibtex org-roam org-noter-pdftools org-pdftools org-noter pdf-tools magit which-key org-fragtog olivetti counsel all-the-icons all-the-icons-ivy doom-modeline doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-info ((t (:foreground "gold")))))


