;FUNCTIONS AND DATA

;(1.1) Arithmetic procedures: 
(defun add (x y) (+ x y))

(defun mul (x y) (* x y))

(defun div (x y) (/ x y))

(defun sub (x y) (- x y))

(defun abs (n)
       (if (> n 0) n
       (- n)))

;;invoke
;(abs (add 2 -4))  ;result: 2 

;(1.2)
;Symbols: AARDVARK, PLUMBING, 1-2-3-GO, ZEROP, ZERO, SEVENTEEN. 
;Numbers: 87, 1492, 3.14159265358979, 22/7, 0, −12.

;(1.3)
(defun less-than (x y)
        (if (< x y) T
        Nil))

(defun is-odd? (n)
        (if (= (mod n 2) 1) T
        Nil))

(defun are-equal? (str-1 str-2)
        (if (equal str-1 str-2) T
        Nil))

(defun number-p (x)
           (if (/ x 1) "Number"
           "Not a Num"))

;(1.4)
(defun sub2 (x) (- x 2))

;(1.5)
(defun twop (x)
       (if (= x 2) T
       Nil))

(defun zero? (x)
       (if (= x 0) T
       Nil))

;(1.6)
(defun half (x) (/ x 2))   ;it is same as (defun div (x y) (/ x y))

;(1.7)
(defun multi-digit-p (x)
        (if (> x 9) T
        Nil))

;(1.8)
;The function computes the negation of a number, in other words, it
;switches the sign from positive to negative and vice versa.
(defun switch-sign (x)
        (- 0 x))

;(1.9)
(defun add2 (x) (+ x 2))
(defun equal-p (x y)
        (if (= x y) T
        Nil))
;(equal-p (add2 3) 5) ;result: T
;(equal-p (add2 3) 6) ;result: Nil

(defun two-more-p (x y)
        (cond ((> (add2 x) y) "Greater")
              ((= (add2 x) y) "Equal")
              ((< (add2 x) y) "Lesser")))
;(two-more-p 4 2) ;result: "Greater"
;(two-more-p 2 4) ;result: "Equal"
;(two-more-p 1 5) ;result: "lesser"

(defun two-less-p (x y)
        (cond ((> (sub2 x) y) "Greater")
              ((= (sub2 x) y) "Equal")
              ((< (sub2 x) y) "Lesser")))
;(two-more-p 4 2) ;result: "Equal"
;(two-more-p 2 4) ;result: "Lesser"
;(two-more-p 6 2) ;result: "Greater"

;(1.11)
(defun avg (x y) (/ (+ x y) 2))

;(1.12) returns T if its 1st input is more than half of it 2nd input
(defun more-than-half-p (x y)
            (if (> x (/ y 2)) T
            Nil))
;(1.13) 
;The function always returns T, since the output of NUMBERP (either T
;or NIL) is always a symbol.

;(1.14) Predicates: NUMBERP, SYMBOLP, ZEROP, ODDP, EVENP, <, >, EQUAL, NOT
(defun not-p (x)
        (cond ((equal x T)  Nil)
              ((equal x Nil) T)
              ("Nil")))
;(not-p Nil) ;result T
;(not-p 12) ;result Nil

;(1.15)
(defun not-one-p (x)
        (if (not (equal x 1)) T
        Nil))

;(1.16)
(defun not-plus-p (x)
        (if (not (> x 1)) T
        Nil))

;(1.17)
(defun even-p (x)
        (if (= (mod x 2) 0) "Even"
        "Odd"))

;(1.18) The predicate returns T only when its input is −2.
(defun add1 (x) (+ x 1))
(defun zero? (x)
       (if (= x 0) T
       Nil))
;(zero? (add1 (add1 -2)))  ;result: T

;(1.19) 
;(not (not Nil)        ;result: Nil
;(not (not T)          ;result: T
;(not (not "RUTABAGA") ;result: T

;(1.20) XOR is (not (equal))

;(1.21)
;=> 'zero?' gives the result in T of Nil. When 'zero?' is passed as a param to 'add1', the 'add1' cannot add symbols with 1. It thorws and error.

;=> '+' takes 2 nums as input and adds them. When '+' is passed a as a pram to 'equal', it throws an error because 'equal' requires two inputs.

;=> Throws an error because 'not' takes only one input, not two.


;(1.22)  All predicates are functions. Not all functions are predicates. Because not all functions can answer 'Yes' or 'No' questions.

;(1.23) EQUAL, NOT, < and > are few predicates whose names do not end with 'P'

;(1.24) Numbers and Symbols are both Symbols.

;(1.25) The symbol FALSE is true in Lisp because it is non-NIL.

;(1.26) 
;a. False: ZEROP does not accept T or NIL as input. 
;b. True:  All the predicates produce output as either T or NIL. Lisp has solely a few exceptions to this rule.

;(1.27)
(defun even-p (x)
        (if (= (mod x 2) 0) "Even"
        "Odd"))
;(even-p "asdf")  ;result: Error. Not an expected type REAL
;(even-p 3 5)     ;result: Error. Too many arguments in call

              













