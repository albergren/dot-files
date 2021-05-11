(desktop-save-mode 1)
(global-auto-revert-mode 1)

;; font size
(set-face-attribute 'default nil :height 90)


(cond
 ((string-equal system-type "windows-nt")
  (progn
    (add-to-list 'custom-theme-load-path "~\\.emacs.d\\themes\\")
(add-to-list 'load-path "~\\.emacs.d\\el\\")))
 ((string-equal system-type "darwin") ;  macOS
  (progn
    (message "Mac OS X")))
 ((string-equal system-type "gnu/linux")
  (progn
   (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/el/"))))


;; Load paths



(setq package-enable-at-startup nil)
(package-initialize)

;; line numbers on side	and column numbers
(global-linum-mode 1)
(setq column-number-mode t)


(require 'config)
(require 'init-org)



;; -------------------------------------------
;; |           Custom key bindings           |
;; -------------------------------------------

;; Set undo to C-z
(global-set-key (kbd "C-z") 'undo)

;; set C-h to backspace
(global-set-key [(control h)] 'delete-backward-char)


;; set next buffer to C-x n and prev to C-x p
(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "C-x p") 'previous-buffer)


;; ------------------------------------------
;; |           Hides things 	            |
;; |         (mostly set by custom)   	    |
;; ------------------------------------------

;; Hides scrollbar
(scroll-bar-mode -1)

;; Hides menus and toolbars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["black" "#E2434C" "#86B187" "#E0D063" "#84C452" "#E18CBB" "#8AC6F2" "white"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (lithium)))
 '(custom-safe-themes
   (quote
    ("3d0d4eb6bd36feee1e44a29ccc34f10e6db8f9ba1768a042083ca574d2d02f44" "e3b2bad7b781a968692759ad12cb6552bc39d7057762eefaf168dbe604ce3a4b" "9d13a99337b4217f34c72d3141c3348dff337f7f0a15a1889042d36b313e566e" "97cc3d3bd6a9f1f015c7b4840e35989587c093bc594a1a607d30dd14f4f05b37" "0de5195cd601eebf94be2c995fcaa200679715d6bb595b8291e9c9b1f4ba5f3c" "d1cc94b54a361dcd50dd5faa2eed4454f03768e4c690ebbbfb64341c1c468962" "ea0f7cec4243ef3577232d7c5072a3faa8d5ba3a0d47334cce7396b32a264219" "aeef2217f11b41fc3427b2d366dcf631afd4a90c2282f5c0c18156195c0b1d7d" "65165d4d574fe2b08f1ac07d368c6ff0796b646596ba96440ea77ff8140138c8" "ab5264a96afda0acd026384735ea4ffd3385de4ce8dceec96dee5dbc59c45c78" "8c2a98d51b77f915a2f360917849ec3ce2c96b0120f3be8fe83c0bcd3421a21b" "24cc1eea1fd126c562c717846e774f9a6cb308871459d00de66dba7b40340854" "e60e01f0b0267225135f03cc232fbb31ca276c150533a7a184afb26e0543ca3d" "fa919f0e0d6642e8846d4902caab2ceb497dbe67baa51ef154472f5d69895399" "eaa360a010c6abde7e04a31d04628af243f9b2eb3811174c2fa4df0e0fa539f0" "94162a48f154721a7b71579a55aacab85d6aed03e50b5d8cb337957dce56fee6" "bb1c5f3a45e2bfe43e629179ba2678c84995f063f7d7f8fcf29d46ca539bacd1" "282d52ed0e1d3ed895c383a11a234213b9ac0080e1abc719c2f61ffc12edaf3e" "5c9f44c0709b61d8f5c7e355f03a0c1c1940860602a2b970e75d006c33129191" "11d6e7d64d19a46c64038f41382a4b475d372f85e 29ecfc620d51873b16dc8e7" "a70e190713ce8c01ce28ef1177f751d935cb1df2d292baec4b39f0cb4b13dece" "0b20499d20fb16e18327a46c235b60d267c993cb4f1a27fcaf88c7e4467a8dd6" "758be9e6304dc48dfe8eff50f34210b23926ee628cd6a89f84b5c2fecca816f6" "035e6a910c23cfe1bd8b1f1c1e14bbd615900e900166d81943436cf3dd3c49f1" "ba3bea526064c4858798b3c2fc7332bf1319732577293c9bb7b23d83a76250be" "6aeb8aafd7809a604ef672b425a64e018ec39b0198aef95fadd51b4d4885a7e8" "8793bcfe05a581d2ea07902b58597f4716792accf4e9b022dbb29d18c9237a7b" "1640c064d36826537cc9f75bc431f052ce6410cab8744b4bd461d9228968f93d" "07dda9a3249f9ac909e7e0dc3c8876fd45898aa21646e093148dbd6ebb294f66" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "97084a13605260fbe13aa89c2ababb876014d7d3b63879c69c8439d25ab3fb8f" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "613a7c50dbea57860eae686d580f83867582ffdadd63f0f3ebe6a85455ab7706" "55f6eadaf7f83064f54b6a47a3161ac3095e21496bdbfe4d6645c10d951f8ed3" "778ca64be682097ae13574169d8d8554da510576dacbbabf76eebf8e75e13c86" "e068203104e27ac7eeff924521112bfcd953a655269a8da660ebc150c97d0db8" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" default)))
 '(fci-rule-color "#383838")
 '(global-whitespace-mode nil)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3E3D31" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#3E3D31" . 100))))
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (htmlize web-mode nord-theme org-bullets org-superstar zetteldeft use-package org-roam-bibtex org-roam vue-mode typescript-mode ivy org fsharp-mode ant ac-emoji)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (unspecified "#272822" "#3E3D31" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(whitespace-style (quote (face lines lines-tail))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:weight ultra-bold))))
 '(italic ((t (:slant italic))))
 '(org-agenda-structure ((t (:inherit default :foreground "#bbc2cf" :underline nil :slant normal :weight bold :height 2.0 :width normal :foundry "outline" :family "PT Sans"))))
 '(org-default ((t (:inherit variable-pitch))))
 '(org-document-title ((t (:inherit org-level-1 :foreground "dark gray" :weight bold :height 1.2 :family "IM Fell English SC"))))
 '(org-footnote ((t (:foreground "gray40" :underline t :height 0.5))))
 '(org-indent ((t (:inherit org-hide fixed-pitch))))
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#a89984" :weight bold :height 1.6 :family "IM Fell English SC"))))
 '(org-level-2 ((t (:inherit nil :foreground "#bdae93" :weight bold :height 1.4 :family "IM Fell English SC"))))
 '(org-level-3 ((t (:foreground "#d5c4a1" :height 1.2 :family "IM Fell English SC"))))
 '(org-level-4 ((t (:inherit nil :foreground "#ebdbb2" :weight normal :height 1.1 :family "IM Fell English SC"))))
 '(org-level-5 ((t (:inherit nil :foreground "#ebdbb2" :weight normal :height 1.0 :family "IM Fell English SC"))))
 '(org-level-6 ((t (:inherit nil))))
 '(org-level-7 ((t nil)))
 '(org-link ((t (:inherit nil :foreground "cornflower blue" :underline t :height 1.0))))
 '(org-table ((t (:foreground "tomato"))))
 '(org-variable-pitch-face ((t (:height 1.0 :family "IM Fell English"))))
 '(variable-pitch ((t (:height 1.0 :family "IM Fell English"))))
 '(whitespace-line ((t (:background "gray32")))))
 



;; ---------------------------------------------
;; |      LaTeX related configurations         |
;; |    (requires autcTeX to be installed)     |
;; ---------------------------------------------

(require 'auto-complete-latex)
(setq ac-modes (append ac-modes '(foo-mode)))
(add-hook 'foo-mode-hook 'ac-l-setup)

;; compile latex to pdf by default 
(setq TeX-PDF-mode t)

;; Ignore autcTeX font colors and sizes
(setq font-latex-fontify-sectioning 'color)

;; Latex autocomplete with C-Tab
(add-hook 'LaTeX-mode-hook
      (lambda()
        (local-set-key [C-tab] 'TeX-complete-symbol)))


;; ---------------------------------------------
;; |	Package management 	      	       |
;; ---------------------------------------------


(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "https://melpa.org/packages/")
   t)
  (unless package-archive-contents (package-refresh-contents))
  (package-initialize))
(ac-config-default)


(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


;; ---------------------------------------------
;; |	ivy-mode 		               |
;; ---------------------------------------------
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(add-to-list 'command-switch-alist '("-roam" . roam-layout))
