;; 1. Translate the following expressions into equivalent expressions that don't use let or let*, 
;; and don't cause the same expression to be evaluated twice.
;;
;; (a) (let ((x (car y))) (cons x x))
;; (b) (let* ((w (car x)) (y (+ v z)))
;; (cons w y))

;; (a)
;; method 1:
(do ((x (car y))) 
    (t (cons x x)))

;; method 2:
(setf let1
      ((lambda (y)
         ((lambda (x)
            (cons x x))
          (car y)))
       '(a b)))      ;(A . A)

;; (b)
;; method 1:
(do* ((w (car x))
      (y (+ w z)))
     (t (cons w y)))

;; method 2:
(setf z 10)
(setf let2
      ((lambda (x)
         ((lambda (w)
            ((lambda (y)
               (cons w y))
             (+ w z)))
          (car x)))
       '(1 2)))       ;(1 . 11)
