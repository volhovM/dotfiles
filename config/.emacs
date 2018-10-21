;; package ---- summary
;;; Commentary:
;;;.emacs settings

;;; Code:
(require 'package)

;(setq package-list '(haskell-mode nyan-mode nlinum flycheck
;                     unicode-fonts org-drill-table sublime-themes
;                     undo-tree idris-mode))

(setq package-archives '(
                         ;("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
;(dolist (package package-list)
;  (unless (package-installed-p package)
;    (package-install package)))


;(defun volhovm-save-some-buffers ()
;(interactive)
;  (save-some-buffers 'no-confirm (lambda ()
;    (cond
;      ((and buffer-file-name (equal buffer-file-name abbrev-file-name)))
;      ((and buffer-file-name (eq major-mode 'latex-mode)))
;      ((and buffer-file-name (eq major-mode 'markdown-mode)))
;      ((and buffer-file-name (eq major-mode 'emacs-lisp-mode)))
;      ((and buffer-file-name (derived-mode-p 'org-mode)))))))
;
;(global-set-key (kbd "C-x s") 'volhovm-save-some-buffers)

;;; EVIL MODE
;; It's built from sources because main repo was failing (just a regular thing...)
(add-to-list 'load-path "~/.emacs.d/evil/")
(require 'evil)
(evil-mode 1)
(setq evil-want-C-i-jump nil)

;;; YASNIPPET
(yas-global-mode 1)

;;; Mode line
;(sml/setup)
;(custom-set-variables
; '(sml/shorten-modes t)
; '(sml/shorten-directory t)
; '(sml/mode-width 30)
; '(sml/name-width 30))
(nyan-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auth-source-save-behavior nil)
 '(browse-url-browser-function (quote browse-url-firefox))
 '(browse-url-firefox-program "firefox")
 '(browse-url-generic-program "firefox")
 '(clean-buffer-list-delay-general 2)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (junio)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" default)))
 '(default-input-method "Agda")
 '(encourage-mode nil)
 '(epg-gpg-program "gpg")
 '(erc-away-nickname "volhovm")
 '(erc-email-userid "volhovm")
 '(erc-nick "volhovm")
 '(flyspell-issue-message-flag nil)
 '(haskell-interactive-popup-errors nil)
 '(haskell-interactive-types-for-show-ambiguous t)
 '(haskell-process-args-stack-ghci (quote ("--ghci-options=-ferror-spans" "--no-load")))
 '(haskell-process-log t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save nil)
 '(inhibit-startup-screen t)
 '(ispell-dictionary "ru")
 '(ispell-program-name "aspell")
 '(ledger-reports
   (quote
    (("debit" "ledger -f finances.dat report Assets:Debit")
     ("adjustments" "ledger -f finances.dat register adjustments")
     ("budgetOnly" "ledger -f finances.dat --budget register spendings --monthly")
     ("budgeted" "ledger -f finances.dat --add-budget --monthly register spendings")
     ("incomes" "ledger -f finances.dat register income")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)"))))
 '(linum-format (quote dynamic))
 '(menu-bar-mode nil)
 '(midnight-mode t nil (midnight))
 '(nyan-animate-nyancat t)
 '(nyan-bar-length 15)
 '(nyan-cat-face-number 1)
 '(nyan-mode t)
 '(nyan-wavy-trail nil)
 '(org-agenda-clock-consistency-checks
   (quote
    (:max-duration "13:00" :min-duration 0 :max-gap "0:02" :gap-ok-around nil :default-face
                   ((:background "DarkRed")
                    (:foreground "white"))
                   :overlap-face nil :gap-face nil :no-end-time-face nil :long-face nil :short-face nil)))
 '(org-agenda-files
   (quote
    ("~/org/study.org" "~/org/work.org" "~/org/private.org")))
 '(org-agenda-span 10)
 '(org-archive-location "archive.org.gpg::* From %s")
 '(org-cycle-include-plain-lists t)
 '(org-habit-completed-glyph 42)
 '(org-habit-following-days 2)
 '(org-habit-graph-column 47)
 '(org-habit-preceding-days 18)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-drill)))
 '(org-startup-truncated nil)
 '(org-trello-current-prefix-keybinding "C-c o")
 '(package-selected-packages
   (quote
    (dumb-jump minimap tuareg ag smart-mode-line yasnippet org package-build shut-up epl git commander f dash s websocket unicode-fonts undo-tree sublime-themes semi rainbow-delimiters python-mode purescript-mode nyan-mode nlinum markdown-mode ledger-mode idris-mode htmlize hindent goto-chg git-rebase-mode git-commit-mode font-lock+ flycheck-purescript flycheck-ledger flycheck-haskell erc-hl-nicks encourage-mode eimp cask auto-complete)))
 '(safe-local-variable-values
   (quote
    ((eval c-set-offset
           (quote access-label)
           (quote -))
     (eval c-set-offset
           (quote substatement-open)
           0)
     (eval c-set-offset
           (quote arglist-cont-nonempty)
           (quote +))
     (eval c-set-offset
           (quote arglist-cont)
           0)
     (eval c-set-offset
           (quote arglist-intro)
           (quote +))
     (eval c-set-offset
           (quote inline-open)
           0)
     (eval c-set-offset
           (quote defun-open)
           0)
     (eval c-set-offset
           (quote innamespace)
           0)
     (indicate-empty-lines . t))))
 '(scroll-bar-mode nil)
 '(select-enable-primary t)
 '(speedbar-after-create-hook
   (quote
    (speedbar-frame-reposition-smartly sr-speedbar-refresh-turn-off)))
 '(speedbar-before-popup-hook (quote (sr-speedbar-refresh-turn-off)))
 '(speedbar-default-position (quote left))
 '(speedbar-mode-hook (quote (sr-speedbar-refresh-turn-off)))
 '(speedbar-show-unknown-files t)
 '(sr-speedbar-default-width 30)
 '(sr-speedbar-right-side nil)
 '(tool-bar-mode nil)
 '(yas-indent-line (quote fixed))
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets")) nil (yasnippet)))


;;; Automatic



;;; IDO MODE
(ido-mode t)

;;; ERC
(require 'erc)
(require 'tls)
(setq erc-hide-list '("JOIN" "PART" "QUIT"))
(setq erc-modules '(
  autojoin
  button
  completion
  fill
  irccontrols
  list
  log
  match
  menu
  move-to-prompt
  netsplit
  networks
  noncommands
  notifications
  readonly
  ring
  stamp
  track))
(erc-update-modules)
;; Notify my when someone mentions my nick.
(require 'erc-match)
(erc-match-mode t)
(defun erc-global-notify (matched-type nick msg)
  (interactive)
  (when (eq matched-type 'current-nick)
    (shell-command
     (concat "notify-send -t 4000 -c \"im.received\" \""
             (car (split-string nick "!"))
             " mentioned your nick\" \""
             msg
             "\""))))
(add-hook 'erc-text-matched-hook 'erc-global-notify)


;; FONTS
;(set-default-font "Terminus-10")
(set-default-font "gohufont-10")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-notice-face ((t (:foreground "dim gray" :weight light))))
 '(linum ((t (:inherit (shadow default) :background "gray19" :foreground "gray40"))))
 '(sbt:error ((t (:foreground "red"))))
 '(whitespace-hspace ((t (:foreground "gray22"))))
 '(whitespace-newline ((t (:foreground "gray19" :weight normal))))
 '(whitespace-space ((t (:foreground "gray20"))))
 '(whitespace-tab ((t (:foreground "dim gray")))))

;; MIDNIGHT
(require 'midnight)

;; ORG DRILL
;; Load org files from git rep (elpa package is broken)
;; Don't forget to `make autoload`
; (add-to-list 'load-path "~/.emacs.d/org/mode/lisp")
; (add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)
(add-to-list 'load-path "~/.emacs.d/org-drill-table/")
(require 'org-drill-table)
(setq org-drill-learn-fraction 0.25)
(setq org-drill-maximum-duration 25)
(setq org-drill-spaced-repetition-algorithm 'sm5)
(setq org-drill-adjust-intervals-for-early-and-late-repetitions-p t)
; (add-hook 'org-ctrl-c-ctrl-c-hook 'org-drill-table-update)

;; ORG MODE
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key "\C-ca" 'org-agenda)
(defun my-org-mode-hook ()
  "Hook for org mode."
  (turn-on-auto-fill)
  (local-set-key (kbd "C-c C-x C-k") 'org-resolve-clocks))
(defun my-org-agenda-mode-hook ()
  "Enables hjkl-bindings for agenda-mode."
  (define-key org-agenda-mode-map "j" 'org-agenda-next-line)
  (define-key org-agenda-mode-map "k" 'org-agenda-previous-line)
  (define-key org-agenda-mode-map "l" 'evil-forward-char)
  (define-key org-agenda-mode-map "h" 'evil-backward-char))
(setq org-agenda-ignore-drawer-properties '(effort appt))
;(run-with-idle-timer 5 nil (lambda () (org-agenda-list) (delete-window))) ; regen agenda on timer
(add-hook 'org-mode-hook 'my-org-mode-hook)
(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-hook)
(setq org-ditaa-jar-path (expand-file-name
          "~/.emacs.d/elpa/contrib/scripts/ditaa.jar"))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (ledger . t)
   (haskell . t)))
(setq org-todo-keywords '((type "TD" "ST" "WT" "|" "DN" "CL")))
(setq org-todo-keyword-faces
 '(
   ("TODO" . "red")
   ("STARTED" . "yellow")
   ("WAITING" . "grey")
   ("DONE" . "green")
   ("CANCELED" . (:foreground "blue" :weight bold))
   ("TD" . "red")
   ("ST" . "yellow")
   ("WT" . "grey")
   ("DN" . "green")
   ("CL" . (:foreground "blue" :weight bold))
   ; ("BUG" . "red")
   ; ("PROGRESS" . "yellow")
   ; ("UNTESTED" . "purple")
   ; ("DROPPED" . (:foreground "blue" :weight bold))
   ; ("FIXED" . "green")
   ("0" . (:background "red" :foreground "black" :weight bold))
   ("X" . "blue")
   ("-" . "blue")
   ("1" . "red3")
   ("2" . "yellow")
   ("3" . "green")
   ("V" . (:background "green" :foreground "black" :weight bold))
   ("OK" . "green")))
(org-clock-persistence-insinuate)
(setq org-time-clocksum-format (quote (:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)))
(setq org-clock-history-length 23)
(setq org-clock-in-resume t)
(setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
(setq org-clock-into-drawer t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-log-done t)
(setq org-clock-out-when-done t)
(setq org-clock-persist-query-resume nil)
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
(setq org-clock-report-include-clocking-task t)
(setq org-duration-format (quote h:mm))
(setq org-file-apps '(
  (auto-mode . emacs)
  ("\\.pdf\\'" . "zathura %s")
  ("\\.djvu\\'" . "zathura %s")
  ("\\.ps\\'" . "zathura %s")
  ("\\.x?html?\\'" . "firefox --new-tab %s")
))
(define-key org-mode-map (kbd "C-c C-x C-s") nil)
; dumping current task info into file
(setq org-clock-mode-line-total 'current)
(defun current-task-to-status ()
  (interactive)
  (with-temp-file "~/.orgtask"
    (if (org-clocking-p)
        (insert (org-clock-get-clock-string))
        (insert "<fc=#ff0000>###### NO ACTIVE CLOCK ######</fc>"))))
(run-with-timer 0 15 'current-task-to-status)

(defun bh/is-project-p ()
  "Any task with a todo keyword subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t)))
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task has-subtask))))

(defun bh/is-task-p ()
  "Any task with a todo keyword and no subtask"
  (save-restriction
    (widen)
    (let ((has-subtask)
          (subtree-end (save-excursion (org-end-of-subtree t))) (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1))) (save-excursion
        (forward-line 1)
        (while (and (not has-subtask)
                    (< (point) subtree-end)
                    (re-search-forward "^\*+ " subtree-end t))
          (when (member (org-get-todo-state) org-todo-keywords-1)
            (setq has-subtask t))))
      (and is-a-task (not has-subtask)))))

(defun bh/clock-in-to-next (kw)
  "Switch a task from TODO to STARTED when clocking in.
Skips capture tasks, projects, and subprojects.
Switch projects and subprojects from STARTED back to TODO"
  (when (not (and (boundp 'org-capture-mode) org-capture-mode))
    (cond
     ((and (member (org-get-todo-state) (list "TD"))
           (bh/is-task-p))
      "ST")
     ((and (member (org-get-todo-state) (list "ST"))
           (bh/is-project-p))
      "TD"))))

(defun my-org-clocktable-indent-string (level)
  (if (= level 1)
      ""
    (let ((str "*"))
      (while (> level 2)
        (setq level (1- level)
              str (concat str "  ")))
      (concat str " "))))
(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)


(require 'ox-latex)
(setq org-latex-listings t)

(setq org-reveal-root "file:///home/volhovm/programs/reveal.js")

(defun org-export-latex-no-toc (depth)
  (when depth
    (format "%% Org-mode is exporting headings to %s levels.\n"
            depth)))
(setq org-export-latex-format-toc-function 'org-export-latex-no-toc)


;;; Originally taken from Bruno Tavernier: http://thread.gmane.org/gmane.emacs.orgmode/31150/focus=31432
;;; but adapted to use latexmk 4.20 or higher.
;(defun my-auto-tex-cmd ()
;  "When exporting from .org with latex, automatically run latex,
;     pdflatex, or xelatex as appropriate, using latexmk."
;  (let ((texcmd)))
;  ;; default command: oldstyle latex via dvi
;  (setq texcmd "latexmk -dvi -pdfps -quiet %f")
;  ;; pdflatex -> .pdf
;  (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
;      (setq texcmd "latexmk -pdf -quiet %f"))
;  ;; xelatex -> .pdf
;  (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;      (setq texcmd "latexmk -pdflatex=xelatex -pdf -quiet %f"))
;  ;; LaTeX compilation command
;  (setq org-latex-to-pdf-process (list texcmd)))
;
;(add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-cmd)
;
;
;;; Specify default packages to be included in every tex file, whether pdflatex or xelatex
;(setq org-latex-packages-alist
;      '(("" "graphicx" t)
;            ("" "longtable" nil)
;            ("" "float" nil)))
;
;(defun my-auto-tex-parameters ()
;      "Automatically select the tex packages to include."
;      ;; default packages for ordinary latex or pdflatex export
;      (setq org-latex-default-packages-alist
;            '(("AUTO" "inputenc" t)
;              ("T1"   "fontenc"   t)
;              (""     "fixltx2e"  nil)
;              (""     "wrapfig"   nil)
;              (""     "soul"      t)
;              (""     "textcomp"  t)
;              (""     "marvosym"  t)
;              (""     "wasysym"   t)
;              (""     "latexsym"  t)
;              (""     "amssymb"   t)
;              (""     "hyperref"  nil)))
;
;      ;; Packages to include when xelatex is used
;      (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;          (setq org-latex-default-packages-alist
;                '(("" "fontspec" t)
;                  ("" "xunicode" t)
;                  ("" "url" t)
;                  ("" "rotating" t)
;                  ("american" "babel" t)
;                  ("babel" "csquotes" t)
;                  ("" "soul" t)
;                  ("xetex" "hyperref" nil)
;                  )))
;
;      (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;          (setq org-latex-classes
;                (cons '("article"
;                        "\\documentclass[11pt,article,oneside]{memoir}"
;                        ("\\section{%s}" . "\\section*{%s}")
;                        ("\\subsection{%s}" . "\\subsection*{%s}")
;                        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;                        ("\\paragraph{%s}" . "\\paragraph*{%s}")
;                        ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
;                      org-latex-classes))))
;
;(add-hook 'org-export-latex-after-initial-vars-hook 'my-auto-tex-parameters)



;;; HASKELL
(add-to-list 'load-path "~/.emacs.d/haskell-mode-neongreen/")
(require 'haskell-mode-autoloads)
;(add-to-list 'load-path "~/code/dumb-jump/")
(require 'dumb-jump)
(setq dumb-jump-mode t)
(setq dumb-jump-force-searcher 'ag)
(setq dumb-jump-fallback-search nil)
(add-to-list 'Info-default-directory-list "~/.emacs.d/haskell-mode-neongreen/")
(require 'haskell-process)
(remove-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'volhovm-haskell-mode-hook)
(defun volhovm-haskell-mode-hook ()
  "Func for haskell-mode hook."
  (local-set-key (kbd "C-c C-g") 'haskell-session-change-target)
  (interactive-haskell-mode)
; (intero-mode)
  (whitespace-mode)
  (haskell-auto-insert-module-template)
  (volhovm-haskell-style)
  (hindent-mode)
  )
(require 'hindent)
(setq-default hindent-style "johan-tibell")
(defun volhovm-haskell-style ()
  "Style properties for haskell."
  (interactive)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4))
; ghc 8.2 relevant
(setq haskell-process-args-ghci
      '("-ferror-spans" "-fshow-loaded-modules"))
(setq haskell-process-args-cabal-repl
      '("--ghc-options=-ferror-spans -fshow-loaded-modules"))
(setq haskell-process-args-stack-ghci
      '("--ghci-options=-ferror-spans -fshow-loaded-modules"
        "--no-build" "--no-load"))
(setq haskell-process-args-cabal-new-repl
      '("--ghc-options=-ferror-spans -fshow-loaded-modules"))


;;; WHITESPACE
(require 'whitespace)
(setq whitespace-line-column 100)
(add-hook 'c++-mode-hook 'whitespace-mode)
(add-hook 'tuareg-mode-hook 'whitespace-mode)
;(add-hook 'scala-mode 'whitespace-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)

;;; SPEEDBAR
(set 'speedbar-update-flag nil)

;;; C
(add-hook 'makefile-mode-hook (lambda()
                                (whitespace-toggle-options '(tabs))))
;(add-hook 'c-mode-hook 'linum-mode)
(add-hook 'c-mode-hook 'whitespace-mode)

;;; C++
(require 'cc-mode)
(global-set-key (kbd "<f11>") 'recompile) ;; kind of cool
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0)
 ; (linum-mode) ;; lags a lot because of it
  )
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(setq c-default-style "gnu"
          c-basic-offset 4)
(require 'font-lock)

(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))

(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
         'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
         'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
         'font-lock-comment-face)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(add-hook 'c++-mode-hook
      '(lambda()
        (font-lock-add-keywords
         nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; add the new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT
           ("\\<[A-Z]+[A-Z_]+\\>" . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; user-types (customize!)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(t\\|type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
           ))
        ))

;;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
;(add-to-list 'ac-modes 'haskell-mode)

;;; STUFF
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)
;;(put 'set-goal-column 'disabled nil)
(setq-default indent-tabs-mode nil)
;;(setq tab-stop-list (number-sequence 2 60 2))

(add-to-list 'load-path "~/.emacs.d/agda-input/")
(require 'agda-input)

;; List of additional LaTeX packages
;; (add-to-list 'org-export-latex-packages-alist '("" "cmap" t))
;; (add-to-list 'org-export-latex-packages-alist '("english,russian" "babel" t))

;;; DISABLING MOUSE
;;(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
;;             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
;;             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
;;             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
;;  (global-unset-key k))

;;;;; ASM86
;;(setq make-backup-files nil)
;;(autoload 'asm86-mode "~/.emacs.d/asm86-mode.el")
;;(setq auto-mode-alist
;;      (append '(("\\.asm\\'" . asm86-mode) ("\\.inc\\'" . asm86-mode))
;;              auto-mode-alist))
;;(add-hook 'asm86-mode-hook 'turn-on-font-lock)
;;(add-hook 'asm-mode-hook '(lambda () (linum-mode) ))

;;; Encrypting
(require 'epa-file)
(epa-file-enable)
(setq backup-directory-alist '(("." . "~/.emacs.d/.saves"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;;; Flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode)
;(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(eval-after-load 'flycheck
;  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

;;; Java
(add-hook 'java-mode-hook '(lambda () (whitespace-mode)))


;;;; Scala
;(unless (package-installed-p 'scala-mode2)
;  (package-refresh-contents) (package-install 'scala-mode2))
;(unless (package-installed-p 'sbt-mode)
;  (package-refresh-contents) (package-install 'sbt-mode))
;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;(add-hook 'sbt-mode-hook '(lambda ()
;                            (setq compilation-skip-threshold 1)
;                            (local-set-key (kbd "C-a") 'comint-bol)
;                            (local-set-key (kbd "M-RET") 'comint-accumulate)
;                            ))
;(add-hook 'scala-mode-hook '(lambda ()
;                              (local-set-key (kbd "<C-f7>") 'sbt-find-definitions)
;                              (local-set-key (kbd "C-c C-l") 'sbt-run-previous-command)
;                              (local-set-key (kbd "RET") 'newline-and-indent)
;                              (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)
;                              (whitespace-mode)
;                              (show-paren-mode)
;))

;;; Proof General
(load-file "~/.emacs.d/ProofGeneral/generic/proof-site.el")
(setq coq-prog-name "/run/current-system/sw/bin/coqtop")
(setq proof-splash-enable nil)

;;; Eshell
(require 'ansi-color)
(require 'eshell)
(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))
(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)

;;; Nix support
(autoload 'nix-mode "nix-mode" "Major mode for editing Nix expressions." t)
(push '("\\.nix\\'" . nix-mode) auto-mode-alist)
(push '("\\.nix\\.in\\'" . nix-mode) auto-mode-alist)

;;; HACK
(fset 'yes-or-no-p 'y-or-n-p)

;;; Aspell
(require 'ispell)
(setq ispell-list-command "--list")
(setq ispell-extra-args '("--sug-mode=fast"))
(setq ispell-silently-savep t)
(setq flyspell-persistent-highlight t)
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

;;; AG search (silver-searcher)
(global-set-key (kbd "<f7>") 'ag-project)
(global-set-key (kbd "C-<f7>") 'ag)
(setq ag-reuse-buffers 't)
(setq ag-reuse-window 't)

;;; Cryptoverif
(add-to-list 'load-path "~/.emacs.d/cryptoverif/")
(setq auto-mode-alist
      (cons '("\\.cv[l]?$" . cryptoverif-mode)
      (cons '("\\.ocv[l]?$" . cryptoverifo-mode) auto-mode-alist)))
(autoload 'cryptoverif-mode
    "cryptoverif" "Major mode for editing CryptoVerif code." t)
(autoload 'cryptoverifo-mode
    "cryptoverif" "Major mode for editing CryptoVerif code." t)

(provide '.emacs)
;;; .emacs ENDS HERE

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
