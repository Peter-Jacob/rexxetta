/*�*REXX pgm computes Leonardo numbers, allowing the specification of L(0), L(1), and ADD#*/
numeric digits 500                               /*�*just in case the user gets ka-razy.  */
newV1.=1                                             /*�*define the default for the  @. array.*/
parse arg N L0 L1 a# .                           /*�*obtain optional arguments from the CL*/
if  N =='' |  N ==","  then    N= 25             /*�*Not specified?  Then use the default.*/
if L0\=='' & L0\==","  then  newV1.0= L0             /*�*Was     "         "   "   "   value. */
if L1\=='' & L1\==","  then  newV1.1= L1             /*�* "      "         "   "   "     "    */
if a#\=='' & a#\==","  then  newV1.a= a#             /*�* "      "         "   "   "     "    */
say 'The first '   N   " Leonardo numbers are:"  /*�*display a title for the output series*/
if newV1.0\==1 | newV1.1\==1  then say 'using '     newV1.0     " for L(0)"
if newV1.0\==1 | newV1.1\==1  then say 'using '     newV1.1     " for L(1)"
if newV1.a\==1            then say 'using '     newV1.a     " for the  add  number"
say                                              /*�*display blank line before the output.*/
newV2=                                               /*�*initialize the output line to "null".*/
do j=0  for N                       /*�*construct a list of Leonardo numbers.*/
if j<2  then z=newV1.j                  /*�*for the 1st two numbers, use the fiat*/
else do                     /*�*··· otherwise, compute the Leonardo #*/
newV3=newV1.0                  /*�*save the old primary Leonardo number.*/
newV1.0=newV1.1                /*�*store the new primary number in old. */
newV1.1=newV1.0  +  newV3  +  newV1.a  /*�*compute the next Leonardo number.    */
z=newV1.1                  /*�*store the next Leonardo number in Z. */
end                    /*�* [↑]  only 2 Leonardo #s are stored. */
newV2=newV2 z                               /*�*append the just computed # to $ list.*/
end   /*�*j*/                         /*�* [↓]  elide the leading blank in  $. */
say strip(newV2)                                     /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Leonardo-numbers\leonardo-numbers.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
