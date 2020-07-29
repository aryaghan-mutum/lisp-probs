;; 2. Give three distinct cons expressions that return (a b c).

(cons 'a (cons 'b (cons 'c nil)))     ;(A B C)
(cons 'a (cons 'b '(c)))              ;(A B C)
(cons 'a '(b c))                      ;(A B C)