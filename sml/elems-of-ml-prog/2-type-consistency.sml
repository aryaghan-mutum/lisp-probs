(* Examples *)

(* Func for converting REAL to INT *)
floor(3.3);
val it = 3 : int 

(* func for converting INT to CHAR *)
chr(100);
val it = #"d" : char


(* Exercise 2.1 *)

(* a. Convert 123.45 to the next lower integer *)
floor(123.45);
val it = 123 : int

(* b. Convert -123.45 to the next lower integer *)
ceiling(3.5);

(* c. Convert 123.45 to the next higher integer *)
ceiling(123.45);

(* d. Convert -123.45 to the next higher integer *)
floor(~123.45);
val it = ~124 : int

(* e. Convert "Y" to an integer *)
ord("Y");

(* f. Convert 120 to a character *)
chr(120);
val it = #"x" : char

(* g. Convert "N" to a REAL *)
real(ord("N");

(* h. Convert 97.0 to a CHAR *)
chr(97);
val it = #"a" : char

(* Exercise 2.2 *)

(*c*)
chr(256);
(* uncaught exception Chr
  raised at: smlnj/init/built-in.sml:360.17-360.20 
*)

(*d)
chr(~1);
(* uncaught exception Chr
  raised at: smlnj/init/built-in.sml:360.17-360.20
*)





