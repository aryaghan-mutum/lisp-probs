#lang racket

;reverse a list

#| Define a procedure reverse that takes a list as argument and returns a list of the
same elements in reverse order: |#

(define nil '())

;reverse items in list
(define (reverse list)
  (define (reverse-iter list acc)
    (if (null? list)
        acc
        (reverse-iter (cdr list) (cons (car list) acc))))
  (reverse-iter list nil))
