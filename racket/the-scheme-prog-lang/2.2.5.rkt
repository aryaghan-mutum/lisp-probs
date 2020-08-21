#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

;(car (car (car '((a b) (c d))))) ;error

'((a.b) ((c) (d)) (()))

(cons (cons 'a 'b)
      (cons (cons (cons 'c null) (cons (cons 'd null) null))
            (cons (cons null null) null)))