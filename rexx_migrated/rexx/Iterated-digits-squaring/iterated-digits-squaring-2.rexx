/*�*REXX program performs the squaring of iterated digits  (until the sum equals 1 or 89).*/
parse arg n .                                    /*�*obtain optional arguments from the CL*/
if n=='' | n==","  then n=10 * 1000000           /*�*Not specified?  Then use the default.*/
newV1.=0;      do m=1  for 9;  newV1.m=m**2;  end /*�*m*/  /*�*build a short-cut for the squares.   */
newV2.=.; newV2.0=0;  newV2.00=0;  newV2.000=0;  newV2.0000=0; newV3.=newV2. /*�*short-cuts for sub-group summations. */
newV4.=0                                             /*�*count of  1  and  89  results so far.*/
do j=1  for n;       s=sumDs(j)             /*�* [?]  process each number in a range.*/
newV4.s=newV4.s + 1                                 /*�*bump the counter for  1's  or  89's. */
end   /*�*j*/

do k=1  by 88  for 2;   newV5=right('"'k'"', 5)    /*�*display two results; define a literal*/
say 'count of'   newV5    " chains for all natural numbers up to "     n     ' is:'      newV4.k
end   /*�*k*/                                    /*�*stick a fork in it,  we're all done. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*--------------------------------------------------------------------------------------*/
sumDs: parse arg z;  chunk=3                     /*�*obtain the number (for adding digits)*/
p=0                                       /*�*set partial sum of the decimal digits*/
do m=1  by chunk  to length(z)         /*�*process the number, in chunks of four*/
y=substr(z, m, chunk)                  /*�*extract a 4-byte chunk of the number.*/
if newV3.y==.  then do;   oy=y;      a=0   /*�*Not done before?  Then sum the number*/
do  until y==''      /*�*process each of the dec. digits in Y.*/
parse var y  newV6 +1 y  /*�*obtain a decimal digit; add it to  A.*/
a=a + newV1.newV6            /*�*obtain a decimal digit; add it to  A.*/
end  /*�*until y ···*/ /*�* [?]   A = is the sum of squared digs*/
newV3.oy=a                 /*�*mark original  Y  as being summed.   */
end
else a=newV3.y                  /*�*use the  pre-summed  digits of  Y.   */
p=p + a                                /*�*add all the parts of number together.*/
end   /*�*m*/

if newV2.p\==.  then return newV2.p               /*�*Computed before?  Then use the value.*/
y=p                                       /*�*use a new copy of  P.                */
do  until s==1 | s==89;  s=0       /*�*add the squared decimal digits of  P.*/
do  until y==''                 /*�*process each  decimal digits in    X.*/
parse var y  newV6 +1 y;  s=s + newV1.newV6 /*�*get a dec. digit; sum the fast square*/
end   /*�*until y ···*/           /*�* [?]  S = is sum of the squared digs.*/
y=s                                /*�*substitute the sum for a  "new"  X.  */
end      /*�*until s ···*/           /*�* [?]  keep looping 'til  S=1  or  89.*/
newV2.p=s                                     /*�*use this for memoization for the sum.*/
return s
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Iterated-digits-squaring\iterated-digits-squaring-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
