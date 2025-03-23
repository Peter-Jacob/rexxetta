/*�*REXX program  calculates and displays the  first   N   Zeckendorf numbers.            */
numeric digits 100000                            /*�*just in case user gets real ka─razy. */
parse arg N .                                    /*�*let the user specify the upper limit.*/
if N=='' | N==","  then n=20;    w= length(N)    /*�*Not specified?  Then use the default.*/
z=0                                              /*�*the index of a  Zeckendorf number.   */
do j=0  until z>N;          newV1=x2b( d2x(j) )  /*�*task:   process zero  ──►   N.       */
if pos(11, newV1) \== 0  then iterate            /*�*are there two consecutive ones (1s) ?*/
say '    Zeckendorf'   right(z, w)    "="     right(newV1+0, 30)     /*�*display a number.*/
z= z + 1                                     /*�*bump the  Zeckendorf  number counter.*/
end   /*�*j*/                                  /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zeckendorf-number-representation\zeckendorf-number-representation-3.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
