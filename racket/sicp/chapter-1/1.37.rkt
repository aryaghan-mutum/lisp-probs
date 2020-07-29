#lang racket

(define (cont-frac n d k)
  (define (recur i)
  (/ (n i)
     (+ ( d i)
        (if (= k i) 0
            (recur (+ 1 i))))))
  (recur 1))
