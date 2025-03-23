/*ª*REXX program loops through a two-dimensional array to search for a  '20'    (twenty). */
parse arg rows cols targ .                       /*ª*obtain optional arguments from the CL*/
if rows=='' | rows==","  then rows=60            /*ª*Rows not specified?  Then use default*/
if cols=='' | cols==","  then cols=10            /*ª*Cols  "      "         "   "     "   */
if targ=='' | targ==","  then targ=20            /*ª*Targ  "      "         "   "     "   */
w=max(length(rows), length(cols), length(targ))  /*ª*W:  used for formatting the output.  */
not= 'not'                                       /*ª* [â†“]  construct the 2â”€dimension array*/
do     row=1  for rows                 /*ª*ROW  is the 1st dimension of array.  */
do col=1  for cols                 /*ª*COL   "  "  2nd     "      "   "     */
newV1.row.col=random(1, targ)          /*ª*create some positive random integers.*/
end   /*ª*row*/
end       /*ª*col*/

do     r=1  for rows    /*ª* â—„â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€ now, search for the target {20}.*/
do c=1  for cols
say left('@.'r"."c, 3+w+w) '=' right(newV1.r.c, w)    /*ª*show an array element.*/
if newV1.r.c==targ  then do; not=; leave r; end       /*ª*found the targ number?*/
end   /*ª*c*/
end       /*ª*r*/

say right( space( 'Target'  not  "found:" )    targ, 33, 'â”€')
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-Nested\loops-nested.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
