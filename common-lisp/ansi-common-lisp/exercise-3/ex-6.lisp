;; After years of deliberation, a government commission has decided that
;; lists should be represented by using the cdr to point to the first element
;; and the car to point to the rest of the list. Define the government
;; versions of the following functions:

;; (a) cons
;; (b) list
;; (c) length (for lists)
;; (d) member (for lists; no keywords) 

;; (a) cons
(defun gov-cons (e1 e2)
  (cons e2 e1))

(gov-cons 2 4)                 ;(4 . 2)
(gov-cons '(1 3 5) '(2 4 6))   ;((2 4 6) 13 5)

(defun gov-car (lst)
  (cdr lst))

(gov-car '(1 2 3 4 5 6))       ;(2 3 4 5 6)

(defun gov-cdr (lst)
  (car lst))

(gov-cdr '(1 2 3 4 5 6))       ;1

(equal (cdr (cons 'a nil)) (car (gov-cons 'a nil)))   ;T
(equal (car (cons 'a nil)) (cdr (gov-cons 'a nil)))   ;T

;; (b) list
(defun gov-list (lst)
  (if (null lst)
      lst
      (gov-cons (gov-cdr lst) (gov-list (gov-car lst)))))

(gov-list '(1 2 3 4 5 6))      ;((((((NIL . 6) . 5) . 4) . 3) . 2) . 1)

;; (c) length (for lists)
(defun gov-length (lst)
  (if (null lst)
      0
      (+ 1 (gov-length (gov-cdr lst)))))

(gov-length '(1 2 3 4 5 6))

;; (d) member (for lists; no keywords) 
(defun gov-member (elem lst)
  (if (null lst)
      lst 
      (if (eql elem (gov-car lst))
          (cdr lst)
        (gov-member elem (gov-cdr lst)))))

(gov-member 3 (gov-list '(10 4 3 9 8 0)))     ;3
(gov-member 'b (gov-list '(a b c d e f)))     ;B
(gov-member 'o (gov-list '(a b c d e f)))    ;NIL

        

