;; 8. Give iterative and recursive definitions of a function that

;; (a) takes a positive integer and prints that many dots.

;using iteration:
(defun print-dots-iter (n)
  (do ((i 0 (+ i 1)))
      ((>= i n) (format t "~%"))
      (format t ".")))

;using recursion:
(defun print-dots-rec (n)
  (if (> n 0)
     (progn
       (format t ".")
       (print-dots-rec (- n 1)))
    (format t "~%")))

      
;; (b) takes a list and returns the number of times the symbol occurs in it. 

;using iteration 
(defun count-iter (L)
  (let ((nb-a 0))
    (dolist (x L)
      (if (eql x 'a)
    (setf nb-a (+ nb-a 1))))
    nb-a))

(count-iter '())                ;0
(count-iter '(a b c))           ;1
(count-iter '(a a a))           ;3
(count-iter '(1 2 3))           ;0

;using recursion 
(defun count-rec (L)
  (if (null L)
    L
    (if (eql (car L) 'a)
        (+ 1 (count-rec (cdr 1)))
        (count-rec (cdr 1)))))




