/*ͺ*REXX program can  generate and display several  EKG  sequences  (with various starts).*/
parse arg nums start                             /*ͺ*obtain optional arguments from the CL*/
if  nums=='' |  nums==","  then  nums= 50        /*ͺ*Not specified?  Then use the default.*/
if start= '' | start= ","  then start=2 5 7 9 10 /*ͺ* "      "         "   "   "     "    */

do s=1  for words(start);   newV1=              /*ͺ*step through the specified  STARTs.  */
second= word(start, s);     say             /*ͺ*obtain the second integer in the seq.*/

do j=1  for nums
if j<3  then do; newV2=1;  if j==2  then newV2=second;  end   /*ͺ*handle 1st & 2nd number*/
else newV2= ekg(newV2)
newV1= newV1 right(newV2,  max(2, length(newV2) ) )     /*ͺ*append the EKG integer to the $ list.*/
end   /*ͺ*j*/                             /*ͺ* [β] the RIGHT BIF aligns the numbers*/
say '(start'  right(second,  max(2, length(second) ) )"):"newV1      /*ͺ*display EKG seq.*/
end       /*ͺ*s*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
addnewV3:   do  while z//j == 0;    z=z%j;    newV3=newV3 j;    w=w+1;    end;         return strip(newV3)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ekg: procedure expose newV1; parse arg x 1 z,,newV3
w=0                                                        /*ͺ*W:  number of factors.*/
do k=1  to 11  by 2;     j=k;  if j==1  then j=2   /*ͺ*divide by low primes. */
if j==9  then iterate;   call addnewV3                 /*ͺ*skip Γ· 9; add to list.*/
end   /*ͺ*k*/
/*ͺ*β skips multiples of 3*/
do y=0  by 2;  j= j + 2 + y//4                     /*ͺ*increment J by 2 or 4.*/
parse var  j  ''  -1  r;  if r==5  then iterate    /*ͺ*divisible by five ?   */
if j*j>x | j>z  then leave                         /*ͺ*passed the sqrt(x) ?  */
newV3= addnewV3()                                          /*ͺ*add a factor to list. */
end   /*ͺ*y*/
j=z;                    if z\==1  then newV3= addnewV3()           /*ͺ*ZΒ¬=1? Then addβββΊlist.*/
if newV3=''  then newV3=x                                          /*ͺ*Null? Then use prime. */
do   j=3;                          done=1
do k=1  for w
if j // word(newV3, k)==0  then do;  done=0;  leave;  end
end   /*ͺ*k*/
if done  then iterate
if wordpos(j, newV1)==0  then return j             /*ͺ*return an EKG integer.*/
end     /*ͺ*j*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\EKG-sequence-convergence\ekg-sequence-convergence.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
