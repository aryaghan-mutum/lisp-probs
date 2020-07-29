#lang racket

(define (square x) (* x x))

(define (f g)
       (g 2))

(f square) ;4
(f (lambda (z)
     (* z (+ z 1)))) ; 6

;;What happens if we ask the interpreter to evaluate the combination (f f)? Explain.

(f f)
(f 2)
(2 2)
; when evalaution happens for (2 2), the interpreter shall throw an error. Because 2 is not relevant.
