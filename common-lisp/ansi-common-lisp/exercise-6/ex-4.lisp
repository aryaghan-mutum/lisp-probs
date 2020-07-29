;; Modify most (page 105) to return, as two values, the two highest- scoring elements of a list.

(defun most (fn lst)
  (if (null lst)
      (values nil nil)
      (let* ((max (funcall fn (car lst)))
             (max2 (funcall fn (cadr lst))))
        (dolist (obj (cddr lst))
          (let ((score (funcall fn obj)))
            (if (> score max)
                (setf max2 max
                      max score)
                (if (> score max2)
                    (setf max2 score)))))
        (values max max2))))


(most #'length '((a b) (a b c) (a b c d)))
; 4
; 2

(most #'identity '(10 20))
; 10
; 20

(most #'identity '(-20 -21))
; -20
; -21

(most #'identity '(1 2 3 4))
;; 4
;; 3

