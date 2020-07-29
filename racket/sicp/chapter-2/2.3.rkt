#lang racket

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
 (newline)
 (display "(")
 (display (x-point p))
 (display ",")
 (display (y-point p))
 (display ")"))

(define (make-segment start end) (cons start end))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (print-segment seg)
  (let ((start (start-segment seg))
        (end (end-segment seg)))
    (print-point start)
    (print-point end)))

(define (make-rectangle upper-left-corner width height)
  (cons upper-left-corner
        (cons width height)))

(define (width rect) (car (cdr rect)))

(define (height rect) (cdr (cdr rect)))

(define (area rect)
  (* (width rect)
     (height rect)))

(define (perimeter rect)
  (* 2 (+ (width rect)
          (height rect))))

  

