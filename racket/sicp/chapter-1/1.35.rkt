#lang racket

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? x y)
      (< (abs (- x y)) tolerance))
    (define (try guess)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

(define (phi)
    (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))