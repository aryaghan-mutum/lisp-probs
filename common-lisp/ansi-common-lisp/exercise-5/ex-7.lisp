;; Define a function that takes a list of numbers and returns true iff the difference between each successive pair of them is 1, using
;; (a) recursion
;; (b) do
;; (c) mapc and return

;; (a) recursion
(defun rec-diff (lst)
  (if (null (cdr lst))
      t
      (and (= 1 (abs (- (first lst) (second lst))))
	   (rec-diff (cdr lst)))))

;; (b) do
(defun do-diff (lst)
  (do ((x (first lst) (first lst))
       (y (second lst) (second lst)))
      ((null (cdr lst)) t)
    (if (not (= (abs (- x y)) 1))
	(return nil)
	(setf lst (cdr lst)))))

;; (c) mapc and return
(defun mapc-diff (lst)
  (mapc #'(lambda (a b)
            (if (not (= (abs (- a b)) 1))
		(return-from mapc-diff nil))) lst (cdr lst))
  t)
