#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

;; How might the primitive procedure list be defined?

(define our-list
  (λ x x))

(our-list)    ;'()
(our-list 1)  ;'(1)
(our-list 1 2) ;'(1 2)
(our-list 1 '(2 3)) ;'(1 (2 3))

