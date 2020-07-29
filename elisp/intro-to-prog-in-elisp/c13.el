;; Author: Anurag Muthyam 

;; ********************************************
;; Chapter 13: Counting: Repetition and Regexps
;; ********************************************

;; Q:
;; Using a `while' loop, write a function to count the number of punctuation
;; marks in a region--period, comma, semicolon, colon, exclamation mark, and
;; question mark.  Do the same using recursion.
;; ---------
;;
;; A:
;; using `while` loop
(defun count-punctuation-with-while-loop (beg end)
  (interactive "r")
  (save-excursion (goto-char beg)
    (let ((count 0))
      (while (and (< (point) end)
		  (re-search-forward "[.,;:!?]" end t))
	(setq count (1+ count)))
      (cond ((zerop count)
	     (message "Region has no punctuation"))
	    (t (message "Region has %d punctuations" count))))))

;; Using `recursion`
(defun count-punctuation-with-recursion (beg end)
  (interactive "r")
  (save-excursion (goto-char beg)
    (let ((count (recursive-count end)))
      (cond ((zerop count)
	     (message "Region has no punctuation"))
	    (t (message "Region has %d punctuations" count))))))


(defun recursive-count (end)
  (if (and (< (point) end)
	   (re-search-forward "[.,;:?!]" end t))
      (1+ (recursive-count end)) 0))


