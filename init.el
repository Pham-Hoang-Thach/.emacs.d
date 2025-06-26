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
;;(if (eq initial-window-system 'x)          ; if started by emacs command or desktop file
;;    (toggle-frame-maximized)
;;  (toggle-frame-fullscreen))
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
 '(org-log-into-drawer t)
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-info ((t (:foreground "gold")))))


