/*ͺ*REXX program computes and displays the Isqrt  (integer square root)  of some integers.*/
numeric digits 200                               /*ͺ*insure 'nuff decimal digs for results*/
parse arg range power base .                     /*ͺ*obtain optional arguments from the CL*/
if range=='' | range==","  then range= 0..65     /*ͺ*Not specified?  Then use the default.*/
if power=='' | power==","  then power= 1..73     /*ͺ* "      "         "   "   "     "    */
if base =='' | base ==","  then base =     7     /*ͺ* "      "         "   "   "     "    */
parse var  range   rLO  '..'  rHI;     if rHI==''  then rHI= rLO      /*ͺ*handle a range? */
parse var  power   pLO  '..'  pHI;     if pHI==''  then pHI= pLO      /*ͺ*   "   "   "    */
newV1=
do j=rLO  to rHI  while rHI>0        /*ͺ*compute Isqrt for a range of integers*/
newV1= newV1 commas( Isqrt(j) )              /*ͺ*append the Isqrt to a list for output*/
end   /*ͺ*j*/
newV1= strip(newV1)                                      /*ͺ*elide the leading blank in the list. */
say center(' Isqrt for numbers: '   rLO   " βββΊ "  rHI' ',  length(newV1),  "β")
say strip(newV1)                                     /*ͺ*$  has a leading blank for 1st number*/
say
z= base ** pHI                                   /*ͺ*compute  max. exponentiation product.*/
Lp= max(30, length( commas(       z) ) )         /*ͺ*length of "          "          "    */
Lr= max(20, length( commas( Isqrt(z) ) ) )       /*ͺ* "     "    "  "   "  Isqrt of above.*/
say 'index'   center(base"**index", Lp)       center('Isqrt', Lr)        /*ͺ*show a title.*/
say 'βββββ'   copies("β",           Lp)       copies('β',     Lr)        /*ͺ*  "  " header*/

do j=pLO  to pHI  by 2  while pHI>0;                              x= base ** j
say center(j, 5)  right( commas(x), Lp)      right( commas( Isqrt(x) ),  Lr)
end   /*ͺ*j*/                          /*ͺ* [β]  show a bunch of powers & Isqrt.*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV2;  do jc=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, jc); end;  return newV2
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Isqrt: procedure; parse arg x                    /*ͺ*obtain the only passed argument  X.  */
x= x % 1                                  /*ͺ*convert possible real X to an integer*/     /*ͺ* ββ β β β β β β   optional. */
q= 1                                      /*ͺ*initialize the  Q  variable to unity.*/
do until q>x      /*ͺ*find a  Q  that is greater than  X.  */
q= q * 4          /*ͺ*multiply   Q   by four.              */
end   /*ͺ*until*/
r= 0                                      /*ͺ*R:    will be the integer sqrt of X. */
do while q>1                    /*ͺ*keep processing while  Q  is > than 1*/
q= q % 4                        /*ͺ*divide  Q  by four  (no remainder).  */
t= x - r - q                    /*ͺ*compute a temporary variable.        */
r= r % 2                        /*ͺ*divide  R  by two   (no remainder).  */
if t >= 0  then do              /*ͺ*if   T  is nonβnegative  ...         */
x= t            /*ͺ*recompute the value of  X            */
r= r + q        /*ͺ*    "      "    "    "  R            */
end
end   /*ͺ*while*/
return r                                  /*ͺ*return the integer square root of X. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Isqrt-integer-square-root-of-X\isqrt-integer-square-root-of-x.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
