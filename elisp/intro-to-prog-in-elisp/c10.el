;; Author: Anurag Muthyam 

;; *****************************
;; Chapter 10: Yanking Text Back
;; *****************************

;; Q:
;; Using `C-h v' (`describe-variable'), look at the value of your kill ring.
;; Add several items to your kill ring; look at its value again.  Using `M-y'
;; (`yank-pop)', move all the way around the kill ring.  How many items were in
;; your kill ring?  Find the value of `kill-ring-max'.  Was your kill ring full,
;; or could you have kept more blocks of text within it?
;; ---------
;;
;; A:

;; To find the value of `kill-ring-max'
kill-ring-max

;; check if the `kill ring` is full or not
(= kill-ring-max (length kill-ring))

;;store more text in the kill ring
(- kill-ring-max (length kill-ring))

;; Q:
;; Using `nthcdr' and `car', construct a series of expressions to
;; return the first, second, third, and fourth elements of a list.
;; ---------
;;
;; A:

;; using `car' and `cdr'
(setq L1 '(1 2 3 4 5))
(setq first-elem (car L1))                     ;1
(setq second-elem (car (cdr L1)))              ;2
(setq third-elem (car (cdr (cdr L1))))         ;3
(setq third-elem (car (cdr (cdr (cdr L1)))))   ;4

;; using `car' `cdr' and `nthcdr'
(setq L2 '(1 2 3 4 5))
(car (nthcdr 0 L2))  ;1
(car (nthcdr 1 L2))  ;2
(car (nthcdr 2 L2))  ;3
(car (nthcdr 3 L2))  ;4


      
      
