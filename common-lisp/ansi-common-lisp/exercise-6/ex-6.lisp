;; Define a function that takes one argument, a number, and returns the greatest argument passed to it so far.

(let ((max nil))
  (defun max-num (x)
    (if (or (null max) (> x max))
        (setf max x)
        max)))

(max-num 4)  ;4
(max-num 10) ;10
(max-num 4)  ;10

