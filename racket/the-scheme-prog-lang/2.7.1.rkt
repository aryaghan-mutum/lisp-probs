#lang racket
(require rackunit)
;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

;; Define the predicate atom?, which returns true if its argument is not a pair and false if it is.
(define atom?
  (λ (x)
    (not (pair? x))))

(check-eqv? (atom? '()) #t)
(check-eqv? (atom? 1) #t)
(check-eqv? (atom? 'symbol) #t)
(check-eqv? (atom? string) #t)
(check-eqv? (atom? '(1 2 3)) #f)
(check-eqv? (atom? (cons 1 2)) #f)

(define atom2?
  (λ (x)
    (if (empty? x)
        #t
       (not (pair? x)))))

(check-eqv? (atom2? '()) #t)
(check-eqv? (atom2? 1) #t)
(check-eqv? (atom2? 'symbol) #t)
(check-eqv? (atom2? string) #t)
(check-eqv? (atom2? '(1 2 3)) #f)
(check-eqv? (atom2? (cons 1 2)) #f)
