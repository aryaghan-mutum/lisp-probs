
;; 4. Define a function that takes two arguments and returns the greater of the two.

(defun greater-of-two (x y)
  (if (> x y)
      x
      y))

(greater-of-two 2 3)                 ;3
(greater-of-two 3 2)                 ;3