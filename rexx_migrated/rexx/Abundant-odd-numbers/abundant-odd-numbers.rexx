/*�*REXX pgm displays abundant odd numbers:  1st 25,  one─thousandth,  first > 1 billion. */
parse arg Nlow Nuno Novr .                       /*�*obtain optional arguments from the CL*/
if Nlow=='' | Nlow==","  then Nlow=          25  /*�*Not specified?  Then use the default.*/
if Nuno=='' | Nuno==","  then Nuno=        1000  /*�* "      "         "   "   "     "    */
if Novr=='' | Novr==","  then Novr=  1000000000  /*�* "      "         "   "   "     "    */
numeric digits max(9, length(Novr) )             /*�*ensure enough decimal digits for  // */
newV1= 'odd abundant number'                         /*�*variable for annotating the output.  */
newV2= 0                                             /*�*count of odd abundant numbers so far.*/
do j=3  by 2  until newV2>=Nlow;   newV3= sigO(j)  /*�*get the  sigma  for an odd integer.  */
if newV3<=j  then iterate                      /*�*sigma  ����ֳ  J ?    Then ignore it.     */
newV2= newV2 + 1                                   /*�*bump the counter for abundant odd #'s*/
say rt(th(newV2))     newV1      'is:'rt(commas(j), 8)     rt("sigma=")     rt(commas(newV3), 9)
end  /*�*j*/
say
newV2= 0                                             /*�*count of odd abundant numbers so far.*/
do j=3  by 2;                  newV3= sigO(j)  /*�*get the  sigma  for an odd integer.  */
if newV3<=j    then iterate                    /*�*sigma  ����ֳ  J ?    Then ignore it.     */
newV2= newV2 + 1                                   /*�*bump the counter for abundant odd #'s*/
if newV2<Nuno  then iterate                    /*�*Odd abundant# count<Nuno?  Then skip.*/
say rt(th(newV2))     newV1      'is:'rt(commas(j), 8)     rt("sigma=")     rt(commas(newV3), 9)
leave                                      /*�*we're finished displaying NUNOth num.*/
end  /*�*j*/
say
do j=1+Novr%2*2  by 2;         newV3= sigO(j)  /*�*get sigma for an odd integer > Novr. */
if newV3<=j    then iterate                    /*�*sigma  ����ֳ  J ?    Then ignore it.     */
say rt(th(1))   newV1  'over'  commas(Novr)  "is: "   commas(j)  rt('sigma=')  commas(newV3)
leave                                      /*�*we're finished displaying NOVRth num.*/
end  /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas:parse arg newV4;  do cnewV4=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, cnewV4);  end;  return newV4
rt:    procedure;  parse arg newV2,len;     if len==''  then len= 20;     return right(newV2, len)
th:    parse arg th; return th||word('th st nd rd',1+(th//10)*(th//100%10\==1)*(th//10<4))
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sigO:  parse arg x;            s= 1              /*�*sigma for odd integers.           ___*/
do k=3  by 2  while k*k<x           /*�*divide by all odd integers up to √ x */
if x//k==0  then  s= s + k + x%k    /*�*add the two divisors to (sigma) sum. */
end   /*�*k*/                         /*�*                                  ___*/
if k*k==x  then  return s + k             /*�*Was  X  a square?    If so, add  √ x */
return s                 /*�*return (sigma) sum of the divisors.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Abundant-odd-numbers\abundant-odd-numbers.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
