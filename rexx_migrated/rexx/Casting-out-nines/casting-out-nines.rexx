/*ͺ*REXX program demonstrates the  castingβoutβnines  algorithm  (with Kaprekar numbers). */
parse arg LO HI base .                           /*ͺ*obtain optional arguments from the CL*/
if LO=='' | LO==","  then do; LO=1; HI=1000; end /*ͺ*Not specified?   Then use the default*/
if HI=='' | HI==","  then HI= LO                 /*ͺ* "      "          "   "   "     "   */
if base=='' | base==","  then base= 10           /*ͺ* "      "          "   "   "     "   */
numeric digits max(9, 2*length(HI**2) )          /*ͺ*insure enough decimal digits for HIΒ².*/
numbers= castOut(LO, HI, base)                   /*ͺ*generate a list of (cast out) numbers*/
newV1= 'cast-out-'  || (base-1)     "test"   /*ͺ*construct a shortcut text for output.*/
say 'For'     LO     "through"     HI', the following passed the'       newV1":"
say numbers;         say                         /*ͺ*display the list of cast out numbers.*/
q= HI - LO + 1                                   /*ͺ*Q:   is the range of numbers in list.*/
p= words(numbers)                                /*ͺ*P"    "  " number  "    "     "   "  */
pc= format(p/q * 100, , 2) / 1  ||  '%'          /*ͺ*calculate the percentage (%) cast out*/
say 'For'   q   "numbers,"   p   'passed the'    newV1    "("pc') for base'    base"."
if base\==10  then exit                          /*ͺ*if radix isn't ten, then exit program*/
Kaps= Kaprekar(LO, HI)                           /*ͺ*generate a list of Kaprekar numbers. */
say;  say   'The Kaprekar numbers in the same range are:'   Kaps
say
do i=1  for words(Kaps);    x= word(Kaps, i)                 /*ͺ*verify 'em in list.*/
if wordpos(x, numbers)\==0  then iterate                     /*ͺ*it's OK so far Β·Β·Β· */
say 'Kaprekar number'   x   "isn't in the numbers list."     /*ͺ*oopsβay!           */
exit 13                                                      /*ͺ*go spank the coder.*/
end   /*ͺ*i*/

say 'All Kaprekar numbers are in the'     newV1     "numbers list."             /*ͺ*OK*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
castOut:  procedure;  parse arg low,high,radix;       rm= word(radix 10, 1) - 1;        newV2=
do j=low  to  word(high low, 1)    /*ͺ*test a range of numbers. */
if j//rm == j*j//rm  then newV2= newV2 j   /*ͺ*did number pass the test?*/
end   /*ͺ*j*/                        /*ͺ* [β]  Then add # to list.*/
return strip(newV2)                        /*ͺ*strip and leading blanks from result.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Kaprekar: procedure;  parse arg L,H;   newV2=;   if L<=1  then newV2= 1  /*ͺ*add unity if in range*/
do j=max(2, L)  to H;        s= j*j  /*ͺ*a slow way to find Kaprekar numbers. */
do m=1  for length(s)%2
if j==left(s, m) + substr(s, m+1)  then do;  newV2= newV2 j;   leave;    end
end   /*ͺ*m*/                       /*ͺ*     [β]  found a Kaprekar number.   */
end       /*ͺ*j*/
return strip(newV2)                        /*ͺ*return Kaprekar numbers to invoker.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Casting-out-nines\casting-out-nines.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
