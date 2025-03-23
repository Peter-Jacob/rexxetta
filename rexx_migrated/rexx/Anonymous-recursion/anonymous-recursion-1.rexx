/*�*REXX program to show anonymous recursion  (of a function or subroutine).              */
numeric digits 1e6                               /*�*in case the user goes ka-razy with X.*/
parse arg x .                                    /*�*obtain the optional argument from CL.*/
if x=='' | x==","  then x= 12                    /*�*Not specified?  Then use the default.*/
w= length(x)                                     /*�*W:  used for formatting the output.  */
do j=0  for x+1               /*�*use the  argument  as an upper limit.*/
say 'fibonacci('right(j, w)") ="   fib(j)
end  /*�*j*/                    /*�* [↑] show Fibonacci sequence: 0 ──► X*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fib: procedure; parse arg z;  if z>=0  then return .(z)
say "***error***  argument can't be negative.";   exit
.:   procedure; parse arg newV1;  if newV1<2  then return newV1;              return .(newV1-1)  +  .(newV1-2)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Anonymous-recursion\anonymous-recursion-1.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
