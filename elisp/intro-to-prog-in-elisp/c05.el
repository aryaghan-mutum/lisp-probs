;; Author: Anurag Muthyam 

;; ***************************************
;; Chapter 5: A Few More Complex Functions
;; ***************************************


;; Q:
;; Write an interactive function with an optional argument that tests whether
;; its argument, a number, is greater than or equal to, or else, less than
;; the value of `fill-column', and tells you which, in a message.
;; However, if you do not pass an argument to the function, use 56 as a default value.
;; ---------
;;
;; A:
(defun compare-to-fill-column (&optional number)
  (interactive "P")
   (if (not number)
       (setq number 56))

     (cond ((= number fill-column)  (message "%d is = `fill-column'" number))
           ((>= number fill-column) (message "%d is >= `fill-column'" number))
           ((<= number fill-column  (message "%d is < `fill-column'" number)))))


(compare-to-fill-column 3)   ;3 is < `fill-column'

(compare-to-fill-column 100) ;100 is >= `fill-column'

(compare-to-fill-column 70)  ;70

(compare-to-fill-column)
