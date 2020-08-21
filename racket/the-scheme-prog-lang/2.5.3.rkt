#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

;; List the variables that occur free in each of the lambda expressions below.
;; Do not omit variables that name primitive procedures such as + or cons.

;; a.
(λ (f x) (f x))  ;no free variable

;; b.
(λ (x) (+ x x))  ;+

;; c.
(λ (x y) (f x y)) ;f

;; d.
(λ (x)
  (cons x (f x y)))  ; cons, f, y

;; e.
(λ (x)
  (let ((z (cons x y)))  ; cons, y
    (x y z)))

;; f.
(λ (x)
  (let ((y (cons x y))) ; cons, y, z
    (x y z)))
