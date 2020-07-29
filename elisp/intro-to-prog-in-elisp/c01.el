;; Author: Anurag Muthyam 

;; **************************
;; Chapter 1: List Processing
;; **************************


;; Q: Generate an error message by evaluating an appropriate symbol that is not within parentheses.
;;---------
;;
;; A: 
+
;; *** Eval error ***  Symbol’s value as variable is void: +


;; Q: Generate an error message by evaluating an appropriate symbol that is between parentheses.
;; ---------
;;
;; A:
(lisp)
;; *** Eval error ***  Symbol’s function definition is void: lisp


;; Q: Create a counter that increments by two rather than one.
;; ---------
;;
;; A: 
(setq counter 0)
(setq counter (+ counter 2))


;; Q: Write an expression that prints a message in the echo area when evaluated
;; ---------
;;
;; A:
(message "Emacsis is a powerful tool")
(message "my name is %s %s. I am %d years old." "anurag" "muthyam" 100)
(message "There are %s %s in the dog park" (+ 2 3) "bull dogs")
