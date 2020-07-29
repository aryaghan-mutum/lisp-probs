;; Define a function that takes a list and returns a list indicating the
;; number of times each (eql) element appears, sorted from most common
;; element to least common: 
     
(defun occurences (lst)
  (let ((res '()))
    (dolist (i lst)
      (let ((start (assoc i res)))
	(if (null start)
	    (push (cons i 1) res)
	    (setf (cdr start) (+ (cdr start) 1)))))
    (sort res (lambda (x y) (> (cdr x) (cdr y))))))


(occurences '(a b a d a c d c a))  ;;((A . 4) (C . 2) (D . 2) (B . 1))
        

