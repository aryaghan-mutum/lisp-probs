;; Modify the program in Figure 3.6 to use fewer cons cells. (Hint: Use dotted lists.) 

;elt: element we last saw
;n: number of times in a row
;lst: part of the list need to examine.
;n-elts: to get something representing n elts

;Compress: 
(defun compress (lst)
  (if (consp lst)
      (compr (car lst) 1 (cdr lst))
      lst))

(defun compr (elt n lst)
  (if (null lst)
      (list (n-elts elt n) nil)
      (let ((next (car lst)))
        (if (eql next elt)
            (compr elt (+ n 1) (cdr lst))
            (cons (n-elts elt n)
                  (compr next 1 (cdr lst))))
   )))
   

(defun n-elts (elt n)
  (if (> n 1)
      (cons n elt)
      elt))
              
(compress '(1 1 0 0 1 1 1 0 1 0 0))           ;((2 . 1) (2 . 0) (3 . 1) 0 1 (2 . 0) NIL)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Uncompress:
(defun uncompress (lst)
  (if (null lst)
      nil 
      (let ((elt (car lst))
            (cdr (uncompress (cdr lst))))
        (if (consp elt)
            (append (apply #'list-of elt)
                    cdr)
            (cons elt cdr))
  )))

(defun list-of (n elt)
  (if (zerop n)
      nil
      (cons elt (list-of (- n 1) elt))))
                     
(uncompress '((2 1) (2 0) (3 1) 0 1 (2 0)))   ;'(1 1 0 0 1 1 1 0 1 0 0)