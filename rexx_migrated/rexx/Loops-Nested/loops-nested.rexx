/*ͺ*REXX program loops through a two-dimensional array to search for a  '20'    (twenty). */
parse arg rows cols targ .                       /*ͺ*obtain optional arguments from the CL*/
if rows=='' | rows==","  then rows=60            /*ͺ*Rows not specified?  Then use default*/
if cols=='' | cols==","  then cols=10            /*ͺ*Cols  "      "         "   "     "   */
if targ=='' | targ==","  then targ=20            /*ͺ*Targ  "      "         "   "     "   */
w=max(length(rows), length(cols), length(targ))  /*ͺ*W:  used for formatting the output.  */
not= 'not'                                       /*ͺ* [β]  construct the 2βdimension array*/
do     row=1  for rows                 /*ͺ*ROW  is the 1st dimension of array.  */
do col=1  for cols                 /*ͺ*COL   "  "  2nd     "      "   "     */
newV1.row.col=random(1, targ)          /*ͺ*create some positive random integers.*/
end   /*ͺ*row*/
end       /*ͺ*col*/

do     r=1  for rows    /*ͺ* ββββββββββββββββββ now, search for the target {20}.*/
do c=1  for cols
say left('@.'r"."c, 3+w+w) '=' right(newV1.r.c, w)    /*ͺ*show an array element.*/
if newV1.r.c==targ  then do; not=; leave r; end       /*ͺ*found the targ number?*/
end   /*ͺ*c*/
end       /*ͺ*r*/

say right( space( 'Target'  not  "found:" )    targ, 33, 'β')
/*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-Nested\loops-nested.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
