/*�*REXX program  calculates and displays the  first   N   Zeckendorf numbers.            */
numeric digits 100000                            /*�*just in case user gets real ka─razy. */
parse arg N .                                    /*�*let the user specify the upper limit.*/
if N=='' | N==","  then n=20;   w= length(N)     /*�*Not specified?  Then use the default.*/
newV1.1= 1                                           /*�*start the array with  1   and   2.   */
newV1.2= 2;   do  newV2=3  until newV2>=N;  p= newV2-1;  pp= newV2-2 /*�*build a list of Fibonacci numbers.   */
newV1.newV2= newV1.p + newV1.pp                        /*�*sum the last two Fibonacci numbers.  */
end   /*�*#*/                            /*�* [↑]   #:  contains a Fibonacci list.*/

do j=0  to N;             parse var j x z      /*�*task:  process zero  ──►  N  numbers.*/
do k=newV2  by -1  for newV2;  newV3= newV1.k               /*�*process all the Fibonacci numbers.   */
if x>=newV3  then do;      z= z'1'              /*�*is X>the next Fibonacci #?  Append 1.*/
x= x - newV3             /*�*subtract this Fibonacci # from index.*/
end
else z= z'0'                       /*�*append zero (0)  to the Fibonacci #. */
end   /*�*k*/
say '    Zeckendorf'     right(j, w)    "="     right(z+0, 30)     /*�*display a number.*/
end     /*�*j*/                                  /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zeckendorf-number-representation\zeckendorf-number-representation-2.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
