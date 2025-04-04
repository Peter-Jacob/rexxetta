/*ͺ*REXX program lists all the  nonβcontinuous subsequences  (NCS),   given a sequence.   */
parse arg list                                   /*ͺ*obtain optional argument from the CL.*/
if list='' | list==","  then list= 1 2 3 4 5     /*ͺ*Not specified?  Then use the default.*/
say 'list='  space(list);             say        /*ͺ*display the list to the terminal.    */
w= words(list)                                   /*ͺ*W:  is the number of items in list.  */
nums= strip( left(123456789, w) )                /*ͺ*build a string of decimal digits.    */
tail= right(nums, max(0, w-2) )                  /*ͺ*construct a fast tail for comparisons*/
newV1= 0                                             /*ͺ*#:  number of nonβcontinuous subseq. */
do j=13  to left(nums,1) || tail           /*ͺ*step through list (using smart start)*/
if verify(j, nums) \== 0  then iterate     /*ͺ*Not one of the chosen  (sequences) ? */
f= left(j, 1)                              /*ͺ*use the fist decimal digit of  J.    */
NCS= 0                                     /*ͺ*so far, no nonβcontinuous subsequence*/
do k=2  for length(j)-1           /*ͺ*search for  "       "          "     */
x= substr(j, k, 1)                /*ͺ*extract a single decimal digit of  J.*/
if x  <= f    then iterate j      /*ͺ*if next digit βξεχΦ², then skip this digit*/
if x \== f+1  then NCS= 1         /*ͺ*it's OK as of now  (that is, so far).*/
f= x                              /*ͺ*now have a  new  next decimal digit. */
end   /*ͺ*k*/
newV2=
if \NCS  then iterate                      /*ͺ*not OK?  Then skip this number (item)*/
newV1= newV1 + 1                                   /*ͺ*Eureka!  We found a number (or item).*/
do m=1  for length(j)             /*ͺ*build a sequence string to display.  */
newV2= newV2 word(list, substr(j, m, 1) ) /*ͺ*obtain a number (or item) to display.*/
end   /*ͺ*m*/

say 'a nonβcontinuous subsequence: '   newV2   /*ͺ*show the nonβcontinuous subsequence. */
end         /*ͺ*j*/
say                                              /*ͺ*help ensure visual fidelity in output*/
if newV1==0  then newV1= 'no'                            /*ͺ*make it look more gooder Angleshy.   */
say  newV1   "nonβcontinuous subsequence"s(newV1)    'were found.'             /*ͺ*handle plurals.*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
s:  if arg(1)==1  then return '';   return word( arg(2) 's',  1)    /*ͺ*simple pluralizer.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Non-continuous-subsequences\non-continuous-subsequences.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
