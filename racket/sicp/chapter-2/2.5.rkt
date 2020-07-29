#lang racket

#| Show that we can represent pairs of nonnegative integers using only numbers and
arithmetic operations if we represent the pair a and b as the integer that is the product 2^a 3^b. Give the
corresponding definitions of the procedures cons, car, and cdr. |#

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (extract-expt a n)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (iter n acc)
    (if (divides? a n)
        (iter (/ n a) (+ 1 acc))
        acc))
  (iter n 0))

(define (car z) (extract-expt 2 z))

(define (cdr z) (extract-expt 3 z))
