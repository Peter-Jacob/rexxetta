/*�*REXX program finds the  next highest positive integer  from a list of decimal digits. */
parse arg n                                      /*�*obtain optional arguments from the CL*/
if n='' | n=","  then n= 0 9 12 21 12453 738440 45072010 95322020    /*�*use the defaults?*/
w= length( commas( word(n, words(n) ) ) )        /*�*maximum width number  (with commas). */

do j=1  for words(n);        y= word(n, j)  /*�*process each of the supplied numbers.*/
masky= mask(y)                              /*�*build a digit mask for a supplied int*/
lim= copies(9, length(y) )                  /*�*construct a  LIMIT  for the DO loop. */

do newV2=y+1  to lim  until mask(newV2)==masky /*�*search for a number that might work. */
if verify(y, newV2) \== 0  then iterate    /*�*does # have all the necessary digits?*/
end   /*�*#*/

if newV2>lim  then newV2= 0                         /*�*if # > lim,  then there is no valid #*/
say 'for ' right(commas(y),w) " ─── the next highest integer is: " right(commas(newV2),w)
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do newV4=length(newV3)-3  to 1  by -3;  newV3= insert(',', newV3, newV4); end;  return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
mask: parse arg z, newV5;   newV1.= 0                    /*�* [↓]  build an  unsorted digit mask. */
do k=1  for length(z);    parse var z newV3 +1 z;     newV1.newV3= newV1.newV3 + 1
end   /*�*k*/
do m=0  for 10;         if newV1.m==0  then iterate;            newV5= newV5 || copies(m, newV1.m)
end   /*�*m*/;      return newV5               /*�* [↑]  build  a    sorted  digit mask.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Next-highest-int-from-digits\next-highest-int-from-digits.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
