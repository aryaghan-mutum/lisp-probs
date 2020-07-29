#lang racket

#| a. The sum procedure is only the simplest of a vast number of similar abstractions that can be
captured as higher-order procedures. Write an analogous procedure called product that returns
the product of the values of a function at points over a given range. Show how to define factorial
in terms of product. Also use product to compute approximations to using the formula

b. If your product procedure generates a recursive process, write one that generates an iterative
process. If it generates an iterative process, write one that generates a recursive process. |#

(define (identity n) n)

(define (inc n) (add1 n))

(define (factorial n)
  (product identity 1 inc n))

(define (product term a next b) 
     (if (> a b)
         1 
         (* (term a) (product term
                              (next a)
                              next b))))

(define (appr-pi n)
  (define (term x)
    (if (odd? x)
        (/ (+ 1 x) (+ 2 x))
        (/ (+ 2 x) (+ 1 x))))
  (* 4 (product term 1 inc n)))

(define (product-iter term a next b)
  (define (iter a acc)
    (if (> a b) acc
        (iter (next a)
              (* (term a) acc))))
  (iter 1 1))

(appr-pi 6.0)