#lang racket

#| The sum procedure above generates a linear recursion. The procedure can be rewritten
so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in
the following definition: |#

(require racket/trace)


(define (sum term a next b)
  (define (sum-iter a acc)
    (if (> a b) acc
        (sum-iter (next a) (+ (term a) acc))))
  (sum-iter a 0))

; test
(define (pi-sum a b) 
  (define (pi-term x) 
          (/ 1.0 (* x (+ x 2)))) 
  (define (pi-next x) 
          (+ x 4)) 
  (sum pi-term a pi-next b))

(* 8 (pi-sum 1 1000)) ;3.139592655589782
