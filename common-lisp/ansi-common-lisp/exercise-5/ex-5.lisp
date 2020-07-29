;; Define iterative and recursive versions of a function that takes an object x 
;; and vector v, and returns a list of all the objects that immediately precede x in v:

;;(precedes #\a "abracadabra") (#\c #\d #\r)

(defun precedes (x v)
  (let ((len (length v))
        (preds nil))
    (dotimes (i len)
      (when (and (> i 0) (eql x (aref v i)))
        (setf preds (union (list (aref v (- i 1))) preds))))
    preds))

(defun precedes-2 (x v)
  (precedes2-acc x v 0 (length v) nil))

(defun precedes-2-acc (x v i len preds)
  (if (= i len)
      preds
      (if (and (> i 0) (eql x (aref v i)))
          (precedes2-acc x v (+ i 1) len (union preds (list (aref v (- i 1)))))
          (precedes2-acc x v (+ i 1) len preds))))
