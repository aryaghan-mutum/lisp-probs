;; Define a function that takes a list and prints it in dot notation:

(defun show-dots (lst)
  (dots lst 0))

(defun dots (lst counter)
  (if (null lst)
      (progn 
        (format t " NIL")
        (dotimes (i counter)
          (format t ")")))
      (progn 
        (format t " (~A ." (car lst))
        (dots (cdr lst) (+ counter 1)))))

(show-dots '(1 2 3 4))
(show-dots '(a b c d))

