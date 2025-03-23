/*�*REXX program obtains two integers from the C.L. (a prompt);  displays some operations.*/
numeric digits 20                                /*�*#s are round at 20th significant dig.*/
parse arg x y .                                  /*�*maybe the integers are on the  C.L.  */

do while \datatype(x,'W') | \datatype(y,'W')   /*�*both   X  and  Y   must be integers. */
say "─────Enter two integer values  (separated by blanks):"
parse pull x y .                               /*�*accept two thingys from command line.*/
end   /*�*while*/
/*�* [↓]  perform this  DO  loop twice.  */
do j=1  for 2                               /*�*show  A  oper  B,   then  B  oper  A.*/
call show 'addition'          ,  "+",   x+y
call show 'subtraction'       ,  "-",   x-y
call show 'multiplication'    ,  "*",   x*y
call show 'int  division'     ,  "%",   x%y,  '    [rounds down]'
call show 'real division'     ,  "/",   x/y
call show 'division remainder',  "//",  x//y, '    [sign from 1st operand]'
call show 'power'             ,  "**",  x**y

parse value  x  y    with    y  x           /*�*swap the two values and perform again*/
if j==1  then say copies('═', 79)           /*�*display a fence after the 1st round. */
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: parse arg c,o,newV1,newV2;   say right(c,25)' '  x  center(o,4)  y  " ───► "  newV1  newV2;   return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-Integer\arithmetic-integer.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
