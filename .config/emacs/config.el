(when (< emacs-major-version 29)
  (error "Emacs Writing Studio requires version 29 or later"))

(use-package package
  :config
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/"))
  (package-initialize))

(use-package use-package
  :custom
  (use-package-always-ensure t)
  (package-native-compile t)
  (warning-minimum-level :emergency))

(load-file (concat (file-name-as-directory user-emacs-directory) "ews.el"))

(ews-missing-executables
 '(("gs" "mutool")
   "pdftotext"
   "soffice"
   "zip"
   "ddjvu"
   "curl"
   ("mpg321" "ogg123" "mplayer" "mpv" "vlc") 
   ("grep" "ripgrep")
   ("convert" "gm")
   "dvipng"
   "latex"
   "hunspell"
   "git"))

(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Short answers
(setq-default use-short-answers t)

;; Scratch buffer in Org mode
(setq initial-major-mode 'org-mode
      initial-scratch-message (concat "#+title: Emacs Writing Studio\n"
                      "#+subtitle: Scratch Buffer\n\n"
                      "The text in this buffer is not saved when exiting Emacs!\n\n"))

(use-package doc-view
  :custom
  (doc-view-resolution 300)     ; Try 250–400. Higher = sharper but slower
  (large-file-warning-threshold (* 100 (expt 2 20))))  ; For bigger PDFs

(use-package spacious-padding
  :custom
  (line-spacing 3)
  (spacious-padding-mode 1))

(use-package modus-themes
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  (modus-themes-mixed-fonts t)
  (modus-themes-to-toggle '(modus-operandi modus-vivendi))
  :bind
  (("C-c w t t" . modus-themes-toggle)
   ("C-c w t m" . modus-themes-select)
   ("C-c w t s" . consult-theme)))

(use-package ef-themes)

(load-theme 'ef-symbiosis :no-confirm)

(use-package mixed-pitch
  :hook (org-mode . mixed-pitch-mode))

(setq split-width-threshold 120
      split-height-threshold nil)

(use-package balanced-windows
  :config
  (balanced-windows-mode))

(use-package vertico
  :init (vertico-mode)
  :custom (vertico-sort-function 'vertico-sort-history-alpha))

(use-package savehist
  :init (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles partial-completion)))))

(use-package marginalia
  :init (marginalia-mode))

(use-package which-key
  :config (which-key-mode)
  :custom
  (which-key-max-description-length 40)
  (which-key-lighter nil)
  :init
  (which-key-add-key-based-replacements
    "C-c w"   "Emacs Writing Studio"
    "C-c w b" "Bibliographic"
    "C-c w d" "Denote"
    "C-c w m" "Multimedia"
    "C-c w s" "Spelling and Grammar"
    "C-c w t" "Themes"
    "C-c w x" "Explore"))

(use-package text-mode
  :ensure nil
  :hook (text-mode . visual-line-mode)
  :init (delete-selection-mode t)
  :custom
  (sentence-end-double-space nil)
  (scroll-error-top-bottom t)
  (save-interprogram-paste-before-kill t))

(use-package flyspell
  :custom
  (ispell-program-name "hunspell")
  (ispell-dictionary ews-hunspell-dictionaries)
  (flyspell-mark-duplications-flag nil)
  :config
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic ews-hunspell-dictionaries)
  :hook (text-mode . flyspell-mode)
  :bind
  (("C-c w s s" . ispell)
   ("C-;"       . flyspell-auto-correct-previous-word)))

;; Reinforce Org capture binding and ensure EWS fleeting/permanent note templates
#+begin_src emacs-lisp
(use-package org
  :after denote
  :bind (("C-c c" . org-capture)
         ("C-c l" . org-store-link))
  :custom
  (org-startup-indented t)
  (org-hide-emphasis-markers t)
  (org-startup-with-inline-images t)
  (org-image-actual-width '(450))
  (org-pretty-entities t)
  (org-use-sub-superscripts "{}")
  (org-id-link-to-org-use-id t)
  (org-fold-catch-invisible-edits 'show)
  (org-default-notes-file ews-inbox-file)   ; EWS inbox for fleeting notes
  (org-capture-bookmark nil)

  :config
  (require 'denote)   ; Required for permanent notes

  ;; Explicitly define the full set of templates (fleeting + permanent + todo)
  (setq org-capture-templates
        '(("f" "Fleeting note" item (file+headline org-default-notes-file "Notes")
           "- %?")
          ("p" "Permanent note" plain (file denote-last-path)
           #'denote-org-capture
           :no-save t :immediate-finish nil :kill-buffer t :jump-to-captured t)
          ("t" "Todo" entry (file+headline ews-inbox-file "Tasks")
           "* TODO %?\n  %i\n  %a"))))

(use-package olivetti
  :demand t
  :bind (("C-c w o" . ews-olivetti)))

(global-set-key (kbd "C-c c") 'org-capture)

(setq-default custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :no-error-if-file-is-missing)

;; EMMS setup for MPD backend (add this to your init.el)
(require 'emms-setup)
(emms-all)                    ; Loads full features including cache and browser
(emms-default-players)

;; Use MPD as the primary player
(setq emms-player-list '(emms-player-mpd))

;; Connection settings
(setq emms-player-mpd-server-name "localhost")
(setq emms-player-mpd-server-port 6600)

;; Critical: Must match exactly the music_directory in ~/.config/mpd/mpd.conf
(setq emms-player-mpd-music-directory "/home/anthony/Music")

;; Enable caching and MPD metadata support
(require 'emms-cache)
(require 'emms-player-mpd)
(add-to-list 'emms-info-functions 'emms-info-mpd)
(setq emms-player-mpd-sync-playlist t)

;; Optional: Auto-connect on Emacs startup and default directory
(add-hook 'after-init-hook #'emms-player-mpd-connect)
(setq emms-source-file-default-directory "/home/anthony/Music")
