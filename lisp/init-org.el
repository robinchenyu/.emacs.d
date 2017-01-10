(when (< emacs-major-version 24)
  (require-package 'org))
(require-package 'org-fstree)
(when *is-a-mac*
  (maybe-require-package 'grab-mac-link)
  (require-package 'org-mac-iCal))

(maybe-require-package 'org-cliplink)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Various preferences
(setq org-log-done t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)


;; Lots of stuff from http://doc.norang.ca/org-mode.html

(defun sanityinc/grab-ditaa (url jar-name)
  "Download URL and extract JAR-NAME as `org-ditaa-jar-path'."
  ;; TODO: handle errors
  (message "Grabbing " jar-name " for org.")
  (let ((zip-temp (make-temp-name "emacs-ditaa")))
    (unwind-protect
        (progn
          (when (executable-find "unzip")
            (url-copy-file url zip-temp)
            (shell-command (concat "unzip -p " (shell-quote-argument zip-temp)
                                   " " (shell-quote-argument jar-name) " > "
                                   (shell-quote-argument org-ditaa-jar-path)))))
      (when (file-exists-p zip-temp)
        (delete-file zip-temp)))))

(after-load 'ob-ditaa
  (unless (and (boundp 'org-ditaa-jar-path)
               (file-exists-p org-ditaa-jar-path))
    (let ((jar-name "ditaa0_9.jar")
          (url "http://jaist.dl.sourceforge.net/project/ditaa/ditaa/0.9/ditaa0_9.zip"))
      (setq org-ditaa-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
      (unless (file-exists-p org-ditaa-jar-path)
        (sanityinc/grab-ditaa url jar-name)))))



(define-minor-mode prose-mode
  "Set up a buffer for prose editing.
This enables or modifies a number of settings so that the
experience of editing prose is a little more like that of a
typical word processor."
  nil " Prose" nil
  (if prose-mode
      (progn
        (setq truncate-lines t)
        (setq word-wrap t)
        (setq cursor-type 'bar)
        (when (eq major-mode 'org)
          (kill-local-variable 'buffer-face-mode-face))
        (buffer-face-mode 1)
        ;;(delete-selection-mode 1)
        (set (make-local-variable 'blink-cursor-interval) 0.6)
        (set (make-local-variable 'show-trailing-whitespace) nil)
        (flyspell-mode 1)
        (when (fboundp 'visual-line-mode)
          (visual-line-mode 1)))
    ;; (kill-local-variable 'truncate-lines)
    (kill-local-variable 'word-wrap)
    (kill-local-variable 'cursor-type)
    (kill-local-variable 'show-trailing-whitespace)
    (buffer-face-mode -1)
    ;; (delete-selection-mode -1)
    (flyspell-mode -1)
    (when (fboundp 'visual-line-mode)
      (visual-line-mode -1))))

;;(add-hook 'org-mode-hook 'buffer-face-mode)


(setq org-support-shift-select t)

;;; Capturing

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
      `(("t" "todo" entry (file "")  ; "" => org-default-notes-file
         "* NEXT %?\n%U\n" :clock-resume t)
        ("n" "note" entry (file "")
         "* %? :NOTE:\n%U\n%a\n" :clock-resume t)
        ))



;;; Refiling

(setq org-refile-use-cache nil)

; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))

(after-load 'org-agenda
  (add-to-list 'org-agenda-after-show-hook 'org-show-entry))

;; Exclude DONE state tasks from refile targets
(defun sanityinc/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))
(setq org-refile-target-verify-function 'sanityinc/verify-refile-target)

(defun sanityinc/org-refile-anywhere (&optional goto default-buffer rfloc msg)
  "A version of `org-refile' which suppresses `org-refile-target-verify-function'."
  (interactive "P")
  (let ((org-refile-target-verify-function))
    (org-refile goto default-buffer rfloc msg)))

;; Targets start with the file name - allows creating level 1 tasks
;;(setq org-refile-use-outline-path (quote file))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)


;;; To-do settings

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)")))
      org-todo-repeat-to-state "NEXT")

(setq org-todo-keyword-faces
      (quote (("NEXT" :inherit warning)
              ("PROJECT" :inherit font-lock-string-face))))



;;; Agenda views

(setq-default org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3))


(let ((active-project-match "-INBOX/PROJECT"))

  (setq org-stuck-projects
        `(,active-project-match ("NEXT")))

  (setq org-agenda-compact-blocks t
        org-agenda-sticky t
        org-agenda-start-on-weekday nil
        org-agenda-span 'day
        org-agenda-include-diary nil
        org-agenda-sorting-strategy
        '((agenda habit-down time-up user-defined-up effort-up category-keep)
          (todo category-up effort-up)
          (tags category-up effort-up)
          (search category-up))
        org-agenda-window-setup 'current-window
        org-agenda-custom-commands
        `(("N" "Notes" tags "NOTE"
           ((org-agenda-overriding-header "Notes")
            (org-tags-match-list-sublevels t)))
          ("g" "GTD"
           ((agenda "" nil)
            (tags "INBOX"
                  ((org-agenda-overriding-header "Inbox")
                   (org-tags-match-list-sublevels nil)))
            (stuck ""
                   ((org-agenda-overriding-header "Stuck Projects")
                    (org-agenda-tags-todo-honor-ignore-options t)
                    (org-tags-match-list-sublevels t)
                    (org-agenda-todo-ignore-scheduled 'future)))
            (tags-todo "-INBOX/NEXT"
                       ((org-agenda-overriding-header "Next Actions")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        ;; TODO: skip if a parent is WAITING or HOLD
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(todo-state-down effort-up category-keep))))
            (tags-todo ,active-project-match
                       ((org-agenda-overriding-header "Projects")
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-INBOX/-NEXT"
                       ((org-agenda-overriding-header "Orphaned Tasks")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        ;; TODO: skip if a parent is a project
                        (org-agenda-skip-function
                         '(lambda ()
                            (or (org-agenda-skip-subtree-if 'todo '("PROJECT" "HOLD" "WAITING" "DELEGATED"))
                                (org-agenda-skip-subtree-if 'nottododo '("TODO")))))
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "/WAITING"
                       ((org-agenda-overriding-header "Waiting")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "/DELEGATED"
                       ((org-agenda-overriding-header "Delegated")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-INBOX/HOLD"
                       ((org-agenda-overriding-header "On Hold")
                        ;; TODO: skip if a parent is WAITING or HOLD
                        (org-tags-match-list-sublevels nil)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            ;; (tags-todo "-NEXT"
            ;;            ((org-agenda-overriding-header "All other TODOs")
            ;;             (org-match-list-sublevels t)))
            )))))


(add-hook 'org-agenda-mode-hook 'hl-line-mode)


;;; Org clock

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(after-load 'org
  (org-clock-persistence-insinuate))
(setq org-clock-persist t)
(setq org-clock-in-resume t)

;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))



;;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

(after-load 'org-clock
  (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
  (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu))



(when (and *is-a-mac* (file-directory-p "/Applications/org-clock-statusbar.app"))
  (add-hook 'org-clock-in-hook
            (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e"
                                (concat "tell application \"org-clock-statusbar\" to clock in \"" org-clock-current-task "\""))))
  (add-hook 'org-clock-out-hook
            (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e"
                                "tell application \"org-clock-statusbar\" to clock out"))))



;; Remove empty LOGBOOK drawers on clock out
(defun sanityinc/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(after-load 'org-clock
  (add-hook 'org-clock-out-hook 'sanityinc/remove-empty-drawer-on-clock-out 'append))



;; TODO: warn about inconsistent items, e.g. TODO inside non-PROJECT
;; TODO: nested projects!



;;; Archiving

(setq org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archive")





(require-package 'org-pomodoro)
(setq org-pomodoro-keep-killed-pomodoro-time t)
(after-load 'org-agenda
  (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro))


;; ;; Show iCal calendars in the org agenda
;; (when (and *is-a-mac* (require 'org-mac-iCal nil t))
;;   (setq org-agenda-include-diary t
;;         org-agenda-custom-commands
;;         '(("I" "Import diary from iCal" agenda ""
;;            ((org-agenda-mode-hook #'org-mac-iCal)))))

;;   (add-hook 'org-agenda-cleanup-fancy-diary-hook
;;             (lambda ()
;;               (goto-char (point-min))
;;               (save-excursion
;;                 (while (re-search-forward "^[a-z]" nil t)
;;                   (goto-char (match-beginning 0))
;;                   (insert "0:00-24:00 ")))
;;               (while (re-search-forward "^ [a-z]" nil t)
;;                 (goto-char (match-beginning 0))
;;                 (save-excursion
;;                   (re-search-backward "^[0-9]+:[0-9]+-[0-9]+:[0-9]+ " nil t))
;;                 (insert (match-string 0))))))


(after-load 'org
  (define-key org-mode-map (kbd "C-M-<up>") 'org-up-element)
  (when *is-a-mac*
    (define-key org-mode-map (kbd "M-h") nil)
    (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))

(after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((R . t)
     (ditaa . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . nil)
     (latex . t)
     (ledger . t)
     (ocaml . nil)
     (octave . t)
     (python . t)
     (ruby . t)
     (screen . nil)
     (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     (sql . nil)
     (sqlite . t))))

(require 'init-pinyin)

;;; add func to perform imenu for all headings at one level
(defun org-imenu-get-heading ()
  "Produce the index for Imenu."
  (mapc (lambda (x) (move-marker x nil)) org-imenu-markers)
  (setq org-imenu-markers nil)
  (let* ((n org-imenu-depth)
         (re (concat "^" (org-get-limited-outline-regexp)))
         (subs (make-vector (1+ n) nil))
         m level head0 head)
    (save-excursion
      (save-restriction
        (widen)
        (goto-char (point-max))
        (print re)
        (while (re-search-backward re nil t)
          (setq level (org-reduced-level (funcall outline-level)))
          (when (and (<= level n)
                     (looking-at org-complex-heading-regexp)
                     (setq head0 (org-match-string-no-properties 4)))
            (setq head (org-link-display-format head0)
                  m (org-imenu-new-marker))
            (org-add-props head nil 'org-imenu-marker m 'org-imenu t)
            (push (cons head m) (aref subs 1))))))
    (aref subs 1)))

(advice-add #'org-imenu-get-tree :override #'org-imenu-get-heading)

(setq imenu-name-lookup-function #'(lambda (str head)
                                     (print "%S %S" str head)
                                     (string= str head)))

(defun imenu--in-alist2 (str alist)
  "Check whether the string STR is contained in multi-level ALIST."
  (print str)
  (let (elt head tail res)
    (setq res nil)
    (while alist
      (setq elt (car alist)
            tail (cdr elt)
            alist (cdr alist)
            head (car elt))
      ;; A nested ALIST element looks like
      ;;   (INDEX-NAME (INDEX-NAME . INDEX-POSITION) ...)
      ;; while a bottom-level element looks like
      ;;   (INDEX-NAME . INDEX-POSITION)
      ;; or
      ;;   (INDEX-NAME INDEX-POSITION FUNCTION ARGUMENTS...)
      ;; We are only interested in the bottom-level elements, so we need to
      ;; recurse if TAIL is a nested ALIST.
      (cond ((imenu--subalist-p elt)
             (if (setq res (imenu--in-alist str tail))
                 (setq alist nil)))
            ((if imenu-name-lookup-function
                 (funcall imenu-name-lookup-function str head)
               (string= str head))
             (setq alist nil res elt))))
    res))

(defun imenu--completion-buffer2 (index-alist &optional prompt)
  "Let the user select from INDEX-ALIST in a completion buffer with PROMPT.

Return one of the entries in index-alist or nil."
  ;; Create a list for this buffer only when needed.
  (print prompt)
  (let ((name (thing-at-point 'symbol))
        choice
        (prepared-index-alist
         (if (not imenu-space-replacement) index-alist
           (mapcar
            (lambda (item)
              (cons (subst-char-in-string ?\s (aref imenu-space-replacement 0)
                                          (car item))
                    (cdr item)))
            index-alist))))
    (when (stringp name)
      (setq name (or (imenu-find-default name prepared-index-alist) name)))
    (cond (prompt)
          ((and name (imenu--in-alist name prepared-index-alist))
           (setq prompt (format "Index item (default %s): " name)))
          (t (setq prompt "Index item: ")))
    (let ((minibuffer-setup-hook minibuffer-setup-hook))
      ;; Display the completion buffer.
      (if (not imenu-eager-completion-buffer)
          (add-hook 'minibuffer-setup-hook 'minibuffer-completion-help))
      (setq name (completing-read prompt
                                  prepared-index-alist
                                  nil t nil 'imenu--history-list name)))

    (when (stringp name)
      (setq choice (assoc name prepared-index-alist))
      (if (imenu--subalist-p choice)
          (imenu--completion-buffer (cdr choice) prompt)
        choice))))

(advice-add #'imenu--in-alist :override #'imenu--in-alist2)
(advice-add #'imenu--completion-buffer :override #'imenu--completion-buffer2)


(defun org-display-inline-images (&optional include-linked refresh beg end)
  "Display inline images.
Normally only links without a description part are inlined, because this
is how it will work for export.  When INCLUDE-LINKED is set, also links
with a description part will be inlined.  This can be nice for a quick
look at those images, but it does not reflect what exported files will look
like.
When REFRESH is set, refresh existing images between BEG and END.
This will create new image displays only if necessary.
BEG and END default to the buffer boundaries."
  (interactive "P")
  (unless refresh
    (org-remove-inline-images)
    (if (fboundp 'clear-image-cache) (clear-image-cache)))
  (save-excursion
    (save-restriction
      (widen)
      (setq beg (or beg (point-min)) end (or end (point-max)))
      (goto-char beg)
      (let ((re (concat "\\[\\[\\(\\(file:\\)\\|\\([./~]\\)\\)\\([^]\n]+?"
                        (substring (org-image-file-name-regexp) 0 -2)
                        "\\)\\]" (if include-linked "" "\\]")))
            old file ov img)
        (while (re-search-forward re end t)
          (setq old (get-char-property-and-overlay (match-beginning 1)
                                                   'org-image-overlay))
          (setq file (expand-file-name
                      (concat (or (match-string 3) "") (match-string 4))))
          (setq attrwidth (if (or (listp org-image-actual-width)
                                  (null org-image-actual-width))
                              (save-excursion
                                (save-match-data
                                  (when (re-search-backward
                                         "#\\+attr.*:width[ \t]+\\([^ ]+\\)"
                                         (save-excursion
                                           (re-search-backward "^[ \t]*$\\|\\`" nil t)) t)
                                    (string-to-number (match-string 1))))))
                width (or attrwidth 300))
          (when (file-exists-p file)
            (message "%S %S  " attrwidth width )
            (let ((file-thumb (format "%s%st.png" (file-name-directory file) (file-name-base file) "t.png")))
              (unless (file-exists-p file-thumb)
                (shell-command (format "convert %s -thumbnail %sx%s %s"
                                       file width width file-thumb)))
              (if (and (car-safe old) refresh)
                  (image-refresh (overlay-get (cdr old) 'display))
                (setq img (save-match-data (create-image file-thumb)))
                (when img
                  (setq ov (make-overlay (match-beginning 0) (match-end 0)))
                  (overlay-put ov 'display img)
                  (overlay-put ov 'face 'default)
                  (overlay-put ov 'org-image-overlay t)
                  (overlay-put ov 'modification-hooks
                               (list 'org-display-inline-remove-overlay))
                  (push ov org-inline-image-overlays))))))))))
(defun image-toggle-display-image ()
  "Show the image of the image file.
Turn the image data into a real image, but only if the whole file
was inserted."
  (unless (derived-mode-p 'image-mode)
    (error "The buffer is not in Image mode"))
  (let* ((filename (buffer-file-name))
         (data-p (not (and filename
                           (file-readable-p filename)
                           (not (file-remote-p filename))
                           (not (buffer-modified-p))
                           (not (and (boundp 'archive-superior-buffer)
                                     archive-superior-buffer))
                           (not (and (boundp 'tar-superior-buffer)
                                     tar-superior-buffer))
                           ;; This means the buffer holds the
                           ;; decrypted content (bug#21870).
                           (not (and (boundp 'epa-file-encrypt-to)
                                     (local-variable-p
                                      'epa-file-encrypt-to))))))
         (file-or-data (if data-p
                           (string-make-unibyte
                            (buffer-substring-no-properties (point-min) (point-max)))
                         filename))
         ;; If we have a `fit-width' or a `fit-height', don't limit
         ;; the size of the image to the window size.
         (edges (and (null image-transform-resize)
                     (window-inside-pixel-edges
                      (get-buffer-window (current-buffer)))))
         (type (if (fboundp 'imagemagick-types)
                   'imagemagick
                 (image-type file-or-data nil data-p)))
         (image (if (not edges)
                    (progn
                      (message "create image")
                      (create-image file-or-data type data-p)
                      (message "create image over"))
                  (progn
                    (message "create image with props")
                    (create-image file-or-data type data-p
                                  :max-width (- (nth 2 edges) (nth 0 edges))
                                  :max-height (- (nth 3 edges) (nth 1 edges))))))
         (inhibit-read-only t)
         (buffer-undo-list t)
         (modified (buffer-modified-p))
         props)

    ;; Discard any stale image data before looking it up again.
    (message "before flush image")
    (image-flush image)
    (message "before flush image over")
    (setq image (append image (image-transform-properties image)))
    (setq props
          `(display ,image
                    ;; intangible ,image
                    rear-nonsticky (display) ;; intangible
                    read-only t front-sticky (read-only)))

    (let ((buffer-file-truename nil)) ; avoid changing dir mtime by lock_file
      (add-text-properties (point-min) (point-max) props)
      (restore-buffer-modified-p modified))
    ;; Inhibit the cursor when the buffer contains only an image,
    ;; because cursors look very strange on top of images.
    (setq cursor-type nil)
    ;; This just makes the arrow displayed in the right fringe
    ;; area look correct when the image is wider than the window.
    (setq truncate-lines t)
    ;; Disable adding a newline at the end of the image file when it
    ;; is written with, e.g., C-x C-w.
    (if (coding-system-equal (coding-system-base buffer-file-coding-system)
                             'no-conversion)
        (setq-local find-file-literally t))
    ;; Allow navigation of large images.
    (setq-local auto-hscroll-mode nil)
    (setq image-type type)
    (if (eq major-mode 'image-mode)
        (setq mode-name (format "Image[%s]" type)))
    (message "transform image check size")
    ;; (image-transform-check-size)
    (message "transform image check size over")
    (if (called-interactively-p 'any)
        (message "Repeat this command to go back to displaying the file as text"))))

(defun image-mode ()
  "Major mode for image files.
You can use \\<image-mode-map>\\[image-toggle-display] or \\<image-mode-map>\\[image-toggle-hex-display]
to toggle between display as an image and display as text or hex.

Key bindings:
\\{image-mode-map}"
  (interactive)
  (condition-case err
      (progn
        (unless (display-images-p)
          (error "Display does not support images"))

        (kill-all-local-variables)
        (setq major-mode 'image-mode)

        (if (not (image-get-display-property))
            (progn
              (image-toggle-display-image)
              ;; If attempt to display the image fails.
              (if (not (image-get-display-property))
                  (error "Invalid image")))
          ;; Set next vars when image is already displayed but local
          ;; variables were cleared by kill-all-local-variables
          (setq cursor-type nil truncate-lines t
                image-type (plist-get (cdr (image-get-display-property)) :type)))

        (setq mode-name (if image-type (format "Image[%s]" image-type) "Image"))
        (use-local-map image-mode-map)

        ;; Use our own bookmarking function for images.
        (setq-local bookmark-make-record-function
                    #'image-bookmark-make-record)

        ;; Keep track of [vh]scroll when switching buffers
        (image-mode-setup-winprops)

        (add-hook 'change-major-mode-hook 'image-toggle-display-text nil t)
        (add-hook 'after-revert-hook 'image-after-revert-hook nil t)
        (message "before run image-mode-hook")
        (run-mode-hooks 'image-mode-hook)
        (message " run image-mode-hook over")
        (let ((image (image-get-display-property))
              (msg1 (substitute-command-keys
                     "Type \\[image-toggle-display] or \\[image-toggle-hex-display] to view the image as "))
              animated)
          (cond
;;;			     (substitute-command-keys
;;;			      "\\[image-toggle-animation] to animate."))))
           (t
            (message "%s" (concat msg1 "text or hex."))))))

    (error
     (image-mode-as-text)
     (funcall
      (if (called-interactively-p 'any) 'error 'message)
      "Cannot display image: %s" (cdr err)))))

(defun org-preview-pic ()
  (interactive)
  (org-open-at-point)
  (other-window 1))
(global-set-key (kbd "M-<f9>") 'org-preview-pic)

(provide 'init-org)
