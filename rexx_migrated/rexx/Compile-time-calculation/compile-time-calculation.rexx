/*ͺ*REXX program computes 10! (ten factorial) during REXX's equivalent of "compileβtime". */

say '10! ='    newV1(10)
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV1: procedure;  newV1=1;            do j=2  to arg(1);    newV1=newV1*j;    end  /*ͺ*j*/;        return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Compile-time-calculation\compile-time-calculation.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
