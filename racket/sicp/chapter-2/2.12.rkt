#lang racket

#| Define a constructor make-center-percent that takes a center and a percentage
tolerance and produces the desired interval. You must also define a selector percent that produces
the percentage tolerance for a given interval. The center selector is the same as the one shown
above. |#

(define (make-interval a b) (cons a b))

(define (upper-bound z)
  (max (car z)
       (cdr z)))

(define (lower-bound z)
  (min (car z)
       (cdr z)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (width i)
  (/ (- (upper-bound i)
        (lower-bound i))
     2))

(define (make-center-percent c p)
  (let ((w (* c p 0.01)))
    (make-center-width c w)))

(define (percent i)
  (let ((w (width i))
        (c (center i)))
    (* 100.0 (/ w c))))

  