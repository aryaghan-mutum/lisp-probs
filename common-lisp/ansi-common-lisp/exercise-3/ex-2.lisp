;; Write a version of union that preserves the order of the elements in the original lists: 

(defun new-union (lst1 lst2)
  (let ((res  nil))
    (dolist (i lst1)
      (pushnew i res))
    (dolist (i lst2)
      (pushnew i res))
    (reverse res)))
      

(union '(a b c) '(b a d))       ;;(D A B C)
(new-union '(a b c) '(b a d))   ;;(A B C D)
