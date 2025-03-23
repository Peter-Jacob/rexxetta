/*�*REXX program  demonstrates  array usage  with mimicry.                */
a. = 'not found'                       /*�*value for all a.xxx  (so far). */
do j=1  to 100       /*�*start at 1, define 100 elements*/
a.j = -j * 100       /*�*define element as  -J hundred. */
end   /*�*j*/          /*�*the above defines 100 elements.*/

say 'element 50 is:'    a(50)
say 'element 3000 is:'  a(3000)
exit                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────A subroutine────────────────────────*/
a:   _a_ = arg(1);          return  a._a_
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arrays\arrays-2.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
