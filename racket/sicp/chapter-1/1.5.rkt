#lang racket

#|
Exercise 1.5. Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is
using applicative-order evaluation or normal-order evaluation. He defines the following two
procedures: 
|#

(define (p) (p))

(define (test x y)
    (if (= x 0)
        0
        y))

(test 0 (p))

; Note: 'p'is defined recursively.

#|
Applicative-order evaluation: will lead to an infinite recursion in this case, because in applicative order evaluation,
the arguments are evaluated first and then the function is applied.

AQE: We can say it is: "Evaluate the args and then apply!"


Normal-order evaluation: The 'p' value is not evaluated, and the test will return 0. In Normal-order ealuation, the arguments
are not evalued first like Applicative-order evaluation. Here the expression are expanded until it reaches one operator to apply.

NOE: We can say it is: "Fully expand and reduce"
|#


;Normnal Order Eval:
(if (= 0 0)
    0
    (p))
