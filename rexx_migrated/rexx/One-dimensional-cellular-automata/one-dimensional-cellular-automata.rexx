/*�*REXX program generates & displays N generations of one─dimensional cellular automata. */
parse arg newV1 gens .                               /*�*obtain optional arguments from the CL*/
if    newV1=='' |    newV1==","  then newV1=001110110101010  /*�*Not specified?  Then use the default.*/
if gens=='' | gens==","  then gens=40            /*�* "      "         "   "   "     "    */

do newV2=0  for gens                              /*�* process the  one-dimensional  cells.*/
say  " generation"    right(newV2,length(gens))       ' '       translate(newV1, "#·", 10)
newV3=0                                                                /*�* [↓] generation.*/
do j=2  for length(newV1) - 1;          x=substr(newV1, j-1, 3)     /*�*obtain the cell.*/
if x==011 | x==101 | x==110  then newV3=overlay(1, newV3, j)        /*�*the cell lives. */
else newV3=overlay(0, newV3, j)        /*�* "   "    dies. */
end   /*�*j*/

if newV1==newV3  then do;  say right('repeats', 40);  leave;  end          /*�*does it repeat? */
newV1=newV3                                           /*�*now use the next generation of cells.*/
end       /*�*#*/                               /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\One-dimensional-cellular-automata\one-dimensional-cellular-automata.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
