;; Define a structure to represent a tree where each node contains some data and has up to three children. Define
;; (a) a function to copy such a tree (so that no node in the copy is eql to a node in the original)
;; (b) a function that takes an object and such a tree, and returns true if the object is eql to the data field of one of the nodes

(defstruct my-tree elt l r m)

;; (a)
(defun my-copy-tree (tr)
  (if (null tr)
      nil
     (make-tree
      :elt (my-tree tr)
      :l (my-copy-tree (tr-l tr))
      :m (my-copy-tree (tr-m tr))
      :r (my-copy-tree (tr-r tr)))))

;; (b)
(defun my-find-tree (tr elt)
  (if (null tr)
      nil
      (if (eql elt (my-tree-elt tr))
          t
          (or (my-find-tree (my-tree-l tr) elt)
              (my-find-tree (my-tree-m tr) elt)
              (my-find-tree (my-tree-r tr) elt)))))
