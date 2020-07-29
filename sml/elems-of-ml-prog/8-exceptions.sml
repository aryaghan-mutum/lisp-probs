(* Exercise 8.1 *)

fun factorial(0) = 1
| 	factorial(n) = 
	if n>0 then n*factorial(n-1)
 	else raise Negative; 




 	







