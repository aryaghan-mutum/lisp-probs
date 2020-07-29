#lang racket

#|
Exercise 1.12. Pascal’s triangle

          1
        1   1
      1   2   1
    1   3   3   1
  1   4   6   4   1

|#

(define (pascal-triangle row col)
    (if (or (= row 0) (= col row)) 1
        (+ (pascal-triangle (- row 1) (- col 1))
           (pascal-triangle (- row 1) col))))



 