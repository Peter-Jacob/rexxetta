/*ª*REXX program shows a horizontal list of Pythagorean triples up to a specified number. */
parse arg n .                                    /*ª*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 100                   /*ª*Not specified?  Then use the default.*/
do k=1  for n;   newV1.k= k*k            /*ª*precompute the squares of usable #'s.*/
end   /*ª*k*/
sw= linesize() - 1                               /*ª*obtain the terminal width (less one).*/
say  'Pythagorean triples  (aÂ² + bÂ² = cÂ²,   c â‰îå÷Ö²'  n"):"     /*ª*display the list's title. */
newV2=                                               /*ª*assign a  null  to the triples list. */
do     a=1  for n-2;      bump= a//2 /*ª*Note:   A*A   is faster than   A**2. */
do b=a+1  to  n-1  by 1+bump
ab= newV1.a + newV1.b                      /*ª*AB: a shortcut for the sum of AÂ² & BÂ²*/
if bump==0 & b//2==0  then cump= 2
else cump= 1
do c=b+cump  to n by  cump
if ab<newV1.c   then leave           /*ª*Too small?   Then try the next  B.   */
if ab==newV1.c  then do;  newV2=newV2  '{'a","   ||   b','c"}";  leave;  end
end   /*ª*c*/
end     /*ª*b*/
end       /*ª*a*/
newV3= words(newV2);                     say
do j=1  until p==0;             p= lastPos('}', newV2, sw)    /*ª*find the last } */
if p\==0  then do;   newV4= left(newV2, p)
say strip(newV4)
newV2= substr(newV2, p+1)
end
end   /*ª*j*/
say strip(newV2);                    say
say newV3  ' members listed.'                        /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\List-comprehensions\list-comprehensions-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
