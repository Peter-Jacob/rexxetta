/*�*REXX program assigns an integer for a finite list of arbitrary non-negative integers. */
parse arg newV1                                      /*�*obtain optional argument  (int list).*/
if newV1='' | newV1=","  then newV1=3 14 159 265358979323846 /*�*Not specified?  Then use the default.*/
/*�* [↑]  kinda use decimal digits of pi.*/
newV1= translate( space(newV1),   ',',   " ")            /*�*use a  commatized  list of integers. */
numeric digits max(9, 2 * length(newV1) )            /*�*ensure enough dec. digits to handle $*/

say 'original list='   newV1        /*�*display the original list of integers*/
N=   rank(newV1);    say '  map integer='   N        /*�*generate and display the map integer.*/
O= unrank(N);    say '       unrank='   O        /*�*generate original integer and display*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
rank:    return    x2d( translate( space( arg(1) ),  'c',  ",") )
unrank:  return  space( translate(   d2x( arg(1) ),  ',',  "C") )
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Index-finite-lists-of-positive-integers\index-finite-lists-of-positive-integers.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
