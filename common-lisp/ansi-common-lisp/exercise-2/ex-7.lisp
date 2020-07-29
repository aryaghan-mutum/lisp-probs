;; 7. Using only operators introduced in this chapter, define a function that
;; takes a list as an argument and returns true if one of its elements is a list.

(defun contains-listp (L)
  (if (null L)
      L
      (if (listp L)
          "true"
          "not a list")))

(contains-listp nil)                 ;NIL
(contains-listp 1)                   ;"not a list"
(contains-listp '(2 3 5 7))          ;true
(contains-listp '(2 null '(a b) 7))  ;"true"