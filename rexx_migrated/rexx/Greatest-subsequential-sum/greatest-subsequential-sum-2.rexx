/*ª*REXX program  finds and displays  the  shortest  greatest continuous subsequence  sum.*/
parse arg newV2;         w= words(newV2);      p= w + 1  /*ª*get arg list;  number words in list. */
say 'words='w    "   list="newV2                     /*ª*show number words & LIST to terminal.*/
do newV3=1  for w;  newV1.newV3= word(newV2, newV3);  end       /*ª*build an array for faster processing.*/
L=0;                    sum= 0                   /*ª* [â†“]  process the list of numbers.   */
do j=1  for w                               /*ª*select one number at a time from list*/
do k=j  to w;  s= newV1.j                   /*ª* [â†“]  process a subâ”€list of numbers. */
do m=j+1  to k;   s= s + newV1.m;             end  /*ª*m*/
if s>sum  then do;     sum= s;   p= j;   L= k - j + 1;   end
end   /*ª*k*/                             /*ª* [â†‘]  chose greatest sum of numbers. */
end       /*ª*j*/
say
newV4= subword(newV2,p,L);   if newV4==''  then newV4= "[NULL]"  /*ª*Englishize the  null  (value).       */
say 'sum='sum/1            "   sequence="newV4       /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greatest-subsequential-sum\greatest-subsequential-sum-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
