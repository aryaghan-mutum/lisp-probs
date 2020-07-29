#lang racket


(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; Method 1:
(writeln "Using letrec")
(define (count-change-using-letrec amount)
  (letrec ((cc (lambda (amount kind-of-coins)
                 (cond ((= amount 0) 1)
                       ((or (< amount 0) (= kind-of-coins 0)) 0)
                       (else
                        (let* ((a (first-denomination kind-of-coins))
                               (b (- amount a))
                               (c (- kind-of-coins 1)))
                          (+ (cc b kind-of-coins)
                             (cc amount c))))))))
    (cc amount 5)))
             
(count-change-using-letrec 10)  ;4
(count-change-using-letrec 100) ;292

; Method 2:
(writeln "Using nested functions")
(define (count-change-using-nested-funcs amount)
  (define (cc amount kind-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kind-of-coins 0)) 0)
          (else
           (let* ((a (first-denomination kind-of-coins))
                  (b (- amount a))
                  (c (- kind-of-coins 1)))
             (+ (cc b kind-of-coins)
                (cc amount c))))))
  (cc amount 5))
             
(count-change-using-nested-funcs 10)  ;4
(count-change-using-nested-funcs 100) ;292

; Method 3: Taken from SICP. page 38
(writeln "Using two different functions")
(define (count-chnage amount)
  (cc amount 5))

(define (cc amount kind-of-coins)
   (cond ((= amount 0) 1)
          ((or (< amount 0) (= kind-of-coins 0)) 0)
          (else (+ (cc (- amount
                          (first-denomination kind-of-coins))
                kind-of-coins)
          (cc amount
              (- kind-of-coins 1))))))
                
(count-chnage 10)  ;4
(count-chnage 100) ;292



         
  



         
  