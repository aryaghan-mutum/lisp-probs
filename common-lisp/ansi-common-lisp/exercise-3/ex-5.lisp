;; Suppose the function pos+ takes a list and returns a list of each element plus its position:
;; Define this function using (a) recursion, (b) iteration, (c) mapcar


;; using recursion: 
(defun rec-pos+ (lst)
  (recursive-pos+ lst 0))

(defun recursive-pos+ (lst count)
  (if (null lst)
      '()
      (cons (+ (car lst) count) (recursive-pos+ (cdr lst) (+ 1 count)))))

(rec-pos+ '(1 2 3 4))     ;(1 3 5 7)
(rec-pos+ '(2 4 6 8))     ;(2 5 8 11)
(rec-pos+ '(0 9 7 3 1))   ;(0 10 9 6 5)


;; using iteration:
(defun iter-pos+ (lst)
  (do ((pos 0 (+ pos 1))
       (result '())
       (next lst (cdr next)))
      ((null next) (reverse result))
    (push (+ pos (car next)) result)))

(iter-pos+ '(1 2 3 4))    ;(1 3 5 7)
(iter-pos+ '(2 4 6 8))    ;(2 5 8 11)
(iter-pos+ '(0 9 7 3 1))  ;(0 10 9 6 5)


;; using mapcar 
(defun map-pos+ (lst)
        (let ((count 0))
          (mapcar #'(lambda (n)
                      (let ((result (+ count n)))
                        (setf count (+ 1 count))
                        result)) lst)))

(map-pos+ '(1 2 3 4))     ;(1 3 5 7)
(map-pos+ '(2 4 6 8))     ;(2 5 8 11)
(map-pos+ '(0 9 7 3 1))   ;(0 10 9 6 5)


