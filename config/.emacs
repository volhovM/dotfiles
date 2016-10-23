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

;;; IDO MODE
(ido-mode t)
(nyan-mode t)

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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus" :foundry "unknown" :slant normal :weight normal :height 95 :width normal))))
 '(erc-notice-face ((t (:foreground "dim gray" :weight light))))
 '(linum ((t (:inherit (shadow default) :background "gray19" :foreground "gray40"))))
 '(sbt:error ((t (:foreground "red"))))
 '(whitespace-hspace ((t (:foreground "gray22"))))
 '(whitespace-newline ((t (:foreground "gray19" :weight normal))))
 '(whitespace-space ((t (:foreground "gray20"))))
 '(whitespace-tab ((t (:foreground "dim gray")))))

;; MIDNIGHT
(require 'midnight)

;; ORG MODE
;; Load org files from git rep (elpa package is broken)
;; Don't forget to `make autoload`
; (add-to-list 'load-path "~/.emacs.d/org/mode/lisp")
; (add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)
; (add-to-list 'load-path "~/.emacs.d/org-drill-table/")
(require 'org-drill-table)
(setq org-drill-learn-fraction 0.35)
; (add-hook 'org-ctrl-c-ctrl-c-hook 'org-drill-table-update)
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
(add-hook 'org-mode-hook 'my-org-mode-hook)
(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-hook)
(setq org-ditaa-jar-path (expand-file-name
          "~/.emacs.d/elpa/contrib/scripts/ditaa.jar"))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (ledger . t)
   (haskell . t)))
(setq org-todo-keywords '((type "TODO" "STARTED" "WAITING" "|" "DONE" "CANCELED")))
(setq org-todo-keyword-faces
 '(("TODO" . "red")
   ("STARTED" . "yellow")
   ("WAITING" . "grey")
   ("CANCELED" . (:foreground "blue" :weight bold))
   ("DONE" . "green")
   ("BUG" . "red")
   ("PROGRESS" . "yellow")
   ("UNTESTED" . "purple")
   ("DROPPED" . (:foreground "blue" :weight bold))
   ("FIXED" . "green")
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
(define-key org-mode-map (kbd "C-c C-x C-s") nil)

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
     ((and (member (org-get-todo-state) (list "TODO"))
           (bh/is-task-p))
      "STARTED")
     ((and (member (org-get-todo-state) (list "STARTED"))
           (bh/is-project-p))
      "TODO"))))

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
;(require 'haskell-interactive-mode)
(require 'haskell-process)
(add-hook 'haskell-mode-hook 'volhovm-haskell-mode-hook)
(defun volhovm-haskell-mode-hook ()
  "Func for haskell-mode hook."
  (interactive-haskell-mode)
;  (toggle-input-method)
  (whitespace-mode)
;  (intero-mode)
;  (turn-on-haskell-indentation)
  (volhovm-haskell-style)
  (hindent-mode))

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
    ("9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" default)))
 '(default-input-method "Agda")
 '(encourage-mode nil)
 '(erc-away-nickname "volhovm")
 '(erc-email-userid "volhovm")
 '(erc-nick "volhovm")
 '(flycheck-ghc-args (quote ("-v")))
 '(flycheck-ghc-stack-use-nix t)
 '(flycheck-haskell-runghc-command
   (quote
    ("stack" "--nix" "--verbosity" "silent" "runghc" "--")))
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-args-stack-ghci (quote ("--nix" "--ghc-options=-ferror-spans")))
 '(haskell-process-log t)
 '(haskell-process-type (quote auto))
 '(haskell-stylish-on-save t)
 '(inhibit-startup-screen t)
 '(ispell-program-name "aspell")
 '(ledger-reports
   (quote
    (("debit" "ledger -f finances.dat report Assets:Debit")
     ("adjustments" "ledger -f finances.dat register adjustments")
     ("budgetOnly" "ledger -f finances.dat --budget register spendings --monthly")
     ("budgeted" "ledger -f finances.dat --add-budget --monthly register spendings")
     ("incomes" "ledger -f finances.dat register income")
     ("reportlol" "ledger -f finances.dat register")
     ("Testrep" "ledger report")
     ("report" "ledger ")
     ("test" "ledger ")
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
    (:max-duration "13:00" :min-duration 0 :max-gap "0:04" :gap-ok-around nil :default-face
                   ((:background "DarkRed")
                    (:foreground "white"))
                   :overlap-face nil :gap-face nil :no-end-time-face nil :long-face nil :short-face nil)))
 '(org-agenda-custom-commands
   (quote
    (("b" "All study-related TODO's"
      ((agenda ""
               ((org-agenda-overriding-header "")))
       (todo "TODO" nil)
       (todo "STARTED" nil)
       (todo "WAITING" nil)
       (todo "DONE" nil))
      ((org-agenda-files
        (quote
         ("~/org/study.org")))
       (org-agenda-span 5))))))
 '(org-agenda-files
   (quote
    ("~/org/work.org" "~/org/private.org.gpg" "~/org/study.org")))
 '(org-agenda-span 10)
 '(org-archive-location "archive.org.gpg::* From %s")
 '(org-cycle-include-plain-lists t)
 '(org-drill-optimal-factor-matrix
   (quote
    ((6
      (1.6800000000000002 . 1.619))
     (5
      (1.9 . 1.9)
      (2.0 . 1.947)
      (1.94 . 1.94)
      (1.44 . 1.618)
      (1.86 . 1.743)
      (1.76 . 1.701)
      (1.48 . 1.712)
      (1.7200000000000002 . 1.66)
      (1.3399999999999999 . 1.579)
      (1.66 . 1.66)
      (1.58 . 1.516))
     (4
      (2.6 . 2.561)
      (2.62 . 2.495)
      (2.66 . 2.538)
      (2.56 . 2.477)
      (2.46 . 2.418)
      (1.9599999999999997 . 2.168)
      (2.0999999999999996 . 2.261)
      (2.52 . 2.435)
      (2.38 . 2.336)
      (2.24 . 2.356)
      (1.9999999999999998 . 2.206)
      (2.32 . 2.32)
      (2.42 . 2.377)
      (1.86 . 2.027)
      (2.14 . 2.037)
      (1.72 . 1.891)
      (1.94 . 1.94)
      (2.2800000000000002 . 2.183)
      (1.6199999999999999 . 1.845)
      (2.18 . 2.131)
      (2.04 . 1.988)
      (1.76 . 1.978)
      (1.9000000000000001 . 1.938)
      (1.62 . 1.557)
      (1.48 . 1.414)
      (1.66 . 1.66)
      (1.9400000000000002 . 2.029)
      (1.8 . 1.892)
      (1.6600000000000001 . 1.756))
     (3
      (2.4399999999999995 . 2.625)
      (2.76 . 2.76)
      (2.86 . 2.828)
      (2.8200000000000003 . 2.663)
      (2.6799999999999997 . 2.795)
      (1.9600000000000002 . 2.162)
      (2.58 . 2.58)
      (3.1 . 3.011)
      (2.72 . 2.599)
      (3.0 . 2.939)
      (2.8 . 2.8)
      (2.4799999999999995 . 2.663)
      (2.3400000000000003 . 2.494)
      (2.34 . 2.494)
      (2.48 . 2.556)
      (2.7600000000000002 . 2.686)
      (2.0599999999999996 . 2.373)
      (2.2 . 2.355)
      (2.62 . 2.537)
      (2.24 . 2.434)
      (1.9599999999999997 . 2.205)
      (2.9 . 2.869)
      (2.28 . 2.319)
      (2.0999999999999996 . 2.299)
      (2.38 . 2.495)
      (2.8000000000000003 . 2.688)
      (2.7 . 2.624)
      (2.66 . 2.622)
      (2.5 . 2.5)
      (2.52 . 2.476)
      (2.6 . 2.561)
      (1.72 . 2.134)
      (2.14 . 2.299)
      (2.46 . 2.498)
      (1.86 . 2.11)
      (2.1399999999999997 . 2.262)
      (2.56 . 2.559)
      (2.36 . 2.36)
      (2.32 . 2.359)
      (1.9999999999999998 . 2.243)
      (2.42 . 2.417)
      (1.6199999999999999 . 1.845)
      (1.54 . 2.007)
      (1.94 . 1.94)
      (2.3200000000000003 . 2.274)
      (2.18 . 2.219)
      (2.08 . 2.166)
      (1.52 . 1.619)
      (1.3800000000000001 . 1.483)
      (1.9400000000000002 . 2.113)
      (1.8 . 1.892)
      (1.6600000000000001 . 1.846)
      (2.2800000000000002 . 2.436)
      (1.76 . 2.06)
      (1.9000000000000001 . 2.111)
      (2.1799999999999997 . 2.378)
      (2.04 . 2.244))
     (2
      (3.1 . 3.011)
      (2.34 . 2.494)
      (2.1 . 2.049)
      (2.92 . 2.889)
      (2.48 . 2.556)
      (1.9600000000000002 . 2.162)
      (2.4399999999999995 . 2.625)
      (2.86 . 2.828)
      (2.0599999999999996 . 2.373)
      (1.5799999999999998 . 1.807)
      (2.4000000000000004 . 2.553)
      (1.9599999999999997 . 2.168)
      (1.44 . 1.959)
      (2.58 . 2.728)
      (2.3 . 2.493)
      (2.7600000000000002 . 2.687)
      (2.72 . 2.685)
      (2.8 . 2.8)
      (2.2 . 2.433)
      (2.62 . 2.621)
      (3.0 . 2.939)
      (2.24 . 2.434)
      (2.4799999999999995 . 2.663)
      (2.16 . 2.431)
      (2.9 . 2.869)
      (2.52 . 2.558)
      (2.38 . 2.495)
      (2.14 . 2.376)
      (2.66 . 2.623)
      (2.06 . 2.373)
      (2.8000000000000003 . 2.688)
      (1.86 . 2.11)
      (1.9999999999999998 . 2.206)
      (2.32 . 2.32)
      (2.1399999999999997 . 2.377)
      (1.6199999999999999 . 1.845)
      (2.2800000000000002 . 2.436)
      (2.42 . 2.497)
      (2.7 . 2.624)
      (2.56 . 2.56)
      (2.18 . 2.219)
      (2.46 . 2.499)
      (2.3200000000000003 . 2.274)
      (1.6800000000000002 . 2.057)
      (2.22 . 2.22)
      (1.9000000000000001 . 2.111)
      (1.6600000000000001 . 1.846)
      (1.52 . 1.619)
      (1.8 . 1.892)
      (1.76 . 2.06)
      (1.9400000000000002 . 2.113)
      (2.1799999999999997 . 2.378)
      (2.08 . 2.166)
      (2.6 . 2.561)
      (1.8199999999999998 . 2.26)
      (2.04 . 2.319)
      (2.2199999999999998 . 2.379)
      (2.5 . 2.5)
      (2.36 . 2.439)
      (1.96 . 2.316))
     (1
      (3.1 . 4.301)
      (2.86 . 4.098)
      (2.8 . 4.0)
      (2.4399999999999995 . 3.804)
      (2.0 . 4.098)
      (2.8200000000000003 . 4.514)
      (3.0 . 4.198)
      (2.6599999999999997 . 3.902)
      (2.4799999999999995 . 3.804)
      (2.7600000000000002 . 4.299)
      (2.34 . 3.99)
      (1.86 . 4.198)
      (2.38 . 3.992)
      (2.72 . 4.406)
      (2.24 . 3.895)
      (2.66 . 4.196)
      (2.48 . 4.198)
      (2.62 . 4.301)
      (2.28 . 4.0)
      (2.0999999999999996 . 3.897)
      (2.52 . 4.198)
      (2.9 . 4.098)
      (2.1399999999999997 . 3.802)
      (2.14 . 4.198)
      (2.06 . 3.797)
      (2.8000000000000003 . 4.301)
      (1.9999999999999998 . 3.804)
      (2.2800000000000002 . 3.897)
      (2.42 . 4.098)
      (2.56 . 4.096)
      (2.7 . 4.198)
      (2.18 . 3.998)
      (1.6800000000000002 . 3.706)
      (2.3200000000000003 . 4.098)
      (2.46 . 3.998)
      (2.22 . 4.0)
      (1.76 . 4.098)
      (1.9400000000000002 . 3.806)
      (2.08 . 3.902)
      (1.9000000000000001 . 4.098)
      (1.8199999999999998 . 3.615)
      (2.6 . 4.098)
      (2.04 . 4.098)
      (2.2199999999999998 . 3.806)
      (1.96 . 3.706)
      (2.5 . 4.0)
      (2.36 . 3.902)
      (2.1799999999999997 . 3.804)
      (1.7000000000000002 . 3.608)))))
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
    (org package-build shut-up epl git commander f dash s websocket unicode-fonts undo-tree sublime-themes semi rainbow-delimiters python-mode purescript-mode nyan-mode nlinum markdown-mode ledger-mode intero idris-mode htmlize hindent goto-chg git-rebase-mode git-commit-mode ghc font-lock+ flycheck-purescript flycheck-ledger flycheck-haskell erc-hl-nicks encourage-mode eimp cask auto-complete)))
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
 '(tool-bar-mode nil))

(customize-set-variable 'haskell-stylish-on-save t)

(require 'hindent)
(setq-default hindent-style "johan-tibell")

(defun volhovm-haskell-style ()
  "Style properties for haskell."
  (interactive)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4))
; ghc-mod

;(custom-set-variables '(haskell-process-type 'stack-ghci))
;(autoload 'ghc-init "ghc" nil t)
;(autoload 'ghc-debug "ghc" nil t)
;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))


;;; WHITESPACE
(require 'whitespace)
(setq whitespace-line-column 100)
(add-hook 'c++-mode-hook 'whitespace-mode)
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
        ) t)



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


(add-hook 'asm-mode-hook '(lambda ()
                            (linum-mode)
                            ))

;;; Encrypting
(require 'epa-file)
(epa-file-enable)
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

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
(setq coq-prog-name "/nix/var/nix/profiles/system/sw/bin/coqtop")
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

(provide '.emacs)
;;; .emacs ENDS HERE
