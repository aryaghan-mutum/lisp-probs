(* Boolean expression
  syntax in imperative languages: 
  ex1 || ex2, 
  ex1 && ex2,
  
  syntax in ML: ex1 andalso ex2
  
  check-type: ex1 & ex2 should have type 'bool'
  
  eval: if e1 = false then false 
        else e2 *)
       
(* Comparision operators 
= Equal to
< Less than 
> Greater than 
<= Less than or equal to 
>= Greater than or equal to 
<> Not equal to  (in java: !=) .  *)

(* Logical operators
ML                Java
AND or (andalso)  &&
OR or (orelse)    ||
NOT               !        *)


(* Constants
There are 4 constants in ML:
Integers: …..-2, -1, 0 1, 2, 3….
Reals: 1.0, -0.001, 1.23232
Booleans: True , False *)


(* Exercise 1.1 *)

(*a*) 1+2*3;
val it = 7 : int

(*b*) 5.0-4.2/1.4;
val it = 2.0 : real 

(*c*) 11 div 2 mod 3;
val it = 2 : int 

(*d*) "foo"^"bar"^"";
val it = "foobar" : string 

(*e*) 3>4 orelse 5<6 andalso not 7<>8;
(* stdIn:68.24-68.32 Error: operator and operand don't agree [overload conflict]
  operator domain: bool
  operand:         [int ty]
  in expression:
    not 7
*)

(*f*) if 6<10 then 6.0 else 10.0;
val it = 6.0 : real 


(* Exercise 1.2 *)

(*a*) 8/4;
(* Error: operator and operand don't agree [overload conflict]
  operator domain: real * real
  operand:         [int ty] * [int ty]
*)

(* The operator '/' applies only to type 'real. It should be 8 div 4 because 8 and 4 are int types; *)

(*b*) if 2<3 then 4;  
(* does not work *)

(*c*) 1<2 and 5>3;
(* stdIn:47.2 Error: syntax error found at AND *)

(*d*) 6+7 DIV 2;
(* stdIn:47.2-64.1 Error: unbound variable or constructor: DIV
stdIn:1.2-70.1 Error: operator is not a function [overload conflict]
  operator: [int ty] 
*)

(* correct way: *) 
6.0+7.0 / 2.0;
(* val it = 9.5 : real *)


(*e*) 4.+3.5;
(* stdIn:1.3 Error: syntax error found at DOT *)
(* correct way: *)
4.0+4.5;
(* val it = 8.5 : real *)

(*f*) 1.0<2.0 or 3>4;
(* stdIn:72.9-72.11 Error: unbound variable or constructor: or
stdIn:72.1-72.15 Error: operator is not a function [tycon mismatch]
  operator: real
  in expression:
 *)

(* Exercise 1.3 *)
"\"\\\\\\\" stands for the double-quote character, \\\n\
\\\which otherwise would be interted \\\n\
\\\as the string ender.\""







