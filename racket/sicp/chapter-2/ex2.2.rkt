#lang racket

;; taken from https://github.com/jimweirich/sicp-study/blob/master/scheme/chapter2/ex2_02.scm
;; page 81 SICP EX: 2.2

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (point-add a b)
  (make-point
   (+ (x-point a) (x-point b))
   (+ (y-point a) (y-point b))))

(define (point-scale x point)
  (make-point
   (* x (x-point point))
   (* x (y-point point))))

(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (midpoint segment)
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (point-scale 0.5 (point-add start end))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(make-point 2 3)            ;'(2 . 3)
(x-point (make-point 2 3))  ;2
(y-point (make-point 2 3))  ;3

(point-add (make-point 2 3) (make-point 6 7))      ;'(8 . 10)
(point-scale 9 (make-point 2 3))                   ;'(18 . 27)
(make-segment (make-point 2 3)  (make-point 6 7))  ;'((2 . 3) 6 . 7)
(start-segment (make-point 2 3))   ;2
(end-segment (make-point 2 '(3 4)))   ;'(3 4)
