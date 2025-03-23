/*ª*REXX program  calculates and displays the  first   N   Zeckendorf numbers.            */
numeric digits 100000                            /*ª*just in case user gets real kaâ”€razy. */
parse arg N .                                    /*ª*let the user specify the upper limit.*/
if N=='' | N==","  then n=20;    w= length(N)    /*ª*Not specified?  Then use the default.*/
z=0                                              /*ª*the index of a  Zeckendorf number.   */
do j=0  until z>N;          newV1=x2b( d2x(j) )  /*ª*task:   process zero  â”€â”€â–º   N.       */
if pos(11, newV1) \== 0  then iterate            /*ª*are there two consecutive ones (1s) ?*/
say '    Zeckendorf'   right(z, w)    "="     right(newV1+0, 30)     /*ª*display a number.*/
z= z + 1                                     /*ª*bump the  Zeckendorf  number counter.*/
end   /*ª*j*/                                  /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zeckendorf-number-representation\zeckendorf-number-representation-3.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
