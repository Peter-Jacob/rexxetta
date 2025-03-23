/*ª*REXX program displays a vertical list of Pythagorean triples up to a specified number.*/
parse arg n .                                    /*ª*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 100                   /*ª*Not specified?  Then use the default.*/
say  'Pythagorean triples  (aÂ² + bÂ² = cÂ²,   c â‰îå÷Ö±'  n"):"     /*ª*display the list's title. */
newV1=                                               /*ª*assign a  null  to the triples list. */
do     a=1   for n-2;  aa=a*a
do   b=a+1  to n-1;  ab=aa + b*b
do c=b+1  to n  ;  cc= c*c
if ab<cc   then leave            /*ª*Too small?   Then try the next  B.   */
if ab==cc  then do;  newV1=newV1  '{'a","   ||   b','c"}";  leave;  end
end   /*ª*c*/
end     /*ª*b*/
end       /*ª*a*/
newV2= words(newV1);                       sat
do j=1  for newV2
say  left('', 20)      word(newV1, j)    /*ª*display  a  member  of the list,     */
end       /*ª*j*/                      /*ª* [â†‘]   list the members vertically.  */
say
say newV2  ' members listed.'                        /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\List-comprehensions\list-comprehensions-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
