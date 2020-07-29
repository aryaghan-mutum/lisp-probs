;; Suppose expensive is a function of one argument, an integer between 0 and 100 inclusive, that returns the 
;; result of a time-consuming com- putation. Define a function frugal that returns the same answer, 
;; but only calls expensive when given an argument it has not seen before.

(defun expensive (x)
  (* x x))

(let ((results (make-hash-table)))
  (defun frugal (x)
    (let ((res (gethash x results)))
      (if (null res)
          (setf (gethash x results) (expensive x))
          res))))
