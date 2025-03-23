/*�*REXX program  demonstrates  array usage  (with elements out-of-range).*/
array. = 'out of range'                /*�*define  ALL  elements to this. */

do j=-3000  to 3000      /*�*start at -3k,  going up to +3k.*/
array.j=j**2             /*�*define element as its square.  */
end   /*�*j*/              /*�* [↑]   defines 6,001 elements. */
g=-7
say g      "squared is:"   array.g
say 7000   "squared is:"   array.7000
/*�*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arrays\arrays-4.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
