#lang racket

#|
Exercise 1.18.
Using the results of exercises 1.16 and 1.17, devise a procedure that generates an
iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a
logarithmic number of steps

Ancient Egyptian multiplication in logarithmic number of steps
|#


(writeln "Method 1 to fast multiply in logarithmic steps")
(define (fast-mul a b)
  (define (double x) (+ x x))
  (define (halv x) (/ x 2))
  (define (mul-iter a counter sum)
    (cond ((= counter 0) sum)
          ((even? counter) (mul-iter (double a) (halv counter) sum))
          (else (mul-iter a (sub1 counter) (+ sum a)))))
  (mul-iter a b 0))

(fast-mul 2 5)

(writeln "Method 2 to fast multiply in logarithmic steps using letrec")
(define (fast-mul-letrec a b)
  (define (double x) (+ x x))
  (define (halv x) (/ x 2))
  (letrec ((mul-iter
            (lambda (a counter sum)                  
    (cond ((= counter 0) sum)
          ((even? counter) (mul-iter (double a) (halv counter) sum))
          (else (mul-iter a (- counter 1) (+ sum a)))))))
  (mul-iter a b 0)))

(fast-mul-letrec 2 5)


