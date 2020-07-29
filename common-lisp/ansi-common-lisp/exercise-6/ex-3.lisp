;; Define a function that takes any number of arguments and returns the number of arguments passed to it.

(defun length-arguments (&rest args)
	(length args))