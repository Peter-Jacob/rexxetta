/*ª*REXX program simulates reading a  tenâ”€line  file,  count the selection randomness.    */
N= 10                                            /*ª*the number of lines in pseudo-file.  */
newV1.= 0                                            /*ª*zero  all  the (ten)  "buckets".     */
do 1000000                                 /*ª*perform main loop  one million times.*/
newV2= 1
do k=1  for N                /*ª*N  is the number of lines in the file*/
if random(0, 99999) / 100000  <  1/k  then newV2= k      /*ª*the criteria.*/
end   /*ª*k*/
newV1.newV2= newV1.newV2 + 1                               /*ª*bump the count in a particular bucket*/
end                 /*ª*1000000*/

do j=1  for N                                 /*ª*display randomness counts (buckets). */
say "number of times line"       right(j, 2)       "was selected:"       right(newV1.j, 9)
end   /*ª*j*/                                   /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\One-of-n-lines-in-a-file\one-of-n-lines-in-a-file.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
