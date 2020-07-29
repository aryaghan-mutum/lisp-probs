;; Define a function to take a square array (an array whose dimensions 
;; are (n n)) and rotate it 90° clockwise:

;; (quarter-turn #2A((a b) (cd)))
;; #2A((C A) (DB))

(defun quarter-turn (arr)
  (let* ((dim (array-dimensions arr))
         (row (first dim))
         (col (second dim))
         (quarter-array (make-array dim)))

    (do ((x (1- row) (1- x))
         (y 0 (1+ y)))
	((< x 0) 'done)
      (format t "~A~%" (aref arr x y)))))

(quarter-turn #2A((a b) (c d)))		 			;#2A((C A) (D B))

(quarter-turn #2A((a b c) (d e f) (g h i)))	;#2A((G D A) (H E B) (I F C))