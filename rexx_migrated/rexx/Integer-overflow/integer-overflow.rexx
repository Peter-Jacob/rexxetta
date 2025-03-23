/*�*REXX program  displays values  when  integers  have an   overflow  or  underflow.     */
numeric digits 9                                 /*�*the REXX default is 9 decimal digits.*/
call  showResult(  999999997 + 1 )
call  showResult(  999999998 + 1 )
call  showResult(  999999999 + 1 )
call  showResult( -999999998 - 2 )
call  showResult(  40000 * 25000 )
call  showResult( -50000 * 20000 )
call  showResult(  50000 *-30000 )
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
showResult: procedure;  parse arg x,,newV1;  x=x/1                      /*�*normalize   X.    */
if pos(., x)\==0  then  if x>0  then newV1=' [overflow]'    /*�*did it  overflow? */
else newV1=' [underflow]'   /*�*did it underflow? */
say right(x, 20) newV1                                      /*�*show the result.  */
return x                                                /*�*return the value. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Integer-overflow\integer-overflow.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
