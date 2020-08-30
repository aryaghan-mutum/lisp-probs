#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

;; The procedure length returns the length of its argument, which must be a list. For example,
;; (length '(a b c)) is 3. Using length, define the procedure shorter,
;; which returns the shorter of two list arguments. Have it return the first list if they have the same length.
;; (shorter '(a b) '(c d e)) (a b)
;; (shorter '(a b) '(c d)) (shorter '(a b) '(c)) (c)

(define (shorter lst1 lst2)
  (let ((lenx (length lst1))
        (leny (length lst2)))
    (cond ((< lenx leny) lst1)
          ((< leny lenx) lst2)
          ((= lenx leny) lst1))))
          
(shorter '(a b) '(c d e))   ;'(a b)
(shorter '(a b) '(c d))     ;'(a b)
(shorter '(a b) '(c))       ;'(c)
(shorter '(a) '(1))         ;'(a)