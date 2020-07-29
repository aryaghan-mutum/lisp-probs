;; The contents of any hash table can be described by an assoc-list whose elements are (k . v), 
;; for each key-value pair in the hash table. Define a function that
;; (a) takes an assoc-list and returns a corresponding hash table 
;; (b) takes a hash table and returns a corresponding assoc-list

;; (a)
(defun hash-alist (ht)
  (let ((alist nil))
    (maphash #'(lambda (k v)
                 (push (cons k v) alist)) ht)
    alist))

;; (b)
(defun alist-hash (alist)
  (let ((ht (make-hash-table)))
    (dolist (key-value alist)
      (let ((key (car key-value))
            (value (cdr key-value)))
        (setf (gethash key ht) value)))
    ht))