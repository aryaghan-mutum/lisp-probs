;; Why does (member '(a) '((a) (b))) return nil?

(member '(a) '((a) (b)))     
;NIL

(eql '(a) '(b))              
;NIL

(member '(a) '((a) (b)) :test #'equal)    
;((A) (B))


        

