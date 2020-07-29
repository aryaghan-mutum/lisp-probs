#lang racket

;;Define a procedure cubic that can be used together with the newtons-method procedure in expressions of the form

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c)
  (lambda (x) (+ (cube x)
                 (* a (square x))
                 (* b x)
                 c)))

  
  
  
  