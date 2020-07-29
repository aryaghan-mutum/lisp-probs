;; Define a function that returns the square of its argument, and which does not compute 
;; the square if the argument is a positive integer less than or equal to 5.

(defun square (x)
  (if (and (integerp x)
           (> x 0)
           (<= x 5))
      (* x x)))