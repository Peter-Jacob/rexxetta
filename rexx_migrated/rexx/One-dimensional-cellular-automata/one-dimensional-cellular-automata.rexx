/*ª*REXX program generates & displays N generations of oneâ”€dimensional cellular automata. */
parse arg newV1 gens .                               /*ª*obtain optional arguments from the CL*/
if    newV1=='' |    newV1==","  then newV1=001110110101010  /*ª*Not specified?  Then use the default.*/
if gens=='' | gens==","  then gens=40            /*ª* "      "         "   "   "     "    */

do newV2=0  for gens                              /*ª* process the  one-dimensional  cells.*/
say  " generation"    right(newV2,length(gens))       ' '       translate(newV1, "#Â·", 10)
newV3=0                                                                /*ª* [â†“] generation.*/
do j=2  for length(newV1) - 1;          x=substr(newV1, j-1, 3)     /*ª*obtain the cell.*/
if x==011 | x==101 | x==110  then newV3=overlay(1, newV3, j)        /*ª*the cell lives. */
else newV3=overlay(0, newV3, j)        /*ª* "   "    dies. */
end   /*ª*j*/

if newV1==newV3  then do;  say right('repeats', 40);  leave;  end          /*ª*does it repeat? */
newV1=newV3                                           /*ª*now use the next generation of cells.*/
end       /*ª*#*/                               /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\One-dimensional-cellular-automata\one-dimensional-cellular-automata.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
