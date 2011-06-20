;; -*- coding: utf-8 -*-

;; line number
(require 'linum)
(setq linum-format "%4d| ")

(custom-set-faces
 '(linum ((t :foreground "CadetBlue" :inherit (shadow default))))) 

(setq linum-mode-inhibit-modes-list
      '(help-mode
        eshell-mode
        shell-mode
        erc-mode
        jabber-roster-mode
        jabber-chat-mode
        gnus-group-mode
        gnus-summary-mode
        gnus-article-mode))

(defadvice linum-on (around linum-on-inhibit-for-modes)
  "stop the load of linum mode for some major mode"
  (unless (member major-mode linum-mode-inhibit-modes-list)
    ad-do-it))

(ad-activate 'linum-on)

(global-linum-mode 1) 

(provide 'my-linum-mode-setting)
