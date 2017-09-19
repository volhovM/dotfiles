#!/bin/sh

# Put this into your emacs configuration to make things work:
#
#
# (setq org-clock-mode-line-total 'current)
# (defun current-task-to-status ()
#   (interactive)
#   (with-temp-file "~/.orgtask"
#     (if (org-clocking-p)
#         (insert (org-clock-get-clock-string))
#         (insert "No active clock"))))
# (run-with-timer 0 15 'current-task-to-status)
#
#
# taken from here: 
# https://www.reddit.com/r/emacs/comments/5gkf33/show_clocking_time_of_current_task_to_file/

cat ~/.orgtask | xargs  # maybe restrict length also? ..
