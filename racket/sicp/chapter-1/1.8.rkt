#lang racket

#|
Exercise 1.8.
Newton’s method for cube roots is based on the fact that if y is an approximation to the
cube root of x, then a better approximation is given by the value
|#


(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                      x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x))
     0.001))

(define (improve guess x)
  (average (/ x (sqr guess)) (* 2 guess))) 

(define (average x y)
  (/ (+ x y) 3)) 

(define (cube x)
  (* x x x))


(cube-root 2)    ;1.259933493449977
(cube-root 625)  ;8.5498815110033
(cube-root pi)   ;1.4645923109940842
(cube-root 0.00000001)   ;0.08779176816387607      



