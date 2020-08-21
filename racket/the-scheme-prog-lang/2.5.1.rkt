#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

(let ((f (λ x x)))
  (f 1 2 3 4))

;;a 
(let ((f (λ (x) x)))
  (f 'a))            ;a

;;b
(let ((f (λ x x)))
  (f 'a))           ;'(a)
  
;;c
(let ((f (λ (x . y) x)))
  (f 'a))                   ;'a

;;d
(let ((f (λ (x . y) y)))
  (f 'a))                   ;'()

