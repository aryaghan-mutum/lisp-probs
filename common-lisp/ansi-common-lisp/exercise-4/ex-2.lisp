;; Read the description of reduce on page 368, then use it to define:
;; (a) copy-list
;; (b) reverse (for lists)

;; copy a list using reduce function:
(defun copy-list-using-reduce (lst)
  (reduce #'cons lst :from-end t :initial-value nil))

(copy-list-using-reduce '(1 2 3))      ;(1 2 3)
(copy-list-using-reduce '(a b c))      ;(A B C)

;; reverse a list using reduce function:
(defun reverse-list-using-reduce (lst)
  (reduce #'(lambda (x y) (cons y x)) lst :initial-value nil))

(reverse-list-using-reduce '(1 2 3))   ;(3 2 1)
(reverse-list-using-reduce '(a b c))   ;(C B A)



;; copy a list using without reduce function:
(defun copy-list-without-reduce (lst)
  (if (null lst)
      lst
      (cons (car lst) (copy-list-without-reduce (cdr lst)))))

(copy-list-without-reduce '(1 2 3))    ;(1 2 3)
(copy-list-without-reduce '(a b c))    ;(A B C)

;; reverse a list without reduce function:
(defun reverse-list-without-reduce (lst)
  (rev lst nil))

(defun rev (lst result)
   (if (null lst)
       result
     (rev (cdr lst) (cons (car lst) result))))

(reverse-list-without-reduce '(1 2 3))  ;(3 2 1)  
(reverse-list-without-reduce '(a b c))  ;(C B A)
