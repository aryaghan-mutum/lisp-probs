#lang racket

#|
Exercise 1.19.
There is a clever algorithm for computing the Fibonacci numbers in a logarithmic
number of steps.
|#
(define (fib n)
    (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (square p) (square q))
                     (+ (* 2 p q) (square q))
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))

(define (square n) (* n n))

(fib 2)
(fib 100000)