#lang racket

#|
Exercise 1.17.
The exponentiation algorithms in this section are based on performing exponentiation
by means of repeated multiplication. In a similar way, one can perform integer multiplication by
means of repeated addition. The following multiplication procedure (in which it is assumed that our
language can only add, not multiply) is analogous to the expt procedure:
number of steps. 
|#

;; if b = 0 then return 0
;; else (a + (a * (b-1))

;; method 1
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(* 2 5) ;10
#|
Recursive Process:
(+ 2 (* 2 (- 5 1)))
(+ 2 2 (* 2 (- 4 1)))
(+ 2 2 2 (* 2 (- 3 1)))
(+ 2 2 2 2 (* 2 (- 2 1)))
(+ 2 2 2 2 2 (* 2 (- 1 1)))
(+ 2 2 2 2 2 (* 2 0))
(+ 2 2 2 2 2 0)
(10
|#

#|
This algorithm takes a number of steps that is linear in b. Now suppose we include, together with
addition, operations double, which doubles an integer, and halve, which divides an (even) integer
by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic
|#

;; Multiple two numbers using egyptian multiplication
(define (egyptian-multiplication a b)
  (define (double n) (+ n n))
  (define (half n) (quotient n 2))
  (define (even? n) (zero? (modulo n 2)))
  (cond ((zero? a) 0)
        ((even? a) (egyptian-multiplication (half a) (double b)))
        (else (+ b (egyptian-multiplication (half a) (double b))))))

(egyptian-multiplication 2 5)

(define (fast-multiply a b)
    (define (double n) (* n 2))
    (define (halv n) (/ n 2))
    (cond ((= b 0) 0)
          ((even? b) (fast-multiply (double a) (halv b)))
          (else (+ a (fast-multiply a (sub1 b))))))

(fast-multiply 2 5) ;10

#|
Process:
1 (fast-multiply 2 5) -> b is odd
2 (fast-multiply 2 4) -> b is even
3 (fast-multiply 4 2) -> b is even
4 (fast-multiply 8 1) -> b is odd
5 (fast-multiply 8 0) -> b is even
6 (fast-multiply 10 0) -> b is even and b = 0
7 10
|#





