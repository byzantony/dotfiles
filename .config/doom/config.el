(setq user-full-name "Anthony"
      user-mail-address "reversionist@pm.me")

(setq auth-sources '("~/.authinfo.gpg"))

;; Auto-save every 15 seconds (adjust as needed)
(setq auto-save-visited-interval 15)
(auto-save-visited-mode +1)  ; Enable the global minor mode

(setq doom-font (font-spec :family "Hack" :size 16 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Crimson Pro" :size 24))

(setq doom-theme 'doom-1337)
(setq display-line-numbers-type t)
(add-hook 'org-mode-hook #'hl-todo-mode)

;; Add frame borders and window dividers
(modify-all-frames-parameters
 '((right-divider-width . 40)
   (internal-border-width . 40)))

(dolist (face '(window-divider
                window-divider-first-pixel
                window-divider-last-pixel))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))

(set-face-background 'fringe (face-attribute 'default :background))

;; Org styling
(setq
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-agenda-tags-column 0
 org-ellipsis " ")

(global-org-modern-mode)

(custom-theme-set-faces!
 'doom-old-hope
 '(org-level-8 :inherit outline-3 :height 1.0)
 '(org-level-7 :inherit outline-3 :height 1.0)
 '(org-level-6 :inherit outline-3 :height 1.1)
 '(org-level-5 :inherit outline-3 :height 1.2)
 '(org-level-4 :inherit outline-3 :height 1.3)
 '(org-level-3 :inherit outline-3 :height 1.4)
 '(org-level-2 :inherit outline-2 :height 1.5)
 '(org-level-1 :inherit outline-1 :height 1.6)
 '(org-document-title :height 1.8 :bold t :underline nil))

(map! :leader
      :desc "Toggle Olivetti mode" "z o" #'olivetti-mode
      :desc "Comment line"         "-"   #'comment-line)

(after! org
  (map! :leader
        :desc "Org agenda dispatcher" "o a" #'org-agenda
        :desc "Org TODO list"         "o t" (lambda () (interactive) (org-agenda nil "t")))

  (map! :map org-mode-map
        :localleader
        :desc "Open PDF preview"    "v" #'my/org-open-pdf-preview
        :desc "Preview HTML in browser" "h" #'my/org-preview-html))

(after! org
  (defun my/org-insert-footnote-with-cite ()
    "Insert a native footnote (collected at bottom) + Turabian citation inside it."
    (interactive)
    (org-footnote-new)
    (insert " ")
    (insert "[cite/ft:]")
    (backward-char 1)
    (call-interactively #'org-cite-insert))

  (map! :map org-mode-map
        :localleader
        :desc "Insert footnote + Turabian citation" "f" #'my/org-insert-footnote-with-cite))

(map! :leader
      :desc "Toggle Treemacs" "p t" #'+treemacs/toggle)

(after! org-remark
  (map! :map org-mode-map
        :localleader
        "r m" #'org-remark-mark
        "r o" #'org-remark-open
        "r d" #'org-remark-delete
        "r t" #'org-remark-toggle))

(setq org-directory "~/Documents/org/")

(after! org
  (setq org-log-into-drawer t
        org-fontify-whole-comment-block t
        org-footnote-auto-adjust t

        ;; Agenda
        org-agenda-files (directory-files-recursively org-directory "\\.org$")
        org-agenda-window-setup 'current-window))

;; Folded tabs
(after! org
  (setq org-startup-folded 'overview   ; or 'fold
        org-hide-block-startup t))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(after! org-roam
  (setq org-roam-directory "~/Documents/org/roam/")
  (org-roam-db-autosync-mode))

(after! org-roam
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)

          ("b" "book" plain
           "\n* Source\n\n- Author: %^{Author}\n- Title: ${title}\n- Subtitle: %^{Subtitle}\n- Year: %^{Year}\n- Publisher: %^{Publisher}\n- Tags: %^{Tags}\n\n* Overview\n\n%?\n\n* Key Quotes\n\n* Main Arguments\n\n* Key Figures & Organizations\n\n* My Reflections"
           :if-new (file+head "books/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+subtitle: ${subtitle}\n#+filetags: :book:reading:gladio:\n")
           :unnarrowed t))))

(after! projectile
  (setq projectile-project-search-path '(("~/Documents/projects" . 2))))

(after! olivetti
  (defun my/olivetti-setup ()
    "Hide line numbers and use variable-pitch font when Olivetti is enabled."
    (if olivetti-mode
        (progn
          (variable-pitch-mode 1)
          (setq-local display-line-numbers nil)
          (setq-local line-spacing 0.2))
      (variable-pitch-mode -1)
      (setq-local display-line-numbers display-line-numbers-type)))

  (add-hook 'olivetti-mode-hook #'my/olivetti-setup))

(use-package! org-remark
  :config
  (org-remark-global-tracking-mode +1)
  (org-remark-create "yellow"
    :face '(:background "#fff176" :foreground "#212121"))
  (org-remark-create "green"
    :face '(:background "#a5d6a7" :foreground "#1b5e20"))
  (org-remark-create "pink"
    :face '(:background "#f8bbd0" :foreground "#880e4f"))
  (org-remark-create "blue"
    :face '(:background "#81d4fa" :foreground "#01579b")))

(after! citar
  (setq citar-bibliography '("~/Documents/org/references.bib")
        citar-library-paths '("/mnt/data/library/pdfs"
                              "/mnt/data/library/journal articles")
        citar-open-entry-in-zotero t))

(after! oc
  (setq org-cite-global-bibliography '("~/Documents/org/references.bib"))
  (setq org-cite-insert-processor   'citar
        org-cite-follow-processor   'citar
        org-cite-activate-processor 'citar)
  (setq org-cite-export-processors
        '((latex biblatex)
          (t     csl))))

;; Disable Org-Roam citation interception
(after! citar-org-roam
  (citar-org-roam-mode -1))

(after! org
  (setq org-footnote-section "Footnotes")     ; Collect all footnotes under this heading
  (setq org-footnote-define-inline nil)       ; Define footnotes at the end, not inline
  (setq org-footnote-auto-label t))           ; Auto-number footnotes

(after! org
  (setq org-export-in-background t)
  (setq org-latex-pdf-process
        '("pdflatex -interaction nonstopmode -output-directory %o %f"
          "biber %b"
          "pdflatex -interaction nonstopmode -output-directory %o %f"
          "pdflatex -interaction nonstopmode -output-directory %o %f")))

(after! org
  (defun my/org-auto-export-pdf ()
    "Export current org file to PDF on save, preferring export/ subfolder."
    (when (and (eq major-mode 'org-mode)
               (buffer-file-name)
               (not (string-match-p "config\\.org$" (buffer-file-name))))
      (let ((default-directory (or (when (file-exists-p "export")
                                     (expand-file-name "export" default-directory))
                                   default-directory)))
        (org-latex-export-to-pdf t))))

  (add-hook 'after-save-hook #'my/org-auto-export-pdf))

(defun my/org-open-pdf-preview ()
  "Open the PDF export of the current org file in Zathura."
  (interactive)
  (let* ((base-name (file-name-sans-extension (buffer-file-name)))
         (pdf-file (concat base-name ".pdf")))
    (unless (file-exists-p pdf-file)
      (org-latex-export-to-pdf))
    (start-process "zathura" nil "zathura" pdf-file)))

(defun my/org-preview-html ()
  "Export current org file to HTML and open in browser."
  (interactive)
  (let ((html-file (concat (file-name-sans-extension (buffer-file-name)) ".html")))
    (org-html-export-to-html)
    (browse-url (concat "file://" html-file))))

(after! ox-latex
  (add-to-list 'org-latex-classes
    '("mybook"
      "\\documentclass[11pt,twoside]{book}
[NO-DEFAULT-PACKAGES]
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{ebgaramond}
\\usepackage[paperwidth=6in,paperheight=9in,
             top=0.625in,bottom=0.625in,
             inner=0.875in,outer=0.625in]{geometry}
\\usepackage{microtype}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage{ulem}
\\usepackage{amsmath}
\\usepackage{amssymb}
\\usepackage{capt-of}
\\usepackage{hyperref}
\\usepackage{fancyhdr}
\\usepackage{titlesec}
% Chapter title styling
\\titleformat{\\chapter}[display]
  {\\normalfont\\large\\centering}
  {Chapter \\thechapter}
  {1ex}
  {\\Large\\scshape}
\\titlespacing*{\\chapter}{0pt}{2.5in}{1.5em}
% Section / Subsection styling
\\titleformat{\\section}[block]
  {\\normalfont\\large\\centering}
  {}
  {0pt}
  {}
\\titleformat{\\subsection}[block]
  {\\normalfont\\normalsize\\centering\\itshape}
  {}
  {0pt}
  {}
\\titlespacing*{\\section}{0pt}{1.5em}{0.75em}
\\titlespacing*{\\subsection}{0pt}{1em}{0.5em}
% Running header
\\pagestyle{fancy}
\\fancyhf{}
\\renewcommand{\\chaptermark}[1]{\\markboth{#1}{}}
\\fancyhead[C]{\\small\\itshape\\leftmark}
\\fancyfoot[C]{\\thepage}
\\renewcommand{\\headrulewidth}{0pt}
\\fancypagestyle{plain}{%
  \\fancyhf{}%
  \\fancyfoot[C]{\\thepage}%
  \\renewcommand{\\headrulewidth}{0pt}%
}
% Footnote improvements
\\setlength{\\skip\\footins}{1.5em}
\\addtolength{\\footnotesep}{4pt}
\\setcounter{secnumdepth}{0}
[EXTRA]"
      ("\\chapter{%s}"       . "\\chapter*{%s}")
      ("\\section{%s}"       . "\\section*{%s}")
      ("\\subsection{%s}"    . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(after! elfeed
  (setq elfeed-use-curl t)
  (setq elfeed-curl-extra-arguments '("--insecure"))
  (setq elfeed-set-timeout 36000))

(after! elfeed-protocol
  (setq elfeed-protocol-enabled-protocols '(fever))

  (setq elfeed-protocol-feeds
        '(("fever+http://192.168.1.218:82/api/fever.php"
           :api-url "http://192.168.1.218:82/api/fever.php"
           :use-authinfo t)))

  (setq elfeed-protocol-fever-update-unread-only t)   ; critical for FreshRSS

  (elfeed-protocol-enable))

(setq jabber-account-list
      '(("anthony@chat.permanet.xyz"
         (:network-server "permanet.xyz")
         (:connection-type :starttls))))
