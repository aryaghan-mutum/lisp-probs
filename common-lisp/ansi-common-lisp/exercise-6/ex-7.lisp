;; Define a function that takes one argument, a number, and returns true 
;; if it is greater than the argument passed to the function the last time it was called. The function should return n i l the first time it is called.


(let ((last nil))
  (defun greater-than-last-p (x)
    (let ((p last))
      (setf last x)
      (when (not (null p))
        (> x p)))))

(greater-than-last-p-p 8)
;NIL

(greater-than-last-p-p 50)
;T

(greater-than-last-p-p 40)
;NIL

(greater-than-last-p-p 41)
;T