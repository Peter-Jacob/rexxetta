/*ª* REXX ***************************************************************
* Program to calculate and show divisors of positive integer(s).
* 03.08.2012 Walter Pachl  simplified the above somewhat
*            in particular I see no benefit from divAdd procedure
* 04.08.2012 the reference to 'above' is no longer valid since that
*            was meanwhile changed for the better.
* 04.08.2012 took over some improvements from new above
**********************************************************************/
Parse arg low high .
Select
When low=''  Then Parse Value '1 200' with low high
When high='' Then high=low
Otherwise Nop
End
do j=low to high
say '   n = ' right(j,6) "   divisors = " divs(j)
end
exit

divs: procedure; parse arg x
if x==1 then return 1               /*ª*handle special case of 1     */
Parse Value '1' x With lo hi        /*ª*initialize lists: lo=1 hi=x  */
odd=x//2                            /*ª* 1 if x is odd               */
Do j=2+odd By 1+odd While j*j<x     /*ª*divide by numbers<sqrt(x)    */
if x//j==0 then Do                /*ª*Divisible?  Add two divisors:*/
lo=lo j                         /*ª* list low divisors           */
hi=x%j hi                       /*ª* list high divisors          */
End
End
If j*j=x Then                       /*ª*for a square number as input */
lo=lo j                           /*ª* add its square root         */
return lo hi                        /*ª* return both lists           */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Factors-of-an-integer\factors-of-an-integer-2.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
