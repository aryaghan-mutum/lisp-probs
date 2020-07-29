#lang racket

(define (cont-frac-iter n d k)
  (define (iter k acc)
    (if (= 0 k) acc
        (iter (- k 1) (/ (n k)
             (+ (d k) acc)))))
  (iter k 0))

(define (appr-e k)
  (define (n i) 1)
  (define (divides? a b)
    (= 0 (remainder b a)))
  (define (d i)
    (if (divides? 3 (+ 1 i))
        (* 2 (/ 3 (+ 1 i))) 1))
  (+ 2.0 (cont-frac-iter n d k)))