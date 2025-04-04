/*ͺ*REXX program obtains two integers from the C.L. (a prompt);  displays some operations.*/
numeric digits 20                                /*ͺ*#s are round at 20th significant dig.*/
parse arg x y .                                  /*ͺ*maybe the integers are on the  C.L.  */

do while \datatype(x,'W') | \datatype(y,'W')   /*ͺ*both   X  and  Y   must be integers. */
say "βββββEnter two integer values  (separated by blanks):"
parse pull x y .                               /*ͺ*accept two thingys from command line.*/
end   /*ͺ*while*/
/*ͺ* [β]  perform this  DO  loop twice.  */
do j=1  for 2                               /*ͺ*show  A  oper  B,   then  B  oper  A.*/
call show 'addition'          ,  "+",   x+y
call show 'subtraction'       ,  "-",   x-y
call show 'multiplication'    ,  "*",   x*y
call show 'int  division'     ,  "%",   x%y,  '    [rounds down]'
call show 'real division'     ,  "/",   x/y
call show 'division remainder',  "//",  x//y, '    [sign from 1st operand]'
call show 'power'             ,  "**",  x**y

parse value  x  y    with    y  x           /*ͺ*swap the two values and perform again*/
if j==1  then say copies('β', 79)           /*ͺ*display a fence after the 1st round. */
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: parse arg c,o,newV1,newV2;   say right(c,25)' '  x  center(o,4)  y  " ββββΊ "  newV1  newV2;   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-Integer\arithmetic-integer.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
