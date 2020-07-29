;; Define a version of bin-search (page 60) that takes :key, :test, : start , and :end 
;; arguments with the usual meanings and defaults

(defun bin-search (obj vec &key (key #'identity) (test #'eql) (start 0) (end (1- (length vec) )))
  (and (not (zerop (length vec)))
       (finder obj vec start end key test)))

(defun finder (obj vec start end keyfn testfn)
  (let ((range (- end start)))
    (if (zerop range)
        (if (funcall testfn obj (funcall keyfn (aref vec start)))
            obj
            nil)
        (let ((mid (+ start (round (/ range 2)))))
          (let ((obj2 (funcall keyfn (aref vec mid))))
            (if (< obj obj2)
                (finder obj vec start (- mid 1) keyfn testfn)
                (if (> obj obj2)
                    (finder obj vec (+ mid 1) end keyfn testfn)
                    obj)))))))