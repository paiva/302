(*Lecture Three*)

(*Function to define the factorials numbers*)

fun factorial (n : int) : int = 
	case n of 
		0 => 1
		|_ => n * (factorial (n-1));

(* Examples *)

factorial(5);


(*Function to get powers of 2*)
fun powof2 (n: int) : int =
	case n of
		0 => 1
		| n => 2 * (powof2 (n-1));

(*Examples *)
powof2(4);


(*Infinite regression example.. what if we forget to decrement?*)

fun powof2inf (n : int) : int =
	case n of 
		0 => 1
		|n => 2 * (powof2inf(n));

(*powof2inf(4);*)

(* Look at pairs and tuples *)

fun max ( x: real, y: real) : real =
	if (x < y) then y
	else x;

max(5.0, 6.0);

fun max (pair : real * real) : real =
	if (#1 pair) < (#2 pair) then
		(#2 pair)
	else
		(#1 pair);

