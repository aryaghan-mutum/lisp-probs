;; Author: Anurag Muthyam 

;; ******************************************************
;; Chapter 7: `car', `cdr', `cons': Fundamental Functions
;; ******************************************************

;; `cons' : Construct
;; `car'  : Contents of the Address part of the Register
;; `cdr'  : Contents of the Decrement part of the Register

;; Q:
;; Construct a list of four birds by evaluating several expressions with cons.
;; Find out what happens when you cons a list onto itself. Replace the first element of the
;; list of four birds with a fish. Replace the rest of that list with a list of other fish.
;; ---------
;;
;; A:

'(crow cardinal penguin parrot)

;; construct a list
(setq birds (cons 'crow (cons 'cardinal (cons 'penguin (cons 'parrot nil)))))

;; construct a list onto itself
(cons birds birds)

;; replace the first element of the list with a fish 
(setcar birds 'fish) 

;; replace the rest of the list with a list of fish 
(setcdr birds '(marlin salmon flounder))
