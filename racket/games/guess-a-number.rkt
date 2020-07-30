;; Guess my number game

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Version 1:

(define lower 1)
(define upper 100)

(define guess
  (lambda ()
    (quotient (+ lower upper) 2)))

(define smaller
  (lambda ()
    (set! upper (max lower (sub1 (guess))))
    (guess)))

(define bigger
  (lambda ()
    (set! lower (min upper (add1 (guess))))
    (guess)))

;(smaller)
;(bigger)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Version 2:
(define start
  (lambda (x y)
    (set! lower (min x y))
    (set! upper (max x y))
    (guess)))

(start 1 100)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
