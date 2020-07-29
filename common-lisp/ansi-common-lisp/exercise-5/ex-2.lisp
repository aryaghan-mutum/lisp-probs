;; Rewrite mystery (page 29) to use cond

;; Return nil if the list is nil 
;; Or return 1st position of the element x in the list, 

(defun mystery (x y)
  (if (null y)
      nil
      (if (eql (car y) x)
	  0
	  (let ((z (mystery x (cdr y))))
	    (and z (+ z 1))))))

(defun mystery-2 (x y)
  (cond ((null y) nil)
        ((eql (car y) x) 0)
        (t (let ((z (mystery-2 x (cdr y))))
             (and z (+ z 1))))))





