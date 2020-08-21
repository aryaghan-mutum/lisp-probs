#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

#|
(car (car '((a b) (c d)))) yields a.
Determine which compositions of car and cdr applied to ((a b) (c d)) yield b, c, and d.
|#

(car (car '((a b) (c d))))  ;a

(car (cdr (car '((a b) (c d)))))  ;b

(car (car (cdr '((a b) (c d)))))  ;c

(car (cdr (car (cdr '((a b) (c d)))))) ;d