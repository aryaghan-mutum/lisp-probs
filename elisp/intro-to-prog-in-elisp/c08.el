;; Author: Anurag Muthyam 

;; ***********************************
;; Chapter 8: Cutting and Storing Text
;; ***********************************

;; Q:
;; Write an interactive function that searches for a string.  If the search
;; finds the string, leave point after it and display a message that says
;; "Found!".  (Do not use `search-forward' for the name of this function; if you
;; do, you will overwrite the existing version of `search-forward' that comes
;; with Emacs.  Use a name such as `test-search' instead.)
;; ---------
;;
;; A:
(defun test-search (str)
   "Searches for a string"
   (interactive "MString:")
    (when (search-forward str)
      (message "Found!")))

(test-search "test search function!")

;; Q:
;; Write a function that prints the third element of the kill ring in
;; the echo area, if any; if the kill ring does not contain a third
;; element, print an appropriate message.
;; ---------
;;
;; A:
(defun print-third-element-of-kill-ring ()
  "Prints the third element of the kill ring in the echo area"
  (let '(string (nth 2 kill-ring))
    (if string
      (message "%s" string)
      (message "Error: The kill-ring has no third element."))))

(setq kill-ring '(one two three))
(setq kill-ring '(one two))
(print-third-element-of-kill-ring)




