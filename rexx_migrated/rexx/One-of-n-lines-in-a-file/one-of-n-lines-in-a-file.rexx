/*�*REXX program simulates reading a  ten─line  file,  count the selection randomness.    */
N= 10                                            /*�*the number of lines in pseudo-file.  */
newV1.= 0                                            /*�*zero  all  the (ten)  "buckets".     */
do 1000000                                 /*�*perform main loop  one million times.*/
newV2= 1
do k=1  for N                /*�*N  is the number of lines in the file*/
if random(0, 99999) / 100000  <  1/k  then newV2= k      /*�*the criteria.*/
end   /*�*k*/
newV1.newV2= newV1.newV2 + 1                               /*�*bump the count in a particular bucket*/
end                 /*�*1000000*/

do j=1  for N                                 /*�*display randomness counts (buckets). */
say "number of times line"       right(j, 2)       "was selected:"       right(newV1.j, 9)
end   /*�*j*/                                   /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\One-of-n-lines-in-a-file\one-of-n-lines-in-a-file.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
