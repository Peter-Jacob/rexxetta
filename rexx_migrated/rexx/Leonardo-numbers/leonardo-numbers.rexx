/*ª*REXX pgm computes Leonardo numbers, allowing the specification of L(0), L(1), and ADD#*/
numeric digits 500                               /*ª*just in case the user gets ka-razy.  */
newV1.=1                                             /*ª*define the default for the  @. array.*/
parse arg N L0 L1 a# .                           /*ª*obtain optional arguments from the CL*/
if  N =='' |  N ==","  then    N= 25             /*ª*Not specified?  Then use the default.*/
if L0\=='' & L0\==","  then  newV1.0= L0             /*ª*Was     "         "   "   "   value. */
if L1\=='' & L1\==","  then  newV1.1= L1             /*ª* "      "         "   "   "     "    */
if a#\=='' & a#\==","  then  newV1.a= a#             /*ª* "      "         "   "   "     "    */
say 'The first '   N   " Leonardo numbers are:"  /*ª*display a title for the output series*/
if newV1.0\==1 | newV1.1\==1  then say 'using '     newV1.0     " for L(0)"
if newV1.0\==1 | newV1.1\==1  then say 'using '     newV1.1     " for L(1)"
if newV1.a\==1            then say 'using '     newV1.a     " for the  add  number"
say                                              /*ª*display blank line before the output.*/
newV2=                                               /*ª*initialize the output line to "null".*/
do j=0  for N                       /*ª*construct a list of Leonardo numbers.*/
if j<2  then z=newV1.j                  /*ª*for the 1st two numbers, use the fiat*/
else do                     /*ª*Â·Â·Â· otherwise, compute the Leonardo #*/
newV3=newV1.0                  /*ª*save the old primary Leonardo number.*/
newV1.0=newV1.1                /*ª*store the new primary number in old. */
newV1.1=newV1.0  +  newV3  +  newV1.a  /*ª*compute the next Leonardo number.    */
z=newV1.1                  /*ª*store the next Leonardo number in Z. */
end                    /*ª* [â†‘]  only 2 Leonardo #s are stored. */
newV2=newV2 z                               /*ª*append the just computed # to $ list.*/
end   /*ª*j*/                         /*ª* [â†“]  elide the leading blank in  $. */
say strip(newV2)                                     /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Leonardo-numbers\leonardo-numbers.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
