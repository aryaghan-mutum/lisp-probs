#lang racket

#| Define a procedure last-pair that returns the list that contains only the last
element of a given (nonempty) list: |#

;find the last element of the list
(define (last-pair list)
  (let ((tail (cdr list)))
    (if (null? tail)
        list
        (last-pair tail))))