#lang racket

;; Exercise 1.16
;; Fast Eexponential algorithm in logerethimic complexity
#|
Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt.

(Hint: Using the observation that
(b^n/2)^2 = (b^2)^n/2

keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product abn is unchanged
from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process.
In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)
|#

#|
Iterative process for fast exponential:
Base counter   product 
2       5        1    
2       4        2         
4       2        2
16      1        2
16      0        32
|#

;; if n = even, then: (sqr b) (/ p 2) product    -> (b^2 p/2 product)
;; if n = odd, then: b (sub1 p) (* base prdocut) -> (b   p-1 (b* product)
(define (square x) (* x x))
(require racket/trace)

; (b^n/2)^2 = (b^2)^n/2
(writeln "Fast exponential using Iterative Process")
(define (fast-expt-p1 base pow)
  (define (fast-iter base counter product)
    (if (zero? counter)
        product

(writeln "Method 1: Fast way to do exponential")
(define (fast-expt b n)
  (define (fast-iter b counter product)
    (if (= counter 0) product
        (if (even? counter)
            (fast-iter (square base) (/ counter 2) product)
            (fast-iter base (- counter 1) (* product base)))))
  (fast-iter base pow 1))

(fast-expt-p1 2 5)

;(fast-expt 2 3)


(writeln "Method 2: Fast way to do exponential")
(define (fast-expt2 b p)
  (letrec ((fast-iter
            (lambda (b p product)
              (if (= p 0)
                  product
                  (if (even? p)
                      (fast-iter (sqr b)
                                 (/ p 2)
                                 product)
                      (fast-iter b
                                 (sub1 p)
                                 (* b product)))))))
    (fast-iter b p 1)))

(fast-expt2 2 3)

#|
(trace fast-iter)
(fast-iter 2 3 1)
(fast-iter 2 2 2)
(fast-iter 4 1 2)
(fast-iter 4 0 8)
8;
|#


; (b^n/2)^2 = (b^2)^n/2
(writeln "Fast exponential using Iterative Process (letrec)")
(define (fast-expt-using-letrec-p2 base pow)
  (letrec ((fast-iter
            (lambda (base counter product)
              (if (zero? counter)
                  product
                  (if (even? counter)
                      (fast-iter (square base) (/ counter 2) product)
                      (fast-iter base (- counter 1) (* product base)))))))
            (fast-iter base pow 1)))

(fast-expt-using-letrec-p2 2 5)

; (b^n/2)^2 = (b^2)^n/2
(writeln "Fast exponential using Iterative Process using two functions")
(define (fast-expt-p3 base pow)
  (fast-iter base pow 1))

(define (fast-iter base counter product)
  (if (zero? counter)
        product
        (if (even? counter)
            (fast-iter (square base) (/ counter 2) product)
            (fast-iter base (- counter 1) (* product base)))))

(fast-expt-p3 2 5)
  
