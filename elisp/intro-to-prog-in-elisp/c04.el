;; Author: Anurag Muthyam 

;; *****************************************
;; Chapter 4: A Few Buffer-Related Functions
;; *****************************************


;; Q: Write your own `simplified-end-of-buffer' function definition; then test it to see whether it works.
;; ---------
;;
;; A:
(defun simplified-end-of-buffer  ()
  "Move the point to the end of the current buffer"
  (interactive)
  (push-mark)
  (goto-char (point-max)))

(simplified-end-of-buffer)

;; Q: Use `if' and `get-buffer' to write a function that prints a message telling you whether a buffer exists.
;; ---------
;;
;; A:
(defun buffer-exists-p (buffer)
  "Prints a message if a BUFFER exists or does not exists!"
  (interactive
   (list (read-buffer "Buffer name: " (other-buffer (current-buffer) t))))
  (if (get-buffer buffer)
      (message "Buffer `%s' exists" buffer)
    (message "Buffer `%s' doesn't exists" buffer)))

(buffer-exists-p "some-file.el") ;doesn't exists
(buffer-exists-p "c04.el")  ;exists 
