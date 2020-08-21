#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>


;; Rewrite the following expressions, using let to remove common subexpressions and to improve the structure of the code.
;; Do not perform any algebraic simplifications.

(define a 2)
(define b 3)
(define c 4)

;; a.
(+ (- (* 3 a) b) (+ (* 3 a) b)) ;12

(let ((x (* 3 a)))
  (+ (- x b) (+ x b)))  ;12

;; b.
(cons (car (list a b c)) (cdr (list a b c))) ;'(2 3 4)

(let ((lst (list a b c)))
  (cons (car lst) (cdr lst)))  ;'(2 3 4)
