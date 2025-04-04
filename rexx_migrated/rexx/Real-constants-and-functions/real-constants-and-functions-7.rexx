/*ͺ*ββββββββββββββββββββββββββββββββββSQRT subroutineβββββββββββββββββββββ*/
sqrt: procedure;  arg x                /*ͺ*a simplistic  SQRT  subroutine.*/
if x=0  then return 0                  /*ͺ*handle special case of zero.   */
d=digits()                             /*ͺ*get the current precision (dig)*/
numeric digits d+2                     /*ͺ*ensure extra precision (2 digs)*/
g=x/4                                  /*ͺ*try get a so-so 1st guesstimate*/
old=0                                  /*ͺ*set OLD guess to zero.         */
do forever           /*ͺ*keep at it 'til  G (guess)=old.*/
g=(g+x/g) / 2        /*ͺ*do the nitty-gritty calculation*/
if g=old  then leave /*ͺ*if G is the same as old, quit. */
old=g                /*ͺ*save OLD for next iteration.   */
end   /*ͺ*forever*/    /*ͺ* [β] Β·Β·Β·'til we run out of digs*/
numeric digits d                       /*ͺ*restore the original precision.*/
return g/1                             /*ͺ*normalize to old precision (d).*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Real-constants-and-functions\real-constants-and-functions-7.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
