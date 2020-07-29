;; Author: Anurag Muthyam 

;; ************************************
;; Chapter 9: How Lists are Implemented
;; ************************************

;; Q:
;; Set `flowers' to `violet' and `buttercup'.  Cons two more flowers on to this
;; list and set this new list to `more-flowers'.  Set the CAR of `flowers' to a
;; fish.  What does the `more-flowers' list now contain?
;; ---------
;;
;; A:
(setq flowers '(violet buttercup))      ;(violet buttercup)
(setq more-flowers (cons 'jasmine (cons 'lupine flowers2))) ;(jasmine lupine lilly violet buttercup)
(setq more-flowers 'fish)   ;fish 
