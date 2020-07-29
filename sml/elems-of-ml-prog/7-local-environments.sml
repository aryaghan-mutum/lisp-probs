(* Let expressions 
   
 (bi: binding, ex: expression)
 
   syntax:
   let 
      b1, bi2 .... bin 
   in ex 
      ......
   end   
   
   check-type:
   check types of each binding (bi) and ex in a static environment 
   that includes previous bi.
   
   eval:
   evaluate each bi and ex in an environemnt which includes previous bi.
   result of let-expressions is result of evaluating ex. 

note: procedures can be defined inside the let-expressions *)


(* let-expressions in nested functions example *)

(* method 1 with a helper procedure *)
fun count(from : int, to: int) = 
	if from = to then to::[]
	else from :: count(from+1, to)

count(0,9);
(* val it = [0,1,2,3,4,5,6,7,8,9] : int list *)

(* method 2 with let-expression *)
fun count_up_from_1(x: int) = 
	let 
		fun count(from : int) = 
			if from = x
			then to :: []
		else from :: count(from+1)
	in
		count 1 
	end

(* more let-expression examples *)
fun inc(from: int, to : int) = 
	if from = to then to::[]
	else from :: inc(from+1, to);

fun dec(from: int, to : int) = 
	if from = to then to::[]
	else from :: inc(from-1, to);

fun find_max(l : int list) = 
	if null l then 0
	else if null (tl l) then hd l
	else 
		let val res = find_max(tl l)
		in 
			if hd l > res
			then hd l
			else res
		end
(* find_max(inc(1, 20)); *)

(*7.1 Write a succinct function to compute x^1000 *)
fun thousandPower(x:real) = 
 let
     val x = x*x*x*x;
     val x = x*x*x*x;
     val x = x*x*x*x
  in
  	x*x*x*x*x*x*x*x
  end;

 (*7.5*)
 fun doubleExp(x:real, 0) = x
 | doubleExp(x,i) = 
 	let 
 		val y = doubleExp(x,i-1)
 	in 
 		y*y
 	end;
 	
  






