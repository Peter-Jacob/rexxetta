/*ͺ*REXX program  demonstrates  array usage  with mimicry.                */
a. = 00                                /*ͺ*value for all a.xxx  (so far). */
do j=1  to 100       /*ͺ*start at 1, define 100 elements*/
a.j = -j * 100       /*ͺ*define element as  -J hundred. */
end   /*ͺ*j*/          /*ͺ*the above defines 100 elements.*/

say 'element 50 is:'    a(50)
say 'element 3000 is:'  a(3000)
exit                                   /*ͺ*stick a fork in it, we're done.*/
/*ͺ*ββββββββββββββββββββββββββββββββββA subroutineββββββββββββββββββββββββ*/
a:   _a_ = arg(1);          return  a._a_
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arrays\arrays-3.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
