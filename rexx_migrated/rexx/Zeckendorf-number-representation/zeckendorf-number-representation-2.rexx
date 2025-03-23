/*ª*REXX program  calculates and displays the  first   N   Zeckendorf numbers.            */
numeric digits 100000                            /*ª*just in case user gets real kaâ”€razy. */
parse arg N .                                    /*ª*let the user specify the upper limit.*/
if N=='' | N==","  then n=20;   w= length(N)     /*ª*Not specified?  Then use the default.*/
newV1.1= 1                                           /*ª*start the array with  1   and   2.   */
newV1.2= 2;   do  newV2=3  until newV2>=N;  p= newV2-1;  pp= newV2-2 /*ª*build a list of Fibonacci numbers.   */
newV1.newV2= newV1.p + newV1.pp                        /*ª*sum the last two Fibonacci numbers.  */
end   /*ª*#*/                            /*ª* [â†‘]   #:  contains a Fibonacci list.*/

do j=0  to N;             parse var j x z      /*ª*task:  process zero  â”€â”€â–º  N  numbers.*/
do k=newV2  by -1  for newV2;  newV3= newV1.k               /*ª*process all the Fibonacci numbers.   */
if x>=newV3  then do;      z= z'1'              /*ª*is X>the next Fibonacci #?  Append 1.*/
x= x - newV3             /*ª*subtract this Fibonacci # from index.*/
end
else z= z'0'                       /*ª*append zero (0)  to the Fibonacci #. */
end   /*ª*k*/
say '    Zeckendorf'     right(j, w)    "="     right(z+0, 30)     /*ª*display a number.*/
end     /*ª*j*/                                  /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zeckendorf-number-representation\zeckendorf-number-representation-2.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
