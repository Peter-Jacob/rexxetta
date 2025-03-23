/*�*REXX pgm orders some items based on (correct) answers from a  carbon─based life form. */
colors= 'violet red green indigo blue yellow orange'
q= 0;    newV2= 0;    newV3=
do j=1  for words(colors);   q= inSort( word(colors, j), q)
end   /*�*j*/                           /*�*poise questions the CBLF about order.*/
say
do i=1  for newV2;   say '   query'   right(i, length(newV2) )":"   newV1.i
end   /*�*i*/                           /*�* [↑] show the list of queries to CBLF*/
say
say 'final ordering: '    newV3
exit 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
getAns: newV2= newV2 + 1;    newV4= copies('─', 8);     ynewV4n= '     Answer  y/n'
do try=0  until ansU='Y'  |  ansU='N'
if try>0  then say newV4 '(***error***)  incorrect answer.'
ask= newV4  ' is '   center(x,6)   " less than "   center(word(newV3, mid+1),6)  '?'
say ask   ynewV4n;  parse pull ans 1 ansU;   ansU= space(ans);   upper ansU
end   /*�*until*/;      newV1.newV2= ask   '  '    ans;                return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
inSort: parse arg x, q;          hi= words(newV3);          lo= 0
do q=q-1  while lo<hi;              mid= (lo+hi) % 2
call getAns;  if ansU=='Y'  then hi= mid
else lo= mid + 1
end   /*�*q*/
newV3= subword(newV3, 1, lo)  x  subword(newV3, lo+1);      return q
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Order-by-pair-comparisons\order-by-pair-comparisons.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
