(* Lecture Two *)

val x:int = 17;
val y = 121;
val z = (x + y) + (y - 100);
val q = z * 3;

val my_abs = if(z < 0) then 0-z else z;

(* Evaluating a sequence of bindings *)

val x = 2+3; (*First this evaluates to 5 and replaces all x's down *)
val y = x + 1; (* this evalues to 5 + 1 and to 6, replaces all y's down *)
val z = x + y; (* evalues to 5 + 6 and to 11, replaces all z's down *)

(* Shadowing variables *)

val x = 2 + 3;
val y = x + 1;
val x = 7;
val z = x + 1;

(* Scoping *)

val pi = 3.14;
fun area x = pi * x * x;
val a = area(2.0);
val pi = 3.0;

val b = area(2.0);

(* First look at recursive functions *)
fun pow(x,y) = if y = 0 then 1 else x * pow (x,y-1);

fun cube x = pow (x,3);

val sixtyFour = cube 4;

val fortyTwo = pow(2,4) + pow(4,2) + cube 2 + 2;