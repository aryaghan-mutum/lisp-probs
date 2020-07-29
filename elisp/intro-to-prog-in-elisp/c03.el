;; Author: Anurag Muthyam 

;; *******************************************
;; Chapter 3: How to Write Function Definition
;; *******************************************


;; Q:
;;Write a non-interactive function that doubles the value of its argument, a number.
;;Make that function interactive.
;; ---------
;;
;; A:
(defun double-value-of-arg (number)
  "Doubles the value of the NUMBER"
  (* number 2))

(defun double-value-of-arg (number)
  "Doubles the value of the NUMBER"
  (interactive "p")
  (message "The result is %d" (* number 2)))



;; Q: Write a function that tests whether the current value of `fill-column' is greater than the argument passed to the function,
;; and if so, prints an appropriate message.
;; ---------
;; 
;; A:
(defun curr-value-is-greater-than-arg-p (value)
  "Verify the value of the `fill-column' is > than value"
  (interactive "p")
  (if (> value fill-column)
	 (message "%d is > than `fill-column'" value)
	 (message "%d is < than `fill-column'" value)))

(curr-value-is-greater-than-arg-p 3)
(curr-value-is-greater-than-arg-p 100)


