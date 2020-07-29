(* Examples *)

(* function syntax:
   Note: A function is a value in ML
   
   syntax:
   fun f(a1: type1, a2: type2, .....  an: typen) = ex
   
   check-type:
   fun f(type1 * .... * typen) -> t
   
   func-call:
   f(ex1, ex2, ..., exn)
*)

(* val pow = fn : int * int -> int *)
fun pow(x : int, y: int) =
   if y = 0 then 1
   else x * pow(x, y-1)

(* val cube = fn : int -> int *)
fun cube(x: int) = pow(x,3)

(* val sixtyfour = 64 : int *)
val sixtyfour = cube(4)

(* val fiftythree = 51 : int *)
val fiftythree = pow(2,2+2) + pow(4,2) + cube(2) + 11


(* ------------------------------------------------- *)
(* Func OVERLOADING *)
fun square(x:real) = x*x;
square(3.3);
(*or*)
fun square(x) = (x:real)*x;
square(3.3);

fun square(x:int) = x*x;
square(3);

fun max3(a:int, b,c) = 
   if(a>b) then
     if(a>c) then a
        else c
     else
        if(b>c) then b
          else c;
max3(4,2,1);
max3(1,3,2);

(* MULTI PARAM FUNC. In ML you can pass like this: *)
val t = (3,2,1);
max3(t);

(* REVERSE A LIST *)
val L = [1,2,3,4,5,6];
val S = ["a","b","c"]
fun reverse(L) = 
   if(L = nil) then nil
   else reverse(tl(L)) @ [hd(L)];

(* NON LINEAR RECURSION *)
fun comb(n,m) = 
  if m=0 orelse m=n then 1
  else comb(n-1,m) + comb(n-1,m-1);
comb(4,2);
comb(10,3);


(* MUTUAL RECURSION *)
fun take(L) = 
  if L = nil then nil
  else hd(L)::skip(tl(L))
 and
 skip(L) = 
  if L = nil then nil
  else take(tl(L));
take([1,2,3,4,5]);
skip(["a","b","c","d"]);


(* Exercise 5.1 *)

(* a The cube of a real number x *)
fun cube(x:real) = x*x*x;
cube(3.3);
val it = 35.937 : real

(* b The smallest of the three components of a tuple of type int * int * int *)

(* c The third element of list. The function need not behave properly if given an argument that is a list of length 2 or less *)
fun third(L) = hd(tl(tl(L)));
third([1,2,3]);
val it = 3 : int

third([1,2]);
- uncaught exception Empty 

(* d The length of a list *)
val list = [9,8,7,6,5,4];
fun len(L) = 
   if(L=nil) then 0 
   else len(tl(L)) + 1;

(* e The third character of a character string. *)
fun thirdChar(x) = 
  third(explode(s);

(* Exercise 5.2 *)

(*a*)
fun factorial(x) = 
  if(x<=1) then 1 
  else x*factorial(x-1);

factorial(0);
- val it = 1 : int
factorial(1);
- val it = 1 : int
factorial(2);
- val it = 2 : int

(*c*)
fun duplicate(L) = 
  if(L=nil) then nil
  else hd(L)::hd(L)::duplicate(tl(L));

duplicate(L);
- val it = [1,1,2,2,3,3] : int list

(*5.3*)
(*a*)
fun foo(a,b,c,d) = 
  if(a=b) then c+1
  else 
  if a>b then c else b+d;
-val foo = fn : int * int * int * int -> int

(* if 1 is an integer in then the c supposed to be an integer. 
   if c is an integer then a and b are supposed to be an integer. 
  if c is an integer an b+d supposed to be an integer. *)

(*5.5*)
(*a Round a real num to the nearest integer, returning a real *)
fun round(x) = real(floor(x+0.5); 








