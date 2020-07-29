;CONDITIONALS

; (AND): Evaluate the clauses one at a time. If a clause return Nil, stop and return Nil; otherwise go on to the next one. If all clauses yield non-NIL results, return the value of the last clause.
; (OR):  Evaluate the clauses one at a time. If a clause return something other than NIL, stop and return that value; otherwise go on to the next clause, or return NIL if nonw are left.

; AND and OR also conditionals. 

;------------------------------------
;Note: f you want to make a decision based on comparing a variable against a known set of constant values, "case" is more appropriate to use than "cond".
(let ((color :blue))
         (case color
            (:blue "b")
            (:green "g") 
            (:red "r")
            (otherwise "x")))
;-------------------------------------

;(4.1)
(defun make-even (x)
       (if (= (mod x 2) 0) x
        (+ x 1)))

;(4.2)
(defun further (x)
    (if (> x 0) (+ x 1)
        (- x 1)))

;(4.3)
(defun amy-not (x)
         (if x nil t))

;(4.4)
(defun ordered (x y)
      (if (> x y) (list y x)
                (list x y)))

;(4.6)
(defun my-abs (n)
   (cond ((< n 0) (- n))
                 (t n)))

;(4.7)
#|
;Doesn't work. Parenthesis errors. 
(defun test-1 (x)
        (cond (symbolp x) 'symbol
          (t 'not-a-symbol)))
|#
;Correct
(defun test-2 (x)
        (cond ((symbolp x) 'symbol)
          (t 'not-a-symbol)))

#|
;Doesn't work. Parenthesis errors. 
(defun test-1 (x)
        (cond (symbolp x) ('symbol))
          (t 'not-a-symbol)))

;Doesn't work. Parenthesis errors. 
(defun test-1 (x)
        (cond (symbolp x) 'symbol)
          ((t 'not-a-symbol)))
|#

;(4.8)
(defun emphasize2 (x)
        (cond ((equal (first x) 'good) (cons 'great (rest x)))
              ((equal (first x) 'bad) (cons 'awful (rest x)))
              (t x)))
(emphasize2 '(good day))   ;result: (GREAT DAY)
(emphasize2 '(bad day))    ;result: (AWFUL DAY)
(emphasize2 '(long day))   ;result: (LONG DAY)

(defun emphasize3 (x)
   (cond ((equal (first x) ’good) (cons ’great (rest x)))
         ((equal (first x) ’bad) (cons ’awful (rest x)))
         (t (cons ’very x))))
(emphasize3 '(very long day))

;(4.9)
(defun make-odd (x)
       (cond ((not (oddp x)) (+ x 1))
             ( t x)))

;(4.10)
(defun constrain (x max min)
         (cond ((< x min) min)
               ((> x max) max)
                       (t x)))

(constrain 3 -50 50)       ;result: 50
(constrain 92 -50 50)      ;result: -50

;(4.11)
(defun firstzero (x)
        (cond ((zerop (first x)) 'first)
              ((zerop (second x)) 'second)
              ((zerop (third x)) 'third)
              (t 'none)))

(firstzero '(3 0 4))   ;result: second

;(4.12)
(defun cycle (x)
       (cond ((zerop x) x)
             ((= x 99) 1)
             ((< x 0) x)
             (t (+ x 1))))

(cycle 99)  ;1
(cycle 0)   ;0
(cycle -9)  ;-9
(cycle 8)  ;9

;(4.13)
(defun howcompute (x y z)
        (cond ((equal (+ x y) z) 'sum-of)
              ((equal (* x y) z) 'product-of)
              (t '(beats me))))

(howcompute 3 4 7)  ;SUM-OF
(howcompute 3 4 12) ;PRODUCT-OF
(howcompute 3 4 9)  ;(BEATS ME)

;(4.14) AND OR
(and 'fee 'fie 'foe)         ;foe
(or 'fee nil 'foe)           ;fee
(or nil 'foe nil)            ;foe
(and 'fee 'fie nil)          ;Nil
(and (equal 'abc 'abc) 'yes) ;yes
(or (equal 'abc 'abc) 'yes)  ;T

;(4.15)
(defun geq (x y)
   (or (> x y) (equal x y)))

;(4.16)
(defun func (x)
        (cond ((and (oddp x) (> x 0)) (* x x))
              ((and (oddp x) (< x 0)) (+ x 2))
              (t (/ x 2))))

;(4.17)
(defun age (x y)
       (or (and (or (equal x 'boy) (equal x 'girl)) (equal y 'child))
       (and (or (equal x 'man)
       (equal x 'woman))
       (equal y 'adult))))

;(4.18)
(defun play-rock-paper-scissors (x y)
        (cond ((equal x y) 'tie)
              ((or (and (equal x 'rock) (equal y 'scissors)) 
                   (and (equal x 'scissors) (equal y 'paper)) 
                   (and (equal x 'paper) (equal y 'rock))) 'first-wins)
              (t 'second-wins)))

;(4.19)
#|
(cond ((not 'x) nil)
      ((not 'y) nil)
      ((not 'z) nil)
      (t 'w)))

(if x
  (if y
    (if z w)))
|#

;(4.20)
(defun compare (x y)
        (if (equal x y) 'equal
        (if (< x y) 'x-is-lesser-than-y
        'y-is-lesser-than-x)))

;(4.21)
;if
(defun gtest (x y)
        (if (> x y) t
          (if (zerop x) t
              (zerop y))))

;cond
(defun gtest (x y)
        (cond ((> x y) t)
              ((zerop x) t)
              (t zerop y)))

;(4.22)
(defun boilingp (temp scale)
      (or (and (> temp 212) (equal scale 'fahrenheit))
      (and (> temp 100) (equal scale 'celsius))))


;(4.29)
;using COND
(defun logical-and (p q)
      (cond ((and (equal p 't) (equal q 't) 'True))
            ((and (equal p 't) (equal q 'f) 'False))
            ((and (equal p 'f) (equal q 't) 'False))
            ((and (equal p 'f) (equal q 'f) 'False))
            (t 'In-correct-Input)))

;using IF
(defun logical-and (p q)
      (if (and (equal p 't) (equal q 't)) 'True
      (if (and (equal p 't) (equal q 'f)) 'False
      (if (and (equal p 'f) (equal q 't)) 'False
      (if (and (equal p 'f) (equal q 'f)) 'False
      'In-correct-Input)))))

;(4.30)
(defun logical-or (p q)
      (if (and (equal p 't) (equal q 't)) 'True
      (if (and (equal p 't) (equal q 'f)) 'True
      (if (and (equal p 'f) (equal q 't)) 'True
      (if (and (equal p 'f) (equal q 'f)) 'False
      'In-correct-Input)))))

;(4.31)
;NOT is not a conditional: It always evaluates its input. NOT is a
;boolean function because it returns T or NIL, so we do not need to
;write a LOGICAL-NOT function.

;(4.35)
;(and x y z) = (not (or (not x) (not y) (not z)))
;(or x y z) = (not (and (not x) (not y) (not z)))






























