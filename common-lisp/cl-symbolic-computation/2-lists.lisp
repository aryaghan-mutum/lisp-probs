;LISTS

; Inside computer's memory, lists are organized as chains of 'cons cells'. The cons cells are linked together by 'pointers'.
; Each cons cell has two pointers
; When we say 'lists' cotains numbers and symbols as elements. It means, the cons cells contain pointers to numbers ot symbols.

; CONS: It makes a single cons cell
; LIST: It makes a new ocns cell chain list out of however many inputs it receives.

; NOTE:
; CAR and CDR accepts only lists as input
; FIRST  = CAR 
; REST   = CDR
; SECOND = CADR 
; THIRD  = CADDR
; NIL is the only LISP object that is both symbol and a list

;(2.1)
(list "to" "be" "or" "not" "to" "be")  ;result:  ("to" "be" "or" "not" "to" "be")
(list :to :be :or :not :to :be)        ;result:  (:TO :BE :OR :NOT :TO :BE)

(cons (cons (cons (cons (cons (cons "to" "be") "or") "not") "to") "be") Nil)
;Note: Each cons cell is a small piece of memory, split into two to hold two address(pointers) to other places in memory 
;where the actual data (like "be" or Nil or another cons cell) is stored.
;Also, on most computers, pointers are 4 bytes long, so each cons cells is 8 bytes.

;(2.2)
;(list "a" "b" (list "c"))                 ;Improperly balanced.
(list (list "a") (list "b"))               ;Properly balanced. result: (("a") ("b"))
;(list list "a") (list "c" "d"))           ;Improperly balanced.
;(list "a" (list "b" (list "c"))           ;Improperly balanced.
(list "a" (list "b" (list "c")))           ;Properly balanced. result: ("a" ("b" ("c")))
(list (list "a") (list "b") (list "c"))    ;Properly balanced. result: (("a") ("b") ("c"))

;(2.3)
(cons (cons (cons "please" "be") "my") "valentine")   ;result: ((("please" . "be") . "my") . "valentine")

;(2.4) ;(("bows" "arrows") ("flowers" "chocolates"))
(cons (cons "bows" "arrows") (cons "flowers" "chocolates"))

;(2.5) Length
(length (list "open" "the" "pod" "bay" "doors" "hal"))  ;result: 6
;=> 3
;=> 4
;=> 4
;=> 5
;=> 6

;(2.6)
;()        = Nil
;(())      = (Nil)
;((()))    = ((Nil))
;(() ())   = (Nil Nil)
;(() (())) = (Nil (Nil))

(list (list "a") (list "b" "c") (list "d"))  ;result: (("a") ("b" "c") ("d"))
(list (list "a" "b") (list "c" "d"))         ;result: (("a" "b") ("c" "d"))
(equal (list (list "a") (list "b" "c") (list "d")) (list (list "a" "b") (list "c" "d")))  ;result: Nil

;(2.7)
(defun my-second (x)
         (second x))  
;(my-second (list "honk" "if" "you" "like" "geese")) result: "if"

;(2.8)
(rest (list "honk" "if" "you" "like" "geese"))                 ;result: ("if" "you" "like" "geese")
(rest (rest (list "honk" "if" "you" "like" "geese")))          ;result: ("you" "like" "geese")
(first (rest (rest (list "honk" "if" "you" "like" "geese"))))  ;result: "you"
(defun my-third (lst)
        (first (rest (rest lst))))     
;(my-third (list "honk" "if" "you" "like" "geese"))            ;result: "you"

;(2.9)
(defun my-third (lst)
        (second (rest lst))) 
;(my-third (list "honk" "if" "you" "like" "geese"))            ;result: "you"

;Functons operate on pointers:
;when we say that an object such as a list or symbol is an input to a function, we are speaking informally.
;Inside the computer, everything is done with pointers, so the real input to the function isn't the object itself, but a pointer to the object.
;Likewise, the result returned by a function is really a pointer. Computer scientist would say that the pointer lives "in a register" or "on the stack"1

;(2.10)
(cons (cons (cons "phone" Nil) "home") Nil)        ;result: ((("phone") . "home"))
(car (cons (cons (cons "phone" Nil) "home") Nil))  ;result: (("phone") . "home")
(cdr (cons (cons (cons "phone" Nil) "home") Nil))  ;result: Nil

;(2.12) CADDDR returns the 4th element of a list. 

;(2.13) (((FUN)) (IN THE) (SUN))
;CAAAR = FUN 
;CAADR = IN
;CADADR = THE
;CAADDR = SUN

;(2.15)  ((A B) (C D) (E F))
;CAR   = (A B)
;CDDR  = (E F)
;CADR  = (C D)
;CDAR  = (B)
;CADAR = B
;CDDAR = NIL
;CAAR  = A
;CDADDR = (F)
;CADADDR = F

;(2.16) (FRED NIL)?
;CAAR takes the CAR of the CAR. The CAR of (FRED NIL) is FRED, and the CAR of that causes an error.

;(2.17)
(car (list "post" "no" "bills"))        ;result: "post"
(cdr (list "post" "no" "bills"))        ;result ("no" "bills")
(car (list (list "post" "no") "bills")) ;result: ("post" "no")
(cdr (list "bills"))                    ;result: Nil
;(car (list bills))                     ;result: Error. Not a list
(cdr (list "post" (list "no" "bills"))) ;result: (("no" "bills"))
(cdr (list (list "post" "no" "bills"))) ;result: Nil
(car (list Nil))                        ;result: Nil

;(2.18)
(defun some-func (x y)
        (cons (cons x y) Nil))

;(2.19)
(list "fred" "and" "wilma")            ;result: ("fred" "and" "wilma")
(list "fred" (list "and" "wilma"))     ;result: ("fred" ("and" "wilma"))
(cons "fred" (list "and" "wilma"))     ;result: ("fred" "and" "wilma")
(cons Nil Nil)                         ;result: (Nil)
(list Nil Nil)                         ;result: (Nil Nil)

;(2.20)
(list Nil)                             ;result: (Nil)
(list T Nil)                           ;result: (T Nil)
(cons T Nil)                           ;result: (T)
(cons (cons T Nil) Nil)                ;result: ((T))
(list (list "in" "one" "ear" "and") (list "out" "the" "other"))   ;result: (("in" "one" "ear" "and") ("out" "the" "other"))
(cons (list "in" "one" "ear" "and") (list "out" "the" "other"))   ;result: (("in" "one" "ear" "and") "out" "the" "other")

;(2.21)
(defun 4-input-func (a b c d) 
       (list (list a b) (list c d)))   ;(4-input-func 1 "s" 4 -3)    ;result: ((1 "s") (4 -3))

;(2.22)
(defun duo-cons (a b c)
        (cons a (cons b (list c))))    ;(duo-cons "patrick" "seymour" "marvin")  ;result: ("patrick" "seymour" "marvin")

;(2.23)
(defun two-deeper (a b)
         (list (list a b)))            ;(two-deeper 3 4)       ;result: ((3 4))   

(defun two-deeper-cons (a b)
         (cons (cons a b) Nil))        ;(two-deeper-cons 3 4)  lresult: ((3 . 4))

;(2.24)  The CAAADR function

;(2.25)
;Q. Why do cons cells and the CONS func share the same name?
;A. CONS stands for ‘‘construct.’’ It constructs and returns a new cons cell.

;(2.26)
;Q. What do these two functions do when given the input (A B C)?
;A. The first function returns the length of the CDR of its input. The second function causes an error because it tries to take the CDR of a number (the output of LENGTH).

;(2.27)
;Q. When does the internal representation of a list involve more cons cells than the list has elements?
;A. Nested lists require more cons cells than the list has top-level elements. Flat lists always have exactly as many cons cells as elements.

;(2.28)
;Q. Using just CAR and CDR, is it possible to write a func that returns the last element of a list, no matter how long the list is? Explain.
;A. It’s not possible to write a function to extract the last element of a list of unknown length using just CAR and CDR, because we don’t know how
    ;many CDRs to use. The function needs to keep taking successive CDRs until it reaches a cell whose CDR is NIL; then it should return the CAR of that cell.

;(2.29)

;(2.30) CDDR subtracts two from a unary number.

;(2.31) NULL is the unary ZEROP predicate.

;(2.32)
(defun unary-greaterp (a b)
         (> (length (list a)) (length (list b))))

;(2.33) CAR returns a true value for any unary number greater than zero, so it is the unary equivalent of PLUSP.

;(2.34)
(cons :a (cons :b (cons :c :d)))   ;result: (:A :B :C . :D)

;(2.35)
(list (cons :a :b) (cons :c :d))   ;result: ((:A . :B) (:C . :D))

;(2.36)







 






































