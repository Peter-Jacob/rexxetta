/*�*REXX program illustrates and displays a simple moving average using a constructed list*/
parse arg p q n .                                /*�*obtain optional arguments from the CL*/
if p=='' | p==","  then p=  3                    /*�*Not specified?  Then use the default.*/
if q=='' | q==","  then q=  5                    /*�* "      "         "   "   "     "    */
if n=='' | n==","  then n= 10                    /*�* "      "         "   "   "     "    */
newV1.= 0                                            /*�*default value, only needed for odd N.*/
do j=1    for n%2;       newV1.j= j            /*�*build 1st half of list, increasing #s*/
end   /*�*j*/

do k=n%2  by -1  to 1;   newV1.j= k;   j= j+1  /*�*  "   2nd   "   "   "   decreasing " */
end   /*�*k*/
say '  number  '     " SMA with period" p' '   " SMA with period" q
say ' ──────── '     "───────────────────"     '───────────────────'
pad='     '
do m=1  for n;  say center(newV1.m, 10)  pad left(SMA(p, m), 19)     left(SMA(q, m), 19)
end   /*�*m*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
SMA: procedure expose newV1.;  parse arg p,j;                          i= 0    ;    newV2= 0
do k=max(1, j-p+1)  to j+p  for p  while k<=j;    i= i + 1;    newV2= newV2 + newV1.k
end   /*�*k*/
return newV2/i                                  /*�*SMA   ≡   simple moving average.     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Averages-Simple-moving-average\averages-simple-moving-average.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
