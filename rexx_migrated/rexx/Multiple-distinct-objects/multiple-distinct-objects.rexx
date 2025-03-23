/*ª*REXX program does a list comprehension that will create N random integers, all unique.*/
parse arg n lim .                                /*ª*obtain optional argument from the CL.*/
if   n=='' |   n==","  then   n=   1000          /*ª*Not specified?  Then use the default.*/
if lim=='' | lim==","  then lim= 100000          /*ª* "      "         "   "   "     "    */
lim= min(lim, 1e5)                               /*ª*limit the random range if necessary. */
randoms=                                         /*ª*will contain random list of integers.*/
newV1= .
do j=1  for n                            /*ª*gen a unique random integer for list.*/

do until wordpos(newV1, randoms)==0     /*ª*ensure    "      "      "     "    " */
newV1= random(0, lim)                   /*ª*Not unique?  Then obtain another int.*/
end   /*ª*until*/                     /*ª*100K is the maximum range for RANDOM.*/

randoms= newV1 randoms                       /*ª*add an unique random integer to list.*/
end   /*ª*j*/

say  words(randoms) ' unique numbers generated.' /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multiple-distinct-objects\multiple-distinct-objects.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
