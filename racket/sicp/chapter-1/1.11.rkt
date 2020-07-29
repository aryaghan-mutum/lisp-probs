#lang racket

(require racket/trace)
#|
Exercise 1.11.
A function f is defined by the rule that
f(n) = n if n<3 and
f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>3.

Write a procedure that computes f by means of a recursive process.
Write a procedure that computes f by means of an iterative process. 
|#

;; recursive method:
(define (f-rec n)
    (if (< n 3)
        n
        (+ (f-rec (- n 1))
           (* 2 (f-rec (- n 2)))
           (* 3 (f-rec (- n 3))))))

(f-rec 4)

;; iterative method:
(define (f-iter n)
  (define (iter a b c count)
    (if (= count 0)
        a
        (iter b
              c
              (+ c (* 2 b) (* 3 a))
              (- count 1))))
  (iter 0 1 2 n))

(f-iter 4)

;; iterative method using letrec:
(define (f-iter-letrec n)
  (letrec ((f-iter (lambda (a b c count)
                (if (= count 0)
                    a
                    (f-iter b
                       c
                       (+ c (* 2 b) (* 3 a))
                       (- count 1))))))
    (f-iter 0 1 2 n)))

(f-iter-letrec 4)
                