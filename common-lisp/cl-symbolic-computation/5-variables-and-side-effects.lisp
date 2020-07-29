;VARIABLES AND SIDE EFFECTS

; LET special func is used to create local vars
; LET* special func is similar to LET, except it creates the local vars one at a time instead of all at once.
; SETF is a macro function that assigns a val to var, or changes the value if it already has one. Ths side effect "assignment" is what makes SETF useful.

; COMMENTS:
; By convention, LISP comments appear in one of three places:
  ;1. Comments appearing in the right of a line begin with 1 semicolon.
  ;2. comments inside a func that occupy a line by themselves are preceded by 2 semicolons.
  ;3. Comments that begin at the left margin, appearing outside a func definition are peceded by 3 semicolons

;(5.1)
(defun poor-style (p)
   (setf p (+ p 5))
   (list 'result 'is p))
(poor-style 8)   ;(RESULT IS 13)

(defun good-style (p)
        (let ((q (+ p 5)))
        (list 'result 'is q)))
(good-style 8)   ;(RESULT IS 13)

;example-1 of LET*
(defun price-change (old new)
        (let* ((diff (- new old))
               (proportion (/ diff old))
               (percentage (* proportion 100.0)))
            (list 'widgets 'changed 'by percentage 'percent)))

;example-2 of LET*
(defun faulty-size-range (x y z)
       (let* ((biggest (max x y z))
              (smallest (min x y z))
              (r (/ biggest smallest 1.0)))
           (list 'factor 'of r)))

;a bad coin example 
(defun coin-with-bug ()
      (cond ((< (random 101) 50) 'heads)
            ((> (random 101) 50) 'tails)
            ((equal (random 101) 50) 'edge)))

;a good coin exmaple
(defun fair-coin ()
       (let ((toss (random 101)))
          (cond ((< toss 50) 'heads)
                ((> toss 50) 'tails)
                (t 'edge))))

;(5.2)
; Q. What is a Side Effect?
; A. A side effect is something a function does besides returning a value. Assignment is an example of a side effect.

;Comments example:
(defun emc2 (m)
       (let ((c 300000.0))  ;speed of light in km/spec
          ;; E is energy
          ;; m is mass
          (* m c c)))

;(5.6)
;a. American Casino game
(defun throw-die ()
   (+ 1 (random 6)))

;b.
(defun throw-dice ()
   (list (throw-die) (throw-die)))

;c.
(defun snake-eyes-p (throw)
      (equal throw '(1 1)))

(defun boxcars-p (throw)
   (equal throw '(6 6)))

;d.
(defun throw-value (throw)
       (+ (first throw) (second throw)))

(defun instant-loss-p (throw)
     (member (throw-value throw) '(2 3 12)))

;e.
(defun say-throw (throw)
        (cond ((snake-eyes-p throw) 'snake-eyes)
              ((boxcars-p throw) 'boxcars)
              (t (throw-value throw))))

;f.
(defun craps ()
  (let ((throw (throw-dice)))
  (append
   (list 'throw (first throw)
   'and (second throw)
    '--
    (say-throw throw)
    '--)
    (cond ((instant-win-p throw) '(you win))
          ((instant-loss-p throw) '(you lose))
          (t (list 'your 'point 'is
               (throw-value throw)))))))

;g.
(defun try-for-point (point)
    (let* ((throw (throw-dice))
        (val (throw-value throw)))
      (append
        (list 'throw (first throw)
        'and (second throw)
        '--
        (say-throw throw)
        '--)
        (cond ((equal val point) '(you win))
              ((equal val 7) '(you lose))
              (t '(throw again))))))








