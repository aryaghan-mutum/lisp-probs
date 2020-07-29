;; Author: Anurag Muthyam 

;; ********************************************
;; Chapter 12: Regular Expression Searches
;; ********************************************

;; Q:
;; Write a function to search for a regular expression that matches
;; two or more blank lines in sequence.
;; ---------
;;
;; A:
(defun search-blankline(arg)
  (interactive "p")
  (let ((arg (if arg arg 1)))
    (re-search-forward "^\n\\{1,\\}" nil nil arg)))

;; Q:
;;Write a function to search for duplicated words, such as ‘the the’.
;; Note: this function is similar to the one in "the-the Duplicated words function in Appendix."
;; ---------
;;
;; A:
(defun search-forward-for_duplicate-word (arg)
  (interactive "p")
  (push-mark)
  (let ((arg (if arg arg 1)))
    (if (re-search-forward
	 "\\b\\([^@ \n\t]+\\)[ \n\t]+\\1\\b" nil 'move arg)
	(message "Found duplicated word.")
      (message "End of buffer"))))
