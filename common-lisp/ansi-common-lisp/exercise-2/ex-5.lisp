;; 5. What do these functions do?

;; (a)
(defun enigma (x)
   (and (not (null x))
       (or (null (car x))
       (enigma (cdr x)))))

;Answer: The funtion returns #t if the element of the list is nul.
(enigma '(1 2 3))                    ;NIL
(enigma '(1 (2 nul) 3))              ;NIL
(enigma '(a nil b))                  ;T

;; (b)
(defun mystery (x y)
  (if (null y)
      nil
      (if (eql (car y) x)
          0
          (let ((z (mystery x (cdr y))))
               (and z (+ z 1))))))

;Answer: The funtion returns the 1st position of the elem x in the list.
(mystery 'a '(b c d a e))            ;3
(mystery 'a '(b c d e e))            ;NIL