;; Author: Anurag Muthyam 

;; ******************************
;; Chapter 11: Loops And Recusion 
;; ******************************

;; Q:
;; Write a function similar to `triangle' in which each row has a value which is
;; the square of the row number.  Use a `while' loop.
;; ---------
;;
;; A:
(defun triangle(rows)
  (let ((count 1) (total 0))
    (while (< count (1+ rows))
      (setq total (+ total (* count count)))
      (setq count (1+ count)))
    total))

(triangle 5)             ;55

;; Q:
;; Write a function similar to `triangle' that multiplies instead of adds the values.
;; ---------
;;
;; A:
(defun triangle-mul(rows)
  (let ((count 1) (total 1))
    (while (< count (1+ rows))
      (setq total (* total (* count count)))
      (setq count (1+ count)))
    total))

(triangle-mul 5)         ;14400


;; Q:
;; Rewrite these two functions recursively.  Rewrite these functions using `cond'.
;; ---------
;;
;; A:
(defun triangle-recursive (rows)
  (cond ((= rows 1) 1)
	(t (+ (* rows rows) (triangle-recursive (1- rows))))))
(triangle-recursive 5)        ;;55

(defun triangle-mul-recursive (rows)
 (cond ((= rows 1) 1)
       (t(* (* rows rows) (triangle-mul-recursive (1- rows))))))
(triangle-mul-recursive 5)    ;;14400

;; Q:
;; Write a function for Texinfo mode that creates an index entry at the
;; beginning of a paragraph for every `@dfn{bar}' within the paragraph.  (In a
;; Texinfo file, `@dfn{poo}' marks a definition.  This book is written in Texinfo.)
;; ---------
;;
;; A:
(defun create-index-for-dfn ()
  (interactive)
  (save-excursion
    (mark-paragraph)
    (save-restriction
      (let (dfns)
	(while (search-forward "@dfn" nil t)
	  (when (search-forward "{" nil t)
	    (let ((start (point)))
	      (when (search-forward "}" nil t)
		(forward-char -1)
		(let ((end (point)))
		  (setq dfns
			(cons
			 (buffer-substring start end)
			 dfns)))))))
	(forward-paragraph -1)
	(dolist (dfn dfns)
	  (insert (concat "@cindex " dfn "\n")))))))

