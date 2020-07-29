;EVAL NOTATION

; Variables are not symbols; variables are names by symbols
; Functions are also names by symbols
; Whether symbols are used as data in a function definition or are passed as inputs when the function is called, they must be quoted to prevent evaluation.
; List also need to be quoted to use them as data; otherwise Lisp will try to evaluate them ad results in "undefined error"
; Quote prevents the lists from being evaluated.
; A Quoted list of symbol evaluates to itself, without the quote.
; QUOTE is a special func. Its input doesn't get evaluated. The QUOTE func returnns simply its inputs. For ex: (quote (hello world)) ;(hello world)
; Conceptually, a symbol is a blok of 5 pointers, one of which is points to the representation of the symbol's name
; Strings are used to store the names of symbols; a symbol and its name are two different things.
; EVAL and APPLY are list primitive funcs. They both are related to each other.
; Apply takes a func and a list of objects as input. The first arg to APPLY must be quoted with #'

;(3.1)
(not (equal 3 (abs -3)))   ;result: Nil

;(3.2)
(/ (+ 8 12) 2)             ;result: 10

;(3.3)
(+ (* 3 3) (+ 4 4))        ;result: 25

;(3.5)
(defun half (x) (/ x 2))
(defun cube (x) (* x x x))
(defun onemorep (x y) (equal x (+ y 1)))

;(3.6)
(defun pythag (x y) (+ (* x x) (* y y)))

;(3.7)
(defun miles-per-gallon (initial-odometer-reading final-odometer-reading gallons-consumed)
       (/ (- final-odometer-reading initial-odometer-reading) gallons-consumed))

;(3.9)
(cons 5 (list 6 7))                     ;result: (5 6 7)
(cons 5 '(list 6 7))                    ;result: (5 LIST 6 7)
(list 3 'from 9 'gives (- 9 3))         ;result: (3 FROM 9 GIVES 6)
(+ (length '(1 foo 2 moo))
        (third '(1 foo 2 moo)))         ;result: 6
(rest '(cons is short for construct))   ;result: (IS SHORT FOR CONSTRUCT)

;(3.10)
(third '(the quick brown fox))          ;result: BROWN
(list 2 'and 2 'is '4)                  ;result: (2 AND 2 IS 4)
(+ 1 (length (list t t t t)))           ;result: 5
(cons 'patrick '(seymour marvin))       ;(PATRICK SEYMOUR MARVIN)
(cons 'patrick (list 'seymour 'marvin)) ;(PATRICK SEYMOUR MARVIN)

;(3.11)
(defun longer-than (x y)
        (> (length x) (length y)))

;(3.12)
(defun addlength (x) (list (length x) x))   
(addlength '(moo goo gai pan))     ;result: (4 (MOO GOO GAI PAN)) 
(addlength (addlength '(a b c)))   ;result: (2 (3 (A B C)))

;(3.13)
(defun call-up (caller callee)
         (list 'hello callee 'this 'is caller 'calling))   ;result: (HELLO WANDA THIS IS FRED CALLING)

;(3.14)
(defun crank-cal (caller callee)
        '(hello callee this is caller calling))            ;result: (HELLO CALLEE THIS IS CALLER CALLING)

;(3.15)
(defun scrabble (word) (list word 'is 'a 'word))    
(scrabble 'aardvark)   ;result: (AARDVARK IS A WORD)
(scrabble 'word)       ;result: (WORD IS A WORD)

;(3.16)
(defun stooge (larry more curly)
        (list larry (list 'moe curly) curly 'larry))
(stooge 'mome 'curly 'larry)  ;result: (MOME (MOE LARRY) LARRY LARRY)

;(3.17)
;T and NIL are the names of constants that always evaluate to
;themselves. Therefore they can’t be used to name variables that hold
;the inputs to a function

;(3.19)
(cons 'grapes '(of wrath))        ;result: (GRAPES OF WRATH)
(list t 'is 'not nil)             ;result: (T IS NOT NIL)
(first '(list moose goose))       ;result: LIST
(first (list 'moose 'goose))      ;result: MOOSE
(cons 'home '(sweet home))        ;result: (HOME SWEET HOME)

;(3.20)
(defun mystery (x)
        (list (second x) (first x)))
 
(mystery '(dancing bear))         ;result: (BEAR DANCING)
;(mystery 'dancing 'bear)         ;result: Error. Too many arguments in call 
(mystery '(zowie))                ;result: (NIL ZOWIE)
(mystery (list 'first 'second))   ;result: (SECOND FIRST)

;(3.21) What's wrong?
;(defun speak (x y) (list ’all ’x ’is ’y))         ;Throws an Error. Vars shouldn't be quoted
;(defun speak (x) (y) (list ’all x ’is y))         ;Throws an Error. Function can’t have 2 argument lists
;(defun speak ((x) (y)) (list all 'x is 'y))       ;Throws an Error. Don’t parenthesize vars in the argument list and don’t quote variables

;(3.22)
;(b).
(+ 3 5)                       ;8
;(3 + 5)                      ;Error: Car of (3 + 5) is not a function name or lambda-expression 
;(+ 3 (5 6))                  ;Error: Car of (5 6) is not a function name or lambda-expression.
(+ 3 (* 5 6))                 ;33
'(morning noon night)         ;(MORNING NOON NIGHT)
;('morning 'noon 'night)      ;Error: Car of ('MORNING 'NOON 'NIGHT) is not a function name
(list 'morning 'noon 'night)  ;(MORNING NOON NIGHT)
(car nil)                     ;Nil
;(+ 3 foo)                    ;Error: Unbound variable: FOO
;(+ 3 'foo)                   ;Error: The value FOO is not of the expected type NUMBER.

;(c).
(defun myfun (x y) (list (list x) y))
(myfun 'alpha 'beta)          ;result: ((ALPHA) BETA)

;(d).
(defun firstp (x y) 
       (equal x (first y)))
(firstp :a (list :a :b :c))   ;result: T
(firstp :b (list :a :b :c))   ;result: Nil

;(e).
(defun mid-add1 (x) (list 'Take (+ x 1) 'Cookies))
(mid-add1 4)                  ;result: (TAKE 5 COOKIES)

;(f).
(defun f-to-c (temp) (/ (* 5 (- temp 32)) 9))
(defun c-to-f (temp) (+ 32 (* temp (/ 9 5))))

;(g). (defun foo x) (+ 1 (zerop x))  ;Error: The value X is not of the expected type LIST.

;(3.23)
;DOUBLE: λn. n×2
;SQUARE: λn. n×n
;ONEMOREP: λ(x,y). x=(y+1)

;(3.24)
(defun alpha (x)
       (bravo (+ x 2) (charlie x 1)))

(defun bravo (y z) (* y z))
(defun charlie (y x) (- y x))

(alpha 3)   ;result: 10

;(3.25)
(list 'cons t nil)                   ;(CONS T NIL)
(eval (list 'cons t nil))            ;(T)
;(eval (eval (list 'cons t nil)))    ;Error: Undefined function T called with arguments () .
(apply #' cons '(t nil))             ;(T)
(eval nil)                           ;NiL
(list 'eval nil)                     ;(EVAL NIL)
(eval (list 'eval nil))              ;NIL





















