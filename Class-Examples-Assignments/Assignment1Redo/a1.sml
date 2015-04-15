(* Problem 1 *)
exception noSuchMonth;
exception notValidDate;

fun checkLeapYear(y:int) : bool =
	if y mod 100 = 0 andalso y mod 400 = 0 then true
	else false; 

fun getLast(leap:bool, m:int) : int = 
	case m of
		2 => if leap then 29 else 28
		| 4 => 30
		| 6 => 30
		| 9 => 30
		| 11 => 30
		| _ => 31;

fun last_day (y:int,m:int,d:int) : int =
	if m >= 1 andalso m <= 12 then getLast(checkLeapYear(y), m)
	else raise noSuchMonth;

fun valid_date(y:int, m:int, d:int) : bool =
	if d >= 1 andalso d <= last_day(y,m,d) then true
	else false;

fun next_day(y:int,m:int,d:int) : int*int*int =
	if valid_date(y,m,d) then 
		case m of
			12 => if d = last_day(y,m,d) then (y+1, 1, 1) else (y, m, d+1) 
			|_ => if d = last_day(y,m,d) then (y, m+1, 1) else (y, m, d+1)
	else raise notValidDate;

fun precedes(a: int*int*int, b: int*int*int) : bool =
	if(#1 a < #1 b) then true
	else if (#1 a = #1 b) then
		if(#2 a < #2 b) then true
		else if(#2 a = #2 b) then
			if(#3 a < #3 b) then true
			else false
		else false
	else false;

fun earliest(lst: (int*int*int) list) : int*int*int = 
	let
		fun helper(lst: (int*int*int) list, max:int*int*int) : int*int*int =
			case lst of
				[] => max
				| x::xs => if precedes(x, max) then helper(xs, x) else helper(xs, max)
	in
		helper(lst, (2999, 12, 31))
	end;

(*earliest([(2014,3,8), (2014,3,9), (2014,2,10)]);*)

(*Problem 2*)
fun zip(integers: int list, strings: string list) : (int * string) list =
	let
		fun construct(integers: int list, strings: string list, commonList: (int*string) list) : (int*string) list =
			case integers of
				[] => commonList
				| x::xs => case strings of 
							[] => commonList
							| y::ys => construct(xs, ys, commonList @ [(x,y)])
	in
		construct(integers, strings, [])
	end;

fun unzip(common: (int*string) list) : int list * string list =
	let
		fun deconstruct(integers: int list, strings: string list, common: (int*string) list) : int list * string list =
			case common of
				[] => (integers, strings)
				| (x:int,y:string)::xs => deconstruct(integers@[x],strings@[y], xs)
	in
		deconstruct([], [], common)
	end;

(*Problem 3*)
fun incr (lst : int list, amt : int) : int list =
	case lst of
	[] => []
	| x :: xs => (x + amt) :: incr(xs, amt);

fun prefixSum(lst: int list) : int list =
	case lst of
		[] => []
		| x::xs => x::incr(prefixSum(xs), x);

fun prefixSumFast(lst: int list) : int list =
	let
		fun helper(lst: int list, carrySum: int) : int list =
		 case lst of
		 	[] => lst
		 	| x::xs => (x+carrySum) :: helper(xs, x+carrySum)
	in
		helper(lst, 0)
	end;

prefixSum([2,3,11,7]);