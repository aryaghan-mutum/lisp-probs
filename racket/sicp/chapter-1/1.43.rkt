#lang racket

(require racket/trace)


(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated-m1 f n)
  (if (= 1 n) f
      (compose f (repeated-m1 f (- n 1)))))


(define (repeated-m2 f n)
  (cond ((zero? n) (lambda (x) x))
        (else (compose f
                       (repeated-m2 f (sub1 n))))))

((repeated-m1 sqr 2) 5)
((repeated-m2 sqr 2) 5)

(trace repeated-m2)
(repeated-m2 sin 25)