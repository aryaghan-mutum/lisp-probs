;(and x y) = (not (or (not x) (not y)))
;(or x y) = (not (and (not x) (not y)))

(defun demorgan-and (x y)
   (not (or (not x) (not y))))

(defun demorgan-and (x y)
   (not (and (not x) (not y))))


