/*ª*REXX program to  copy  (polymorphically)  one variable's value into another variable. */
b= 'old value.'
a= 123.45
b= a                                             /*ª*copy a variable's value into another.*/
if a==b  then say "copy did work."
else say "copy didn't work."            /*ª*didn't work, maybe ran out of storage*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Polymorphic-copy\polymorphic-copy.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
