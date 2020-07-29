#lang racket

;; gcd procedure 
(define (gcd a b)
   (if (= b 0)
       a
       (gcd b (remainder a b))))

;; Applicative order: Evaluates all args before invoking function. Result = 2

#|
(gcd 206 40)                  
(gcd 40 (remainder 206 40))   
(gcd 40 6)                    
(gcd 6 (remainder 40 6))      
(gcd 6 4)                     
(gcd 4 (remainder 6 4))       
(gcd 4 2)                     
(gcd 2 (remainder 4 2))       
(gcd 2 0)                     
|#
;; Normal order. Doesn't evaluate args until user needs it. Result = 2
(gcd 206 40)

(gcd 40 (remainder 206 40))

(if (zero? (remainder 206 40))
    40
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(if (zero? (remainder 40 (remainder 206 40)))
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40)) 
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(gcd (remainder 40 (remainder 206 40)) 
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (zero? (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) 
                               (remainder 40 (remainder 206 40))))))

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) 
                           (remainder 40 (remainder 206 40)))))

(if (zero? (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40) 
                           (remainder 40 (remainder 206 40)))))
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) 
                               (remainder 40 (remainder 206 40))))))

(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))

