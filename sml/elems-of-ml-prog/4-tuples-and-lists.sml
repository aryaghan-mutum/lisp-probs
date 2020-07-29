(* Tuples and Lists *)

(* Tuples 
   Note: a pair of values is a value.
  
   syntax: (ex1, ex2),
           (ex1, ex2, ex3, .... en)
   
   evaluation:
   evalauate ex1 to r1,
             ex2 to r2,
             reusult: (r1, r2)
             
   check-type:
   if ex1 is type1, ex2 is type2 
      then the pair expresion has type: type1 * type2   *)

(* exmaples: *)
(* val swap = fn : int * bool -> bool * int *)
fun swap (pr: int*bool) = (#2 pr, #1 pr);  

(* val sum_two_pairs = fn : (int * int) * (int * int) -> int *)
fun sum_two_pairs (pr1 : int * int, pr2 : int * int) = 
  (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2);
 
(* val div_mod = fn : int * int -> int * int *)
fun div_mod (x: int, y: int) = (x div y, x mod y);

(* val sort_pair = fn : int * int -> int * int *)
fun sort_pair(pr: int * int) = 
 if(#1 pr) < (#2 pr) then pr
 else (#2 pr, #1 pr);

(* ********************************************************************************* *)

(* Lists:
   empty lists is a value. ex: []
   elements of list = [elem1, elem2, .... elem3]
   
   evaluation:
   if ex1 evaluates to elem1, 
      ex2 evaluates to list [elem1, elem2, .... elem3]
   then ex1 :: ex2  aka "cons"   
   
   null ex evals to true iff ex evaluates to []
        
   if ex evals to [r1, r2, ..... rn], then hd ex evals to r1
   else raise exception if ex evals to []
   
   if ex evals to [r1, r2, ..... rn], then t1 ex evals to [r2, ... rn]
   else raise exception if ex evals to []  *)
   
(* list examples: *)
[];
[1,2,3];
[true, false, false];
[(1+4), (8-4), (6*3+2)];
["mouse", "swan", "dog"];

(* applying cons. cons means contructing lists *)
val l = [1,2,3];
0::l;
(* val it = [0,1,2,3] : int list *)

[32]::[[8,5],[5,2]]; 
(* val it = [[32],[8,5],[5,2]] : int list list *)

hd;
(* val it = fn : 'a list -> 'a *)

tl;
(* val it = fn : 'a list -> 'a list *)

hd l;
(* val it = 1 : int *)

tl l;
(* val it = [2,3] : int list *)

hd(tl l);
(* val it = 2 : int *)

tl(tl l);
(* val it = [3] : int list *)

tl(tl (tl x));
(* val it = [] : int list *)

null;
(* val it = fn : 'a list -> bool *)

null l;
(* val it = false : bool *)

null[2,4];
(* val it = false : bool *)

null[false, true];
(* val it = false : bool *)
   
(* ********************************************************************************* *)

(* List Procedures examples *)

fun sum_list(l : int list) = 
  if null l then 0
  else hd l + sum_list(tl l);

sum_list[1,2,4];
(* val it = 7 : int *)

fun countdown(x: int) = 
	if x = 0 then []
	else x :: countdown(x-1);

countdown 9;
(* val it = [9,8,7,6,5,4,3,2,1] : int list *)

sum_list(countdown 400);
(* val it = 80200 : int *)

fun append(x : int list, y : int list) = 
  if null x then y
  else (hd x) :: append((tl x), y);

append([1,2,3], [9,8,7]);
(* val it = [1,2,3,9,8,7] : int list *)

fun sum_pair_list(x : (int * int) list) = 
	if null x then 0
	else #1 (hd x) + #2 (hd x) + sum_pair_list(tl x)

fun firsts(x: (int * int) list) = 
	if null x then []
	else (#1 (hd x)) :: firsts(tl x);

fun seconds(x: (int * int) list) = 
	if null x then []
	else (#2 (hd x)) :: seconds(tl x);

fun sum_pair_list2(x : (int * int) list) =
	(sum_list (firsts x)) + (sum_list (seconds x));

sum_pair_list2[(2,4), (9,6), (8,~2)];
(* val it = 27 : int *)


(* --------------------------------------------------------------------------------- *)
(* Exercise 4.1 *)
(* What are the values of the following expressions? *)

(*a*) #2(3,4,5);
val it = 4 : int

(*b*) hd([3,4,5]);
val it = 3 : int

(*c*) tl([3,4,5]);
val it = [4,5] : int list

(*d*) explode("foo");
val it = [#"f",#"o",#"o"] : char list

(*e*) implode(["foo","bar"]);
(* it is giving me: 

Error: operator and operand don't agree [tycon mismatch]
  operator domain: char list
  operand:         string list
  in expression:
    implode ("foo" :: "bar" :: nil)
*)

(*f*) "c"::["a","t"]; 
val it = ["c","a","t"] : string list

(*g*) ["c","o"]@["b","o","1"];
val it = ["c","o","b","o","1"] : string list


(* Exercise 4.2 *)
(* What is wrong with each of the following expressions? *)

(*a*) #4(3,4,5);
(* Error: Because the there are only 3 values *)

(*b*) hd([]);
(* Warning: type vars not generalized because of
   value restriction are instantiated to dummy types (X1,X2,...) 

Error because there is no head. to avoid errors put values
*)

(*c*) #1(1);
(* Warning: type vars not generalized because of value restriction are instantiated to dummy types (X1,X2,...)   

Error because there is only 1 value. *)

(*d*) explode(["bar"]);
(* Error becayse there are square brackets. Remove brackets *)

(*f*) ["r"]::["a","t"]
(* Error because of the square brackets. Remove brackets *)

(*g*) (1@2)
(* Error. @ is used for list concat. Use: 

"1"^"2";
val it = "12" : string

or 

[1]@[2];
val it = [1,2] : int list
* )


(* Exercise 4.3 *)
(* Give the types of the following expressions? *)

(*a*) (1.5,("3",[4,5]));
val it = (1.5,("3",[4,5])) : real * (string * int list)

(*b*) [[1,2],nil,[3]];
val it = [[1,2],[],[3]] : int list list

(*c*) [(2,3.5), (4,5.5), (6,7.5)];
val it = [(2,3.5),(4,5.5),(6,7.5)] : (int * real) list

(*d*) (["a","b"],[nil,[1,2,3]]);
val it = (["a","b"],[[],[1,2,3]]) : string list * int list list


(* Exercise 4.4 *)
(* Q. Are (1,2) and (1,2,3) the same type? *)
(* A. NO. (1,2) is int * int. (1,2,3) is int * int * int)

(* Q. Are [1,2] and [1,2,3] the same type? *)
(* A. YES. [1,2] is int list. [1,2,3] is int list)

(* Exercise 4.5 *)
(* Give examples of values for each of the following types *)

(*a*) int list list list
[[[[1,2],[3,4]], [[5,6],[7,8]]]

(*c*) (string list * (int * (real * string)) * int)
(["a", "b"], (1, (2.5, "c")), 3)











