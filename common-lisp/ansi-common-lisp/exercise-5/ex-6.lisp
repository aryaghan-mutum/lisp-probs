;; Define iterative and recursive versions of a function that takes an object and a list, 
;; and returns a new list in which the object appears between each pair of elements in the original list:
;; (intersperse '- '(abed)) (A-B-C-D)

(defun recur-intersprese (obj lst)
  (cond ((null lst) nil)
        ((null (cdr lst)) (cons (car lst) nil))
        (t (cons (car lst)
	       (cons obj (recursive-intersprese obj (cdr lst)))))))

(defun iter-intersprese (obj lst)
  (let ((acc nil)
        (len (length lst)))
    (dotimes (i (- len 1))
      (push (list (nth i lst) obj) acc))

    (push (cons (nth (- len 1) lst) nil) acc)
    (reduce #'append (reverse acc))))