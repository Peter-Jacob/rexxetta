/*�*REXX program does a list comprehension that will create N random integers, all unique.*/
parse arg n lim .                                /*�*obtain optional argument from the CL.*/
if   n=='' |   n==","  then   n=   1000          /*�*Not specified?  Then use the default.*/
if lim=='' | lim==","  then lim= 100000          /*�* "      "         "   "   "     "    */
lim= min(lim, 1e5)                               /*�*limit the random range if necessary. */
randoms=                                         /*�*will contain random list of integers.*/
newV1= .
do j=1  for n                            /*�*gen a unique random integer for list.*/

do until wordpos(newV1, randoms)==0     /*�*ensure    "      "      "     "    " */
newV1= random(0, lim)                   /*�*Not unique?  Then obtain another int.*/
end   /*�*until*/                     /*�*100K is the maximum range for RANDOM.*/

randoms= newV1 randoms                       /*�*add an unique random integer to list.*/
end   /*�*j*/

say  words(randoms) ' unique numbers generated.' /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multiple-distinct-objects\multiple-distinct-objects.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
