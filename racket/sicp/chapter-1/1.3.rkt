#lang racket

#|
Exercise 1.3. Define a procedure that takes three numbers as arguments and returns the sum of the
squares of the two larger numbers.
|#

(define (square x) (* x x))

;; Squares all the three nums and adds the sum
;; Finds the min values from the the three nums and square the num
;; Subtracts the value of the sum with the the min val that is squared
(writeln "Method 1:")

(define (sum-of-squares-larger-m1 x y z)
    (- (+ (square x) (square y) (square z))
       (square (min x y z))))

(sum-of-squares-larger-m1 2 2 4)  ;20
(sum-of-squares-larger-m1 2 3 4)  ;25
(sum-of-squares-larger-m1 3 2 4)  ;25
(sum-of-squares-larger-m1 3 4 2)  ;25


(writeln "Method 2:")

(define (sum-of-sqrs sq1 sq2)
  (+ (square sq1) (square sq2)))

(define (sum-of-squares-larger-m2 x y z)
  (let ((min-num (min x y z)))
    (cond ((= min-num x) (sum-of-sqrs y z))
          ((= min-num y) (sum-of-sqrs x z))
          ((= min-num z) (sum-of-sqrs x y)))))

(sum-of-squares-larger-m2 2 2 4)  ;20
(sum-of-squares-larger-m2 2 3 4)  ;25
(sum-of-squares-larger-m2 3 2 4)  ;25
(sum-of-squares-larger-m2 3 4 2)  ;25

;; Method 3 is similar to Method 1, but the difference is Method 3 uses `let` expression
(writeln "Method 3:")
(define (sum-of-squares-larger-m3 x y z)
    (let ((sum-ofthree-sqrs (+ (square x) (square y) (square z)))
          (sqrd-min-num (square (min x y z))))
      (- sum-ofthree-sqrs sqrd-min-num)))
                 
(sum-of-squares-larger-m3 2 2 4)  ;20
(sum-of-squares-larger-m3 2 3 4)  ;25
(sum-of-squares-larger-m3 3 2 4)  ;25
(sum-of-squares-larger-m3 3 4 2)  ;25


     
    

    