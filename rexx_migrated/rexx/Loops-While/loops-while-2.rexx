/*ª*REXX program demonstrates a  DO WHILE  with index reduction construct.*/
x=1024                                 /*ª*define the initial value of  X.*/
do  while  x>0                 /*ª*test if made at the top of  DO.*/
say right(x,10)                /*ª*pretty output by aligning right*/
x=x%2                          /*ª*in REXX, % is integer division.*/
end
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-While\loops-while-2.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
