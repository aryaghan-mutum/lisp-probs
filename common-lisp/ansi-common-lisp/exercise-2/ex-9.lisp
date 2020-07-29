;; A friend is trying to write a function that returns the sum of all the
;; non-nil elements in a list. He has written two versions of this function,
;; and neither of them work. Explain what's wrong with each, and give a correct version:

;;(a) 
;(defun summit (1st)
;  (remove nil 1st)
;    (apply #' + 1st))

;;Answer:
;;remove function is pure, and `nil` is a function 


;;(b) 
;(defun summit-2 (1st)
;   (let ((x (car 1st)))
;     (if (null x)
;         (summit-2 (cdr 1st))
;         (+ x (summit-2 (cdr 1st)))))))


;; Answer:
;; Need the extra if condition. Otherwise there would be an infinite
;; recursion with the first call to summit2
(defun summit-2 (lst)
  (if (null lst)
      0
      (let ((x (car lst)))
	(if (null x)
	    (summit-2 (cdr lst))
	    (+ x (summit-2 (cdr lst)))))))

(summit-2 nil)                 ;0
(summit-2 '(9 8 7 6))          ;30
(summit-2 '(9 8 7 nil 6))      ;30







