/*ª*REXX program  finds and displays  the  longest  greatest continuous subsequence  sum. */
parse arg newV2;         w= words(newV2);      p= w + 1  /*ª*get arg list;  number words in list. */
say 'words='w    "   list="newV2                     /*ª*show number words & LIST to terminal,*/
do newV3=1  for w;  newV1.newV3= word(newV2, newV3);  end       /*ª*build an array for faster processing.*/
L=0;                    sum= 0                   /*ª* [â†“]  process the list of numbers.   */
do j=1  for w                               /*ª*select one number at a time from list*/
do k=j  to w;  newV4= k-j+1;    s= newV1.j      /*ª* [â†“]  process a subâ”€list of numbers. */
do m=j+1  to k;     s= s + newV1.m;        end  /*ª*m*/
if (s==sum & newV4>L) | s>sum  then do;       sum= s;   p= j;      L= newV4;   end
end   /*ª*k*/                             /*ª* [â†‘]  chose the longest greatest sum.*/
end       /*ª*j*/
say
newV5= subword(newV2,p,L);   if newV5==''  then newV5= "[NULL]"  /*ª*Englishize the  null   (value).      */
say 'sum='sum/1            "   sequence="newV5       /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greatest-subsequential-sum\greatest-subsequential-sum-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
