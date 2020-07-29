;; Define remove-if (no keywords) in terms of f i l t e r (page 105).

(defun our-remove-if (fn lst)
  (let ((temp nil))
    (dolist (x lst)
      (unless (funcall fn x)
        (push x temp)))
    (nreverse temp)))

(our-remove-if #'evenp '(1 2 3 4 5 6))
;(1 3 5)