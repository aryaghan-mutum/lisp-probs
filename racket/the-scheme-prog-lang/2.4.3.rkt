#lang racket

;; The Scheme Programming Language Fourth Edition
;; R. Kent Dybvig
;; Solutions By: Anurag Muthyam <anu.drumcoder@gmail.com>

;; Rewrite the following expressions to give unique names to each different let-bound variable so that none of the variables is shadowed.
;; Verify that the value of your expression is the same as that of the original expression.

;; a.
(let ([x 'a] [y 'b])
  (list (let ([x 'c]) (cons x y))
        (let ([y 'd]) (cons x y))))  ;'((c . b) (a . d))

;; ans:
(let ([x 'a] [y 'b])
  (list (let ([new-x 'c]) (cons new-x y))
        (let ([new-y 'd]) (cons x new-y))))  ;'((c . b) (a . d))

;; b.

(let ([x '((a b) c)])
  (cons (let ([x (cdr x)])
          (car x))
        (let ([x (car x)])
          (cons (let ([x (cdr x)])
                  (car x))
                (cons (let ([x (car x)])
                        x)
                      (cdr x))))))   ;'(c b a b)
;; ans:
(let ([x '((a b) c)])
  (cons (let ([new-x (cdr x)])
          (car new-x))
        (let ([new-x2 (car x)])
          (cons (let ([new-x3 (cdr new-x2)])
                  (car new-x3))
                (cons (let ([new-x4 (car new-x2)])
                        new-x4)
                      (cdr new-x2))))))   ;'(c b a b)