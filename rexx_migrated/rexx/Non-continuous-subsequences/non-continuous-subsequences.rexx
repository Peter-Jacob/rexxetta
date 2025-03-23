/*�*REXX program lists all the  non─continuous subsequences  (NCS),   given a sequence.   */
parse arg list                                   /*�*obtain optional argument from the CL.*/
if list='' | list==","  then list= 1 2 3 4 5     /*�*Not specified?  Then use the default.*/
say 'list='  space(list);             say        /*�*display the list to the terminal.    */
w= words(list)                                   /*�*W:  is the number of items in list.  */
nums= strip( left(123456789, w) )                /*�*build a string of decimal digits.    */
tail= right(nums, max(0, w-2) )                  /*�*construct a fast tail for comparisons*/
newV1= 0                                             /*�*#:  number of non─continuous subseq. */
do j=13  to left(nums,1) || tail           /*�*step through list (using smart start)*/
if verify(j, nums) \== 0  then iterate     /*�*Not one of the chosen  (sequences) ? */
f= left(j, 1)                              /*�*use the fist decimal digit of  J.    */
NCS= 0                                     /*�*so far, no non─continuous subsequence*/
do k=2  for length(j)-1           /*�*search for  "       "          "     */
x= substr(j, k, 1)                /*�*extract a single decimal digit of  J.*/
if x  <= f    then iterate j      /*�*if next digit ����ֲ, then skip this digit*/
if x \== f+1  then NCS= 1         /*�*it's OK as of now  (that is, so far).*/
f= x                              /*�*now have a  new  next decimal digit. */
end   /*�*k*/
newV2=
if \NCS  then iterate                      /*�*not OK?  Then skip this number (item)*/
newV1= newV1 + 1                                   /*�*Eureka!  We found a number (or item).*/
do m=1  for length(j)             /*�*build a sequence string to display.  */
newV2= newV2 word(list, substr(j, m, 1) ) /*�*obtain a number (or item) to display.*/
end   /*�*m*/

say 'a non─continuous subsequence: '   newV2   /*�*show the non─continuous subsequence. */
end         /*�*j*/
say                                              /*�*help ensure visual fidelity in output*/
if newV1==0  then newV1= 'no'                            /*�*make it look more gooder Angleshy.   */
say  newV1   "non─continuous subsequence"s(newV1)    'were found.'             /*�*handle plurals.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:  if arg(1)==1  then return '';   return word( arg(2) 's',  1)    /*�*simple pluralizer.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Non-continuous-subsequences\non-continuous-subsequences.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
