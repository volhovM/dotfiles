; package ---- summary
;; Commentary:
;;.emacs settings

(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-level 4)
 '(ansi-color-faces-vector
   [default bold default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auth-source-save-behavior nil)
 '(browse-url-browser-function 'browse-url-firefox)
 '(browse-url-firefox-program "firefox")
 '(browse-url-generic-program "firefox")
 '(clean-buffer-list-delay-general 2)
 '(column-number-mode t)
 '(compilation-scroll-output t)
 '(custom-safe-themes
   '("72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "46fd293ff6e2f6b74a5edf1063c32f2a758ec24a5f63d13b07a20255c074d399" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "a233249cc6f90098e13e555f5f5bf6f8461563a8043c7502fb0474be02affeea" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" default))
 '(default-input-method "Agda")
 '(encourage-mode nil)
 '(epg-gpg-program "gpg")
 '(evil-undo-system 'undo-tree)
 '(font-use-system-font nil)
 '(haskell-interactive-popup-errors nil)
 '(haskell-interactive-types-for-show-ambiguous t)
 '(haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans" "--no-load"))
 '(haskell-process-log t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save nil)
 '(helm-org-rifle-input-idle-delay 0.1)
 '(inhibit-startup-screen t)
 '(ledger-reports
   '(("debit" "ledger -f finances.dat report Assets:Debit")
     ("adjustments" "ledger -f finances.dat register adjustments")
     ("budgetOnly" "ledger -f finances.dat --budget register spendings --monthly")
     ("budgeted" "ledger -f finances.dat --add-budget --monthly register spendings")
     ("incomes" "ledger -f finances.dat register income")
     ("bal" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)")))
 '(linum-format 'dynamic)
 '(menu-bar-mode nil)
 '(midnight-mode t nil (midnight))
 '(nyan-animate-nyancat t)
 '(nyan-bar-length 15)
 '(nyan-cat-face-number 1)
 '(nyan-mode t)
 '(nyan-wavy-trail nil)
 '(olivetti-body-width 90)
 '(org-agenda-clock-consistency-checks
   '(:max-duration "13:00" :min-duration 0 :max-gap "0:02" :gap-ok-around nil :default-face
                   ((:background "DarkRed")
                    (:foreground "white"))
                   :overlap-face nil :gap-face nil :no-end-time-face nil :long-face nil :short-face nil))
 '(org-agenda-deadline-leaders '("" "%-2d d:" "%2d d. ago:"))
 '(org-agenda-files
   '("~/org/study.org" "~/org/private.org" "~/org/reviews.org" "~/org/notes.org.gpg" "~/org/technical.org"))
 '(org-agenda-ignore-properties '(effort appt))
 '(org-agenda-prefix-format
   '((agenda . " %i %-10:c% t% s")
     (todo . " %i %-10:c")
     (tags . " %i %-10:c")
     (search . " %i %-10:c")))
 '(org-agenda-scheduled-leaders '("" "%-2dx: "))
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-span 10)
 '(org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     "" "------------------------------"))
 '(org-agenda-use-time-grid t)
 '(org-archive-location "archive.org.gpg::* From %s")
 '(org-capture-templates
   '(("h" "Health" entry
      (file+olp "~/org/notes.org.gpg" "Stats" "Health" "Health log")
      "** HN%<%Y-%m-%d>
#+DATE: %<%Y-%m-%d>
%?" :jump-to-captured t)
     ("f" "Fleeting" entry
      (file+headline "~/org/notes.org.gpg" "Fleeting")
      "** N%<%Y-%m-%d>
#+DATE: %<%Y-%m-%d>
%?" :prepend t :jump-to-captured t)
     ("r" "Research" entry
      (file "~/org/technical.org")
      "
* RN%<%Y-%m-%d>
#+DATE: %<%Y-%m-%d>
%?" :prepend t :jump-to-captured t)
     ("p" "Project" entry
      (file+headline "~/org/notes.org.gpg" "Projects")
      "** %?
#+DATE: %<%Y-%m-%d>
" :prepend t :jump-to-captured t)))
 '(org-catch-invisible-edits 'show-and-error)
 '(org-clock-auto-clock-resolution 'when-no-clock-is-running)
 '(org-clock-history-length 23)
 '(org-clock-in-resume t)
 '(org-clock-in-switch-to-state 'bh/clock-in-to-next)
 '(org-clock-into-drawer t)
 '(org-clock-mode-line-total 'current)
 '(org-clock-out-remove-zero-time-clocks t)
 '(org-clock-out-when-done t)
 '(org-clock-persist-query-resume nil)
 '(org-clock-report-include-clocking-task t)
 '(org-ctrl-k-protect-subtree t)
 '(org-cycle-include-plain-lists t)
 '(org-ditaa-jar-path
   (expand-file-name "~/.emacs.d/elpa/contrib/scripts/ditaa.jar"))
 '(org-drawers '("PROPERTIES" "LOGBOOK"))
 '(org-duration-format 'h:mm)
 '(org-extend-today-until 3)
 '(org-file-apps
   '((auto-mode . emacs)
     (directory . "urxvt -cd %s")
     ("\\.pdf\\'" . "zathura %s")
     ("\\.xopp\\'" . "xournalpp %s")
     ("\\.djvu\\'" . "zathura %s")
     ("\\.ps\\'" . "zathura %s")
     ("\\.x?html?\\'" . "firefox --new-tab %s")))
 '(org-habit-completed-glyph 42)
 '(org-habit-following-days 2)
 '(org-habit-graph-column 47)
 '(org-habit-preceding-days 18)
 '(org-habit-show-all-today nil)
 '(org-latex-packages-alist
   '(("lambda,adversary,operators,asymptotics,keys,oracles,primitives" "cryptocode" t)))
 '(org-log-done t)
 '(org-log-state-notes-insert-after-drawers t)
 '(org-modules '(org-habit org-drill))
 '(org-pretty-entities t)
 '(org-preview-latex-image-directory "~/.emacs.d/ltximg/")
 '(org-startup-folded t)
 '(org-startup-truncated nil)
 '(org-tags-column -80)
 '(org-time-clocksum-format
   '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
 '(org-todo-keyword-faces
   '(("TD" . "red")
     ("ST" . "orange")
     ("WT" . "grey")
     ("DN" . "green3")
     ("CL" :foreground "blue" :weight bold)
     ("0" :background "red" :foreground "black" :weight bold)
     ("X" . "blue")
     ("-" . "blue")
     ("1" . "red3")
     ("2" . "yellow")
     ("3" . "green")
     ("V" :background "green" :foreground "black" :weight bold)
     ("OK" . "green")))
 '(org-todo-keywords '((type "TD" "ST" "WT" "|" "DN" "CL")))
 '(org-trello-current-prefix-keybinding "C-c o")
 '(org-use-effective-time t)
 '(package-selected-packages
   '(helm-org-ql minimap helm-org-rifle ox-hugo org-journal auctex quelpa-use-package helm visual-fill-column adaptive-wrap evil-better-visual-line olivetti ansi latex-preview-pane dired-single evil dumb-jump ag smart-mode-line yasnippet org package-build epl git commander dash s unicode-fonts undo-tree sublime-themes rainbow-delimiters python-mode nyan-mode nlinum ledger-mode htmlize hindent goto-chg flycheck-ledger flycheck-haskell encourage-mode eimp cask auto-complete))
 '(safe-local-variable-values
   '((eval run-with-idle-timer 5 t #'volhovm-save-study)
     (eval load-file "formatting.el")
     (TeX-master . "../")
     (TeX-master . "../weakse")
     (eval c-set-offset 'access-label '-)
     (eval c-set-offset 'substatement-open 0)
     (eval c-set-offset 'arglist-cont-nonempty '+)
     (eval c-set-offset 'arglist-cont 0)
     (eval c-set-offset 'arglist-intro '+)
     (eval c-set-offset 'inline-open 0)
     (eval c-set-offset 'defun-open 0)
     (eval c-set-offset 'innamespace 0)
     (indicate-empty-lines . t)))
 '(scroll-bar-mode nil)
 '(select-enable-primary t)
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows 100)
 '(undo-outer-limit 20000000)
 '(undo-strong-limit 15000000)
 '(whitespace-style
   '(face trailing tabs spaces lines newline empty indentation::space space-after-tab space-before-tab space-mark tab-mark newline-mark))
 '(word-wrap t)
 '(yas-indent-line 'fixed)
 '(yas-snippet-dirs '("~/.emacs.d/snippets")))

; activate all the packages, refresh, install missing
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(global-undo-tree-mode 1)

;;;****************************************************************************************
;; EXPERIMENTING WITH WORD WRAPPING
;;;****************************************************************************************

; See my comment in https://www.emacswiki.org/emacs/LineWrap
(setq word-wrap-by-category t)
(modify-category-entry '(32 . 32) ?|)
(modify-category-entry '(36 . 38) ?|)
(modify-category-entry '(47 . 47) ?|)

;;;****************************************************************************************
;;; DISABLE TABS
;;;****************************************************************************************

(setq-default indent-tabs-mode nil)

;;;****************************************************************************************
;;; THEMES AND FACES
;;;****************************************************************************************

;(require 'sublime-themes)
;(load-theme 'junio t)
;(setq custom--inhibit-theme-enable nil)

(with-eval-after-load "junio-theme"
  (custom-theme-set-faces
   'junio
   '(org-drawer ((t (:foreground "gray30"))))
   '(whitespace-hspace ((t (:foreground "gray22"))))
   '(whitespace-newline ((t (:foreground "gray19" :weight normal))))
   '(whitespace-space ((t (:foreground "gray20"))))
   '(whitespace-tab ((t (:foreground "gray25"))))
   ))

(with-eval-after-load "tango-theme"
  (custom-theme-set-faces
   'tango
   '(org-table ((t (:foreground "gray40"))))
   '(org-drawer ((t (:foreground "gray70"))))
   '(whitespace-hspace ((t (:foreground "gray22"))))
   '(whitespace-newline ((t (:foreground "gray80" :weight normal))))
   '(whitespace-space ((t (:foreground "gray88"))))
   '(whitespace-tab ((t (:foreground "gray88"))))
   ))

;(set-default-font "Terminus-10")
;(set-default-font "Fira Code-10")
;(set-default-font "gohufont-10") ; it looks nicer, but doesn't scale (11pk, 14px)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(fstar-subp-overlay-busy-face ((t (:background "#2b0819"))))
 '(fstar-subp-overlay-pending-face ((t (:background "#2b0819"))))
 '(fstar-subp-overlay-processed-face ((t (:background "#071c1c"))))
 '(org-agenda-date ((t (:inherit org-agenda-structure :underline "gray23"))))
 '(org-column ((t (:background "#260826" :strike-through nil :underline nil :slant normal :weight normal))))
 '(org-indent ((t (:inherit (whitespace-space))))))

;(setq org-indent-boundary-char 46)
(setq org-indent-boundary-char 124)

; Taken from here: https://emacs.stackexchange.com/questions/24088/make-a-function-to-toggle-themes
(defvar theme-dark 'junio)
(defvar theme-light 'tango)
(defvar current-theme 'junio)
(load-theme current-theme)

;; disable other themes before loading new one
(defadvice load-theme (before theme-dont-propagate activate)
  "Disable theme before loading new one."
  (mapc #'disable-theme custom-enabled-themes))

(defun next-theme (theme)
  (if (eq theme 'default)
      (disable-theme current-theme)
    (progn
      (load-theme theme t)))
  (setq current-theme theme))

(defun toggle-theme ()
  (interactive)
  (cond ((eq current-theme theme-dark) (next-theme theme-light))
        ((eq current-theme theme-light) (next-theme theme-dark))))

(global-set-key (kbd "<f6>") 'toggle-theme)

; I don't know why this is needed but otherwise the original theme colours are broken
(toggle-theme)
(toggle-theme)


;;;****************************************************************************************
;;; EVIL MODE
;;;****************************************************************************************

;(setq evil-respect-visual-line-mode t)
(require 'evil)
(evil-mode t)
(setq evil-want-C-i-jump nil)
; jump-back is useless, I use it to open org-links instead
(eval-after-load "evil-maps" (lambda ()
  (define-key evil-motion-state-map "\C-o" nil)
  (define-key evil-motion-state-map "\C-z" nil)))

; Something here breaks undo tree..

(define-key evil-motion-state-map   (kbd "<remap> <evil-next-line>")     #'evil-next-visual-line)
(define-key evil-motion-state-map   (kbd "<remap> <evil-previous-line>") #'evil-previous-visual-line)
(define-key evil-operator-state-map (kbd "<remap> <evil-next-line>")     #'evil-next-line)
(define-key evil-operator-state-map (kbd "<remap> <evil-previous-line>") #'evil-previous-line)

; TODO this work universally, but probably should only affect org-mode
(define-key evil-motion-state-map "$" 'evil-end-of-visual-line)
(define-key evil-motion-state-map "0" 'evil-beginning-of-visual-line)
(define-key evil-visual-state-map "$" 'evil-end-of-visual-line)
(define-key evil-visual-state-map "0" 'evil-beginning-of-visual-line)


;(define-key evil-normal-state-map "j" 'evil-next-visual-line)
;(define-key evil-normal-state-map "k" 'evil-previous-visual-line)

;(define-key evil-motion-state-map "j" 'evil-next-visual-line)
;(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;;; Also in visual mode (disabled, since anyway visual selection ignores visual-line-mode)
;(define-key evil-visual-state-map "j" 'evil-next-visual-line)
;(define-key evil-visual-state-map "k" 'evil-previous-visual-line)



;;;****************************************************************************************
;;; YASNIPPET
;;;****************************************************************************************

(yas-global-mode 1)

;;;****************************************************************************************
;;; Mode line
;;;****************************************************************************************

(nyan-mode t)

;;;****************************************************************************************
;;; IDO MODE
;;;****************************************************************************************

; conflicts with helm?

(ido-mode t)
(add-to-list 'ido-ignore-files "\.checked")
(add-to-list 'ido-ignore-files "\.hints")
(add-to-list 'ido-ignore-files "\.exe")

;;;****************************************************************************************
;;; HELM
;;;***********************************************************************************

;; Taken from: https://tuhdo.github.io/helm-intro.html
;
;(global-set-key (kbd "C-c h") 'helm-command-prefix)
;(global-unset-key (kbd "C-x c"))
;
;(setq helm-split-window-in-side-p t)
;(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "C-x b") 'helm-mini)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)
;
;; Because the default completion while searching (for files) is enter.
;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;;;****************************************************************************************
;; DIRED
;;;****************************************************************************************

(local-set-key (kbd "C-o") 'dired-to-shell-command)
(setq dired-guess-shell-alist-user
      '(("\\.pdf\\'" "zathura")
        ("\\.doc\\'" "libreoffice")
        ("\\.docx\\'" "libreoffice")
        ("\\.ppt\\'" "libreoffice")
        ("\\.pptx\\'" "libreoffice")
        ("\\.xls\\'" "libreoffice")
        ("\\.xlsx\\'" "libreoffice")
        ("\\.jpg\\'" "gqview")
        ("\\.png\\'" "gqview")))

;;;****************************************************************************************
;; ORG RIFLE custom
;;;***********************************************************************************

;; Somehow this version doesn't have a timeout bug present!
;(load-file "~/code/org-rifle/helm-org-rifle.el")

;;;****************************************************************************************
;; ORG super links
;;;****************************************************************************************

;(defun volhovm-org-make-link-description-function (link desc)
;  (read-string "Description: " desc))
;
;(setq org-make-link-description-function 'volhovm-org-make-link-description-function)

(add-to-list 'load-path "~/code/org-super-links/")
(require 'org-super-links)

(setq org-super-links-enable-forward-prompt t)

(defun volhovm-exists-backlink ()
  (interactive)
  (save-window-excursion
    (with-current-buffer (current-buffer)
      (save-excursion
        (let ((id (org-id-get (point))))
          (org-open-at-point)
          (org-super-links--find-link id))))))
(defun volhovm-convert-to-super-maybe ()
  (interactive)
  "Tries to insert a backlink if not present. Direct outside-of-drawer
  backlinks also count"
  (let* ((ltype (org-element-property :type (org-element-context))))
    (if (and (not (org-super-links--in-drawer))
               (string= ltype "id")
               (not (volhovm-exists-backlink)))
      (org-super-links-convert-link-to-super t)
      (message "Not converting")
      )))
(defun volhovm-convert-all-links-to-super ()
  (interactive)
  "Goes through all the id-type links after the pointer that don't have backlinks
  and tries to add the backlinks."
  (while (not (string= (org-next-link) "No further link found"))
    (volhovm-convert-to-super-maybe))
  (message "Conversion done"))


;;;****************************************************************************************
;; ORG MODE
;;;****************************************************************************************

(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(defun volhovm-save-study ()
  (with-current-buffer "study.org" (save-buffer)))
(defun my-org-mode-hook ()
  "Hook for org mode."
  (local-set-key (kbd "C-c C-k") 'org-resolve-clocks)
  (local-set-key (kbd "C-c C-i") 'org-clock-in)
  (local-set-key (kbd "C-c C-o") 'org-clock-out)
  (local-set-key (kbd "C-c C-j") 'org-clock-goto)
  (local-set-key (kbd "C-o") 'org-open-at-point)
  (local-set-key (kbd "C-z") 'org-mark-ring-goto)
;  (local-set-key (kbd "C-c /") 'helm-org-rifle-agenda-files)
;  (local-set-key (kbd "C-c /") 'helm-org-rifle-current-buffer)
  (local-set-key (kbd "C-c /") 'helm-org-ql-agenda-files)
  (local-set-key (kbd "C-c l") 'org-store-link)
  (local-set-key (kbd "C-c C-l") 'org-insert-link)
  (local-set-key (kbd "C-c s s") 'org-super-links-link)
  (local-set-key (kbd "C-c s l") 'org-super-links-store-link)
  (local-set-key (kbd "C-c s C-l") 'org-super-links-insert-link)
  (setq fill-column 5000)
  (define-key org-mode-map (kbd "C-c C-x C-s") nil)
  (org-indent-mode)
  (olivetti-mode)
  (flyspell-mode)
;  (run-with-idle-timer 5 t #'my-save-function)
;  (org-backlink-mode)
  (setq word-wrap t)
  )
(defun my-org-agenda-mode-hook ()
  "Enables hjkl-bindings for agenda-mode."
  (define-key org-agenda-mode-map "j" 'org-agenda-next-line)
  (define-key org-agenda-mode-map "k" 'org-agenda-previous-line)
  (define-key org-agenda-mode-map "l" 'evil-forward-char)
  (define-key org-agenda-mode-map "h" 'evil-backward-char)
  (olivetti-mode))
(add-hook 'org-mode-hook 'my-org-mode-hook)
(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-hook)
(global-set-key (kbd "<f5>") 'olivetti-mode)

(defun my-save-some-buffers ()
  (interactive)
  (org-save-all-org-buffers)
  (save-some-buffers))
(global-set-key (kbd "C-x s") 'my-save-some-buffers)

;; Org roam
;(setq org-roam-directory "~/org/roam")
;(add-hook 'after-init-hook 'org-roam-mode)

;; Org id (for links)
;; Taken from: https://writequit.org/articles/emacs-org-mode-generate-ids.html
;; can be improved?
(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)

(org-clock-persistence-insinuate)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)
   (ledger . t)
   (haskell . t)))

;; Org drill
(setq org-drill-learn-fraction 0.25)
(setq org-drill-maximum-duration 25)
(setq org-drill-spaced-repetition-algorithm 'sm5)
(setq org-drill-adjust-intervals-for-early-and-late-repetitions-p t)


;; Appointmens with org

;(require 'org-alert)


(require 'appt)
(setq appt-time-msg-list nil)    ;; clear existing appt list
(setq appt-display-interval '10) ;; warn every 10 minutes from t - appt-message-warning-time
(setq
  appt-message-warning-time '10  ;; send first warning 10 minutes before appointment
  appt-display-mode-line nil     ;; don't show in the modeline
  appt-display-format 'window)   ;; pass warnings to the designated window function
(appt-activate 1)                ;; activate appointment notification
(display-time)                   ;; activate time display

(org-agenda-to-appt)             ;; generate the appt list from org agenda files on emacs launch
(run-at-time "24:01" 1200 'org-agenda-to-appt)           ;; update appt list every 20m
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt) ;; update appt list on agenda view

;; set up the call to terminal-notifier
(defvar my-notifier-path
  "/run/current-system/sw/bin/notify-send")
(defun my-appt-send-notification (title msg)
  (shell-command (concat my-notifier-path " " title " " msg  )))

;; designate the window function for my-appt-send-notification
(defun my-appt-display (min-to-app new-time msg)
  (my-appt-send-notification
    (format "'Appointment in %s minutes'" min-to-app)    ;; passed to -title in terminal-notifier call
    (format "'%s'" msg)))                                ;; passed to -message in terminal-notifier call
(setq appt-disp-window-function (function my-appt-display))



(require 'ox-latex)
(setq org-latex-listings t)
(setq org-reveal-root "file:///home/volhovm/programs/reveal.js")

(defun org-export-latex-no-toc (depth)
  (when depth
    (format "%% Org-mode is exporting headings to %s levels.\n"
            depth)))
(setq org-export-latex-format-toc-function 'org-export-latex-no-toc)

; dumping current task info into file
(defun current-task-to-status ()
  (interactive)
  (with-temp-file "~/.orgtask"
    (if (org-clocking-p)
        (insert (org-clock-get-clock-string))
        ;(insert "<fc=#ff0000>###### NO ACTIVE CLOCK ######</fc>"))))
        (insert "-no-work-"))))
        ;(insert "no clocking!"))))
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

;; Stolen from here:
;; https://emacs.stackexchange.com/questions/5389/correcting-and-maintaining-org-mode-hyperlinks
(defun org-check-broken-links ()
  "Searches current buffer for file: links, and reports the broken ones."
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (let (file-links)
      (while (re-search-forward org-bracket-link-analytic-regexp nil t)
        (if (not (file-exists-p (match-string-no-properties 3)))
            (setq file-links
                  (cons (match-string-no-properties 0)
                        file-links))))
      (get-buffer-create "broken-links")
      (switch-to-buffer-other-window (get-buffer "broken-links"))
      (print
       (concat "Warning: broken links in this file:\n"
               (mapconcat #'identity file-links "\n"))
       (get-buffer "broken-links")))))


;; Blogging
(with-eval-after-load 'ox (require 'ox-hugo))

;;;****************************************************************************************
;;; Latex / auctex
;;;****************************************************************************************

;; save a file and compile it with latex
(defun latex-immediate-compile ()
  (interactive)
  (save-buffer)
  (TeX-command "LaTeX" 'TeX-master-file))
(defun my-LaTeX-hook ()
  (flyspell-mode)
  ;(flyspell-buffer) ; too slow
  (setq fill-column 85)
  (local-set-key (kbd "<f11>") 'latex-immediate-compile)
  (olivetti-mode)
  (olivetti-set-width 120)
  )
(add-hook 'LaTeX-mode-hook 'my-LaTeX-hook)

(defvar org-latex-fragment-last nil
  "Holds last fragment/environment you were on.")

(defun my/org-latex-fragment--get-current-latex-fragment ()
  "Return the overlay associated with the image under point."
  (car (--select (eq (overlay-get it 'org-overlay-type) 'org-latex-overlay) (overlays-at (point)))))

(defun my/org-in-latex-fragment-p ()
    "Return the point where the latex fragment begins, if inside
  a latex fragment. Else return false"
    (let* ((el (org-element-context))
           (el-type (car el)))
      (and (or (eq 'latex-fragment el-type) (eq 'latex-environment el-type))
          (org-element-property :begin el))))

(defun org-latex-fragment-toggle-auto ()
  ;; Wait for the s
  (interactive)
  (while-no-input
    (run-with-idle-timer 0.05 nil 'org-latex-fragment-toggle-helper)))

(defun org-latex-fragment-toggle-helper ()
    "Toggle a latex fragment image "
    (condition-case nil
        (and (eq 'org-mode major-mode)
             (let* ((begin (my/org-in-latex-fragment-p)))
               (cond
                ;; were on a fragment and now on a new fragment
                ((and
                  ;; fragment we were on
                  org-latex-fragment-last
                  ;; and are on a fragment now
                  begin
                  ;; but not on the last one this is a little tricky. as you edit the
                  ;; fragment, it is not equal to the last one. We use the begin
                  ;; property which is less likely to change for the comparison.
                  (not (= begin
                          org-latex-fragment-last)))
                 ;; go back to last one and put image back
                 (save-excursion
                   (goto-char org-latex-fragment-last)
                   (when (my/org-in-latex-fragment-p) (org-latex-preview))
                   ;; now remove current imagea
                   (goto-char begin)
                   (let ((ov (my/org-latex-fragment--get-current-latex-fragment)))
                     (when ov
                       (delete-overlay ov)))
                   ;; and save new fragment
                   (setq org-latex-fragment-last begin)))

                ;; were on a fragment and now are not on a fragment
                ((and
                  ;; not on a fragment now
                  (not begin)
                  ;; but we were on one
                  org-latex-fragment-last)
                 ;; put image back on
                 (save-excursion
                   (goto-char org-latex-fragment-last)
                   (when (my/org-in-latex-fragment-p)(org-latex-preview)))

                 ;; unset last fragment
                 (setq org-latex-fragment-last nil))

                ;; were not on a fragment, and now are
                ((and
                  ;; we were not one one
                  (not org-latex-fragment-last)
                  ;; but now we are
                  begin)
                 (save-excursion
                   (goto-char begin)
                   ;; remove image
                   (let ((ov (my/org-latex-fragment--get-current-latex-fragment)))
                     (when ov
                       (delete-overlay ov)))
                   (setq org-latex-fragment-last begin)))
                ;; else not on a fragment
                ((not begin)
                 (setq org-latex-fragment-last nil)))))
      (error nil)))


(add-hook 'post-command-hook 'org-latex-fragment-toggle-auto)
(setq org-latex-fragment-toggle-helper (byte-compile 'org-latex-fragment-toggle-helper))
(setq org-latex-fragment-toggle-auto (byte-compile 'org-latex-fragment-toggle-auto))

(plist-put org-format-latex-options :scale 1.4)
; scaling fragments doesn't work :(
;(defun update-org-latex-fragments ()
;  (org-latex-preview '(64))
;  (plist-put org-format-latex-options :scale 1.4)
;  (org-latex-preview '(16)))
;(add-hook 'text-scale-mode-hook 'update-org-latex-fragments)


;;;****************************************************************************************
;;; Frames
;;;****************************************************************************************

(define-key org-mode-map (kbd "C-,") nil)
(define-key flyspell-mode-map (kbd "C-,") nil)
(global-set-key (kbd "C-,") 'other-window)
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)


;;;****************************************************************************************
;;; Dumb-jump
;;;****************************************************************************************

(require 'dumb-jump)
(setq dumb-jump-mode t)
(setq dumb-jump-force-searcher 'ag)
(setq dumb-jump-fallback-search nil)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;;;****************************************************************************************
;;; Haskell
;;;****************************************************************************************

;(add-to-list 'load-path "~/.emacs.d/haskell-mode-neongreen/")
;(require 'haskell-mode-autoloads)
;(add-to-list 'Info-default-directory-list "~/.emacs.d/haskell-mode-neongreen/")
;(require 'haskell-process)
(remove-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'volhovm-haskell-mode-hook)
(defun volhovm-haskell-mode-hook ()
  "Func for haskell-mode hook."
  (local-set-key (kbd "C-c C-g") 'haskell-session-change-target)
  (interactive-haskell-mode)
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
;(setq haskell-process-args-ghci
;      '("-ferror-spans" "-fshow-loaded-modules"))
;(setq haskell-process-args-cabal-repl
;      '("--ghc-options=-ferror-spans -fshow-loaded-modules"))
;(setq haskell-process-args-stack-ghci
;      '("--ghci-options=-ferror-spans -fshow-loaded-modules"
;        "--no-build" "--no-load"))
;(setq haskell-process-args-cabal-new-repl
;      '("--ghc-options=-ferror-spans -fshow-loaded-modules"))


;;;****************************************************************************************
;;; WHITESPACE
;;;****************************************************************************************

(require 'whitespace)
(setq whitespace-line-column 100)
(add-hook 'c++-mode-hook 'whitespace-mode)
(add-hook 'tuareg-mode-hook 'whitespace-mode)
;(add-hook 'scala-mode 'whitespace-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)

;;;****************************************************************************************
;;; C
;;;****************************************************************************************
(add-hook 'makefile-mode-hook (lambda()
                                (whitespace-toggle-options '(tabs))))
;(add-hook 'c-mode-hook 'linum-mode)
(add-hook 'c-mode-hook 'whitespace-mode)

;;;****************************************************************************************
;;; C++
;;;****************************************************************************************
(require 'cc-mode)
(global-set-key (kbd "<f11>") 'recompile) ;; kind of cool
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4
  (setq tab-width 4)
  (setq indent-tabs-mode t)))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
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

;;;****************************************************************************************
;;; Autocomplete
;;;****************************************************************************************
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)
;(add-to-list 'ac-modes 'haskell-mode)

;;;****************************************************************************************
;;; Agda
;;;****************************************************************************************

;(add-to-list 'load-path "~/.emacs.d/agda-input/")
(load-file "~/.emacs.d/agda-input.el")
(require 'agda-input)

;;;****************************************************************************************
;;;;; ASM86
;;;****************************************************************************************
;;(setq make-backup-files nil)
;;(autoload 'asm86-mode "~/.emacs.d/asm86-mode.el")
;;(setq auto-mode-alist
;;      (append '(("\\.asm\\'" . asm86-mode) ("\\.inc\\'" . asm86-mode))
;;              auto-mode-alist))
;;(add-hook 'asm86-mode-hook 'turn-on-font-lock)
;;(add-hook 'asm-mode-hook '(lambda () (linum-mode) ))

;;;****************************************************************************************
;;; Backups
;;;****************************************************************************************

(setq make-backup-files nil)
;(setq backup-directory-alist `(("." . ,(concat user-emacs-directory ".saves")))
;      backup-by-copying t
;      delete-old-versions t
;      kept-new-versions 6
;      kept-old-versions 2
;      version-control t)
(setq auto-save-file-name-transforms
  `((".*" "~/.emacs.d/.saves/" t)))

;;;****************************************************************************************
;;; Java
;;;****************************************************************************************

(add-hook 'java-mode-hook '(lambda () (whitespace-mode)))

;;;****************************************************************************************
;;; Nix support
;;;****************************************************************************************

(autoload 'nix-mode "nix-mode" "Major mode for editing Nix expressions." t)
(push '("\\.nix\\'" . nix-mode) auto-mode-alist)
(push '("\\.nix\\.in\\'" . nix-mode) auto-mode-alist)

;;;****************************************************************************************
;;; Simpler yes-or-no
;;;****************************************************************************************

(fset 'yes-or-no-p 'y-or-n-p)

;;;****************************************************************************************
;;;; Spelling
;;;****************************************************************************************

; multiple dictionaries
(with-eval-after-load "ispell"
  (setq ispell-program-name "hunspell")
  (setq ispell-dictionary "en_GB,ru_RU")
  ;; ispell-set-spellchecker-params has to be called
  ;; before ispell-hunspell-add-multi-dic will work
  (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_GB,ru_RU"))

(setq flyspell-persistent-highlight t)
(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

;;;****************************************************************************************
;;; AG search (silver-searcher)
;;;****************************************************************************************

(global-set-key (kbd "<f7>") 'ag-project)
(global-set-key (kbd "C-<f7>") 'ag)
(setq ag-reuse-buffers 't)
(setq ag-reuse-window 't)

;;;****************************************************************************************
;;; Cryptoverif
;;;****************************************************************************************

(add-to-list 'load-path "~/.emacs.d/cryptoverif/")
(setq auto-mode-alist
      (cons '("\\.cv[l]?$" . cryptoverif-mode)
      (cons '("\\.ocv[l]?$" . cryptoverifo-mode) auto-mode-alist)))
(autoload 'cryptoverif-mode
    "cryptoverif" "Major mode for editing CryptoVerif code." t)
(autoload 'cryptoverifo-mode
    "cryptoverif" "Major mode for editing CryptoVerif code." t)

;;;****************************************************************************************
;;; Proverif
;;;****************************************************************************************

(add-to-list 'load-path "~/.emacs.d/proverif/")
(setq auto-mode-alist
             (cons '("\\.horn$" . proverif-horn-mode)
             (cons '("\\.horntype$" . proverif-horntype-mode)
             (cons '("\\.pv$" . proverif-pv-mode)
             (cons '("\\.pi$" . proverif-pi-mode) auto-mode-alist)))))
(autoload 'proverif-pv-mode "proverif" "Major mode for editing ProVerif code." t)
(autoload 'proverif-pi-mode "proverif" "Major mode for editing ProVerif code." t)
(autoload 'proverif-horn-mode "proverif" "Major mode for editing ProVerif code." t)
(autoload 'proverif-horntype-mode "proverif" "Major mode for editing ProVerif code." t)

;;;****************************************************************************************
;;; Tidal
;;;****************************************************************************************

;(add-to-list 'load-path "~/code/Tidal/")
;(require 'tidal)
(setq tidal-interpreter "/run/current-system/sw/bin/ghci")
(setq tidal-boot-script-path "/home/volhovm/code/Tidal/BootTidal.hs")

;;;****************************************************************************************
;;; FStar
;;;****************************************************************************************

(add-hook 'fstar-mode-hook
          '(lambda () (prettify-symbols-mode -1)
                      (whitespace-mode)))
;(setq fstar-subp-prover-args '("--include" "/home/volhovm/code/FStar/ucontrib/Platform/fst/"
;                               "--include" "/home/volhovm/code/FStar/ucontrib/Log/fst/"
;                               "--include" "/home/volhovm/code/FStar/ucontrib/CoreCrypto/fst/"
;                               ))

(defun my-fstar-compute-prover-args-using-make ()
  "Construct arguments to pass to F* by calling make."
  (with-demoted-errors "Error when constructing arg string: %S"
    (let* ((fname (file-name-nondirectory buffer-file-name))
       (target (concat fname "-in"))
       (argstr (car (process-lines "make" "--quiet" target))))
      (split-string argstr))))

(setq fstar-subp-prover-args #'my-fstar-compute-prover-args-using-make)

;;;****************************************************************************************
;;; Filling and un-filling the paragraph
;;;****************************************************************************************

;;; Opposite of M-q wrapping paragraph.
;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))
(define-key global-map "\M-j" 'unfill-paragraph)


; This one works!
; Otherwise emacs thinks a sentence ends with double space.
; https://stackoverflow.com/questions/2456879/emacs-m-e-doesnt-work-properly-in-tex-mode
(setq sentence-end-double-space nil)

; https://pleasefindattached.blogspot.com/2011/12/emacsauctex-sentence-fill-greatly.html
(defadvice LaTeX-fill-region-as-paragraph (around LaTeX-sentence-filling)
  "Start each sentence on a new line."
  (let ((from (ad-get-arg 0))
        (to-marker (set-marker (make-marker) (ad-get-arg 1)))
        tmp-end)
    (while (< from (marker-position to-marker))
      (forward-sentence)
      ;; might have gone beyond to-marker --- use whichever is smaller:
      (ad-set-arg 1 (setq tmp-end (min (point) (marker-position to-marker))))
      ad-do-it
      (ad-set-arg 0 (setq from (point)))
      (unless (or
               (bolp)
               (looking-at "\\s *$"))
        (LaTeX-newline)))
    (set-marker to-marker nil)))
(ad-activate 'LaTeX-fill-region-as-paragraph)

;; From https://abizjak.github.io/emacs/2016/03/06/latex-fill-paragraph.html
;; Works great also!
;(defun ales/fill-paragraph (&optional P)
;  "When called with prefix argument call `fill-paragraph'.
;Otherwise split the current paragraph into one sentence per line."
;  (interactive "P")
;  (if (not P)
;      (save-excursion
;        (let ((fill-column 12345678)) ;; relies on dynamic binding
;          (fill-paragraph) ;; this will not work correctly if the paragraph is
;                           ;; longer than 12345678 characters (in which case the
;                           ;; file must be at least 12MB long. This is unlikely.)
;          (let ((end (save-excursion
;                       (forward-paragraph 1)
;                       (backward-sentence)
;                       (point-marker))))  ;; remember where to stop
;            (beginning-of-line)
;            (while (progn (forward-sentence)
;                          (<= (point) (marker-position end)))
;              (just-one-space) ;; leaves only one space, point is after it
;              (delete-char -1) ;; delete the space
;              (newline)        ;; and insert a newline
;              (LaTeX-indent-line) ;; I only use this in combination with late, so this makes sense
;              ))))
;    ;; otherwise do ordinary fill paragraph
;    (fill-paragraph P)))
;(define-key LaTeX-mode-map (kbd "M-q") 'ales/fill-paragraph)

;(require 'quelpa-use-package)
;(use-package org-super-links
;  :quelpa (org-super-links :repo "toshism/org-super-links" :fetcher github :commit "0.3")
;  :bind (("C-c s s" . sl-link)
;           ("C-c s l" . sl-store-link)
;           ("C-c s C-l" . sl-insert-link)))

;(use-package org-sidebar
;  :quelpa (org-sidebar :fetcher github :repo "alphapapa/org-sidebar"))
;
;(load-file "~/.emacs.d/org-backlink.el")
;
;(defun volhovm-test-regexp ()
;  (interactive)
;  (re-search-forward "\\[\\[\\(\\(file:[^:]+::\\(\\*\\)\\)\\|\\(id:\\)\\|\\(\\*\\)\\)" nil t))
;  ;(re-search-forward "\\[\\[\\(\\(file:[^:]+::\\(\\*\\)\\)|\\(id:\\)|\\(\\*\\)\\)?" nil t))
;(global-set-key (kbd "C-c r") 'volhovm-test-regexp)

(provide '.emacs)
;;; .emacs ENDS HERE

;(load-file (let ((coding-system-for-read 'utf-8))
;                (shell-command-to-string "agda-mode locate")))
