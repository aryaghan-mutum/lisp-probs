 #lang racket

(require racket/trace)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (print-rat x)
  (println (format "~a/~a" (numer x) (denom x))))

(define (numer n) (car n))
(define (denom n) (cdr n))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;n1/d1 + n2/d2 = (n1*d2 + n2*d1)/d1+d2
(define (+rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (denom x) (numer y)))
            (* (denom x) (denom y))))


;;n1/d1 - n2/d2 = (n1*d2 - n2*d1)/d1+d2
(define (-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (denom x) (numer y)))
            (* (denom x) (denom y))))

;;n1/d1 * n2/d2 = (n1*n2)/(d1*d2)
(define (*rat x y)
  (make-rat (* (numer x) (numer y))
               (denom x) (denom y)))

;;(n1/d1)/(n2/d2) = (n1*d2)/(d1*n2)
(define (/rat x y)
  (make-rat (* (numer x) (denom y))
               (denom x) (numer y)))

;;(n1/d1) = (n2/d2) if and only if n1d2 = n2d1
(define (=rat x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(print-rat (+rat one-third one-third))  ;"2/3"
(print-rat (+rat one-third one-half))   ;"5/6"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




