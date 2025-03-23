/*ª*REXX program performs the squaring of iterated digits  (until the sum equals 1 or 89).*/
parse arg n .                                    /*ª*obtain optional arguments from the CL*/
if n=='' | n==","  then n=10 * 1000000           /*ª*Not specified?  Then use the default.*/
newV1.=0;   do m=1  for 9;  newV1.m=m**2;  end  /*ª*m*/    /*ª*build a short-cut for the squares.   */
a.=.;                                newV2.=newV1.       /*ª*intermediate counts of some numbers. */
do j=1  for n;                  x=j         /*ª* [?] process the numbers in the range*/
do q=1  until s==89 | s==1;   s=0         /*ª*add sum of the squared decimal digits*/
do  until x==''                     /*ª*process each of the dec. digits in X.*/
parse var x newV4 +1 x;     s=s + newV1.newV4   /*ª*get a digit;  sum the fast square,   */
end   /*ª*until x Â·Â·Â· */              /*ª* [?]  S=is sum of the squared digits.*/
z.q=s                                     /*ª*assign sum to a temporary auxiliary. */
if a.s\==.  then do;  s=a.s;  leave;  end /*ª*Found a previous sum?  Then use that.*/
x=s                                       /*ª*substitute the sum for the "new"  X. */
end   /*ª*q*/                               /*ª* [?]  keep looping 'til   S= 1 or 89.*/
do f=1  for q;  newV4=a.f;  a.newV4=s /*ª*use the auxiliary arrays (for lookup)*/
end   /*ª*f*/
newV2.s=newV2.s + 1                                 /*ª*bump the counter for the 1's or 89's.*/
end   /*ª*j*/

do k=1  by 88  for 2;   newV3=right('"'k'"', 5)   /*ª*display two results; define a literal*/
say 'count of'   newV3   " chains for all natural numbers up to "     n     ' is:'      newV2.k
end   /*ª*k*/                                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Iterated-digits-squaring\iterated-digits-squaring-1.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
