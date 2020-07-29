#lang racket

;;Exercise 1.6

#|
Exercise 1.6: Alyssa P. Hacker doesn’t see why if needs to
be provided as a special form. “Why can’t I just define it as
an ordinary procedure in terms of cond?” she asks. Alyssa’s
friend Eva Lu Ator claims this can indeed be done, and she
defines a new version of if:
|#

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

(new-if (= 2 3) 0 5)
;5

(new-if (= 1 1) 0 5)
;0


;;we can replace if procedure with new-if:

(define (sqrt-root x)
  
  (define (average x y) (/ (+ x y) 2))
  (define (square n) (* n n))
  
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) .0001))
  
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (try guess)
    (new-if (good-enough? guess)
	guess
	(try (improve guess))))
  
  (try 1.0))


(sqrt-root 2)   
(sqrt-root 625) 
(sqrt-root pi)  
(sqrt-root 0.00000001) 

#|

new-if uses Applicative Order Evaluation, which means the interpreter first evalautes the arguments and then
applies the function.

`new-if` procedure causes infinite recursions
`if` procedure doesn't cause infinite recursions in this case. That is why if is a special form.

new-if is a procedure and not a special form, that is why it evalautes all the operations within the function.

|#
