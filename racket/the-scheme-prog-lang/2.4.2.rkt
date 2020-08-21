#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

;; Determine the value of the following expression. Explain how you derived this value.
(let ((x 9))
  (* x
     (let ((x (/ x 3)))
       (+ x x))))  ;;54

;; explaination:
;; evaluates this expression 1st 
(define x 9)
(let ((x (/ x 3)))
       (+ x x))  ;;6

;; then evaluates this
(* x 6)  ;54


