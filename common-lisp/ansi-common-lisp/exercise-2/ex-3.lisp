;; 3. Using car and cdr, define a function to return the fourth element of a list. 

(defun my-fourth (L)
    (car (cdr (cdr (cdr L)))))

(my-fourth '(10 20 30 40 50))         ;40
(my-fourth '(10 nul 'a :b))           ;B
(my-fourth '(10 '(1 2) :x '(a b c)))  ;(QUOTE (A B C))