;; Define a function like apply, but where any number printed out before it returns will be printed, by default, in octal (base 8)

(defun octal-apply (fn args)
  (let ((*print-base* 8))
    (apply fn args)))

