;LIST DATA STRUCTURES

; APPEND takes 2 lists as input. it returns a list containing all the elements of the 1st list followed by all the elements of the 2nd.

; a. CONS creates 1 new cons cell. It is often used to add an element to the front of a list.
; b. LIST makes new list by accepting a arbitary number of inputs and building a chain of cons cells ending in NIL. The car of each cell points to the corresponding input.
; c. APPEND appends list together by copying its first input and making the cdr of th last cell of the copy print to the 2nd input. It is an error for the 1st input to APPEND to be a non-list.
  
;Examples on CONS, LIST, APPEND

(cons 'rice '(and beans))               ;(RICE AND BEANS)
(list 'rice '(and beans))               ;(RICE (AND BEANS))
;(append 'rice '(and beans))            ;Error: The value RICE is not of the expected type LIST.

(cons '(here today) '(gene tomorrow))   ;((HERE TODAY) GENE TOMORROW)
(list '(here today) '(gone tomorrow))   ;((HERE TODAY) (GONE TOMORROW))
(append '(here today) '(gone tomorrow)) ;(HERE TODAY GONE TOMORROW)

(cons '(eat at) 'joes)                  ;((EAT AT) . JOES)
(list '(eat at) 'joes)                  ;((EAT AT) JOES)
(append '(eat at) 'joes)                ;(EAT AT . JOES)

;(6.1)
;Q. Why is (NTH 4 '(A B C)) equal to Nil?
;A.  (NTH 4 ’(A B C)) involves four successive CDRs of a three-element list. The fourth CDR produces a NIL result, and the CAR of that is NIL.

;(6.2)
;Q. What is the val of (NTH 3 '(A B C . D))) and why?
;A. (NTH 3 ’(A B C . D)) produces an error. It takes three successive CDRs of its input, which yields the symbol D. Taking the CAR of D then causes an error because D is not a list.

;(6.3)
;Q. What is the val of (LAST '(ROSEBUD)) ?
;A. (ROSEBUD)

;(6.4)
;Q. What is the val of (LAST '((A B C))) and why?
;A. ((A B C))

;(6.5) (ROSES ARE RED)
(setf line '(ROSES ARE RED))    
(reverse line)                      ;(RED ARE ROSES)

(first (last line))                 ;RED
(nth 1 line)                        ;ARE
(reverse (reverse line))            ;(ROSES ARE RED)
(append line (list (first line)))   ;(ROSES ARE RED ROSES)
(append (last line) line)           ;(RED ROSES ARE RED)
(list (first line) (last line))     ;(ROSES (RED))
(cons (last line) line)             ;((RED) ROSES ARE RED)
(remove 'are line)                  ;(ROSES RED)
(append line '(violets are blue))   ;(ROSES ARE RED VIOLETS ARE BLUE)

;(6.6)
(defun last-element (x) (first (last x)))

(defun last-element (x) (first (reverse x)))

(defun last-element (x)
  (and x ; to handle NIL correctly
   (nth (- (length x) 1) x)))

;(6.7)
(defun next-to-last (x) (second (reverse x)))

;(6.8)
(defun my-butlast (x)
    (reverse (rest (reverse x))))

;(6.9)
(defun mystery (x) (first (last (reverse x)))) 
(mystery (list 12 21 2121 23 97))  ;12  

;(6.10)
(defun palindromep (x)
   (equal x (reverse x)))

;(6.11)
(defun make-palindromep (x)
    (append x (reverse x)))

;(6.12)
;MEMBER never has to copy its input. It simply returns a pointer to one of the cons cells that make up its input, or NIL

;(6.13) The result of intersecting a set with NIL is NIL.
(intersection '(Nil) '(Nil))   ;Nil

;(6.14)
;Q. What is the result of intersecting a set with itself? 
;A. The result of intersecting a set with itself is the set.

;(6.15)
(defun contains-article-p (sent)
  (intersection sent '(the a an)))

(defun contains-article-p (sent)
  (or (member ’the sent)
  (member ’a sent)
  (member ’an sent)))

(defun contains-article-p (sent)
  (not (and (not (member ’the sent))
  (not (member ’a sent))
  (not (member ’an sent)))))

;(6.16)
;Q. What is the union of a set with Nil?
;A. The union of a set with NIL is the set

;(6.17)
;Q. What is the union of a set with itself?
;A. The union of a set with itself is the set.

;(6.18)
(defun add-vowels (x)
     (union x '(a e i o u)))

;;NOTE:
;SET-DIFFERENCE function performs set subtraction. It returns what is left of the first set when the elements in the second
;set have been removed. Again, the order of elements in the result is undefined.

;SUBSETP predicate returns T if one set is contained in another, in other words, if every elements of the first set is an element of the second set.

;(6.21)
(defun my-subsetp (x y)
  (null (set-difference x y)))

;(6.22)
(setf a (list 'hello 'dear))         
(union a '(no soap radio))            ;(DEAR HELLO NO SOAP RADIO)

(intersection a (reverse a))          ;(DEAR HELLO)

(set-difference a '(stop for water))  ;(DEAR HELLO)

(set-difference a a)                  ;Nil

(member 'soap a)                      ;Nil

(member 'hello a)                     ;(HELLO)                 

;(6.23)
;Q. The cadinality of a set is the number of elements it contains. What Lisp primitive determines the cardinality of a set?
;A. LENGTH returns the cardinality of a set.

;(6.24)
(defun set-equal (x y)
    (and (subsetp x y)
         (subsetp y x)))

;(6.25)
(defun proper-subsetp (x y)
         (and (subsetp x y)
             (not (subsetp y x))))

;---------------------------------------------------
(defun titledp (name)
       (member (first name) '(mr ms miss mrs)))

(titledp '(mr joe))     ;(MR MS MISS MRS)
(titledp '(kayla joe))  ;Nil

(setf male-first-names '(john jacob david otto))
(setf female-first-names '(kayla ana lily kim))

(defun malep (name)
       (and (member name male-first-names)
            (not (member name female-first-names))))

(defun femalep (name)
       (and (member name female-first-names)
            (not (member name male-first-names))))

(defun give-title (name)
        "Returns a name with an appropriate title on the front.."
        (cond ((titledp name) name)
              ((malep (first name)) (cons 'mr name))
              ((femalep (first name)) (cons 'ms name))
              (t (append '(mr or ms) name))))
;--------------------------------------------------------

;(6.26)
(defun right-side (x)
   (rest (member '-vs- x)))

(defun left-side (x)
   (right-side (reverse x)))

(defun count-common (x)
  (length (intersection (left-side x)
                    (right-side x))))

(defun compare (x)
  (list (count-common x) 'common 'features))


;--------------------------------------------------------
;ASSOC
;it looks at the car of each element.

(setf words 
    '((one un)
      (two deux)
      (three trios)
      (four quatre)
      (five cinq)))

(assoc 'three words)      ;(three trois)
(assoc 'four words)       ;(four trois)
(assoc 'six words)        ;nil

(defun translate (x)
   (second (assoc x words)))

(translate 'one)     ;un
(translate 'five)    ;cinq
(translate 'six)     ;nil

;RASSOC aka "Reverse ASSOC"
;it looks at the cdr of each element.

(setf sounds 
    '((cow . moo)
      (pig . oink)
      (cat . meow)
      (dog . woof)
      (bird . tweet)))

(rassoc 'woof sounds)    ;(dog . woof)
(assoc 'dog sounds)      ;(dog . woof)
;--------------------------------------------------------
;(6.28)
(setf produce
   '((apple . fruit)
     (celery . veggie)
     (banana . fruit)
     (lettuce . veggie)))

(assoc 'banana produce)    ;(BANANA . FRUIT)
(rassoc 'fruit produce)    ;(APPLE . FRUIT)
(assoc 'lettuce produce)   ;(LETTUCE . VEGGIE)
(rassoc 'veggie produce)   ;(CELERY . VEGGIE)

;(6.30)
(setf books
  '((war-and-peace . leo-tolstoy)
   (common-lisp   . guy-steele)
   (the-c-language . denise-ritchie)
   (harry-potter . j-k.rowling)))

;(6.31)
(defun who-wrote (title)
  (second (assoc title books)))
    
;(6.32)
(setf books (reverse books))
;The WHO-WROTE function will behave exactly the same, because the
;order of entries in a table is unimportant when the keys (in this case the book titles) are unique

;(6.33)
;We can’t create WHAT-WROTE using the current table. However, if
;we rewrote the table to use dotted pairs, we could create WHATWROTE by using RASSOC.

;(6.34)
(setf atlas
  '((pennsylvania . pittsburgh)
   (new-jersey . newark)
   (pennsylvania . johnstown)
   (ohio . columbus)))





























