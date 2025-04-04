/*ͺ*REXX program finds and displays Wilson primes:  a prime   P   such that  P**2 divides:*/
/*ͺ*ββββββββββββββββββ (n-1)! * (P-n)!  -  (-1)**n   where  n  is 1 βββ 11,   and  P < 18.*/
parse arg oLO oHI hip .                          /*ͺ*obtain optional argument from the CL.*/
if  oLO=='' |  oLO==","  then  oLO=      1       /*ͺ*Not specified?  Then use the default.*/
if  oHI=='' |  oHI==","  then  oHI=     11       /*ͺ* "      "         "   "   "     "    */
if  hip=='' |  hip==","  then  hip=  11000       /*ͺ* "      "         "   "   "     "    */
call genP                                        /*ͺ*build array of semaphores for primes.*/
newV1.= .                                           /*ͺ*define the  default  for factorials. */
bignum= !(hip)                                   /*ͺ*calculate a ginormous factorial prod.*/
parse value bignum 'E0' with ex 'E' ex .         /*ͺ*obtain possible exponent of factorial*/
numeric digits (max(9, ex+2) )                   /*ͺ*calculate max # of dec. digits needed*/
call facts hip                                   /*ͺ*go & calculate a number of factorials*/
title= ' Wilson primes  P  of order '  oLO " βββΊ " oHI',  where  P < '  commas(hip)
w= length(title) + 1                             /*ͺ*width of columns of possible numbers.*/
say ' order β'center(title, w     )
say 'ββββββββΌ'center(""   , w, 'β')
do n=oLO  to oHI;  nf= !(n-1)              /*ͺ*precalculate a factorial product.    */
z= -1**n                                   /*ͺ*     "       " plus or minus (+1β-1).*/
if n==1   then lim= 103                    /*ͺ*limit to known primes for 1st order. */
else lim=   newV6                    /*ͺ*  "    "  all     "    "  orders β₯ 2.*/
newV4=                                         /*ͺ*$:  a line (output) of Wilson primes.*/
do j=1  for lim;    p= newV2.j              /*ͺ*search through some generated primes.*/
if (nf*!(p-n)-z)//sq.j\==0 then iterate /*ͺ*expression ~ q.j ?  No, then skip it.*/       /*ͺ* ββ β β β β β β  the filter.*/
newV4= newV4  ' '  commas(p)                    /*ͺ*add a commatized prime  βββΊ  $  list.*/
end   /*ͺ*p*/

if newV4==''  then newV4= '        (none found within the range specified)'
say center(n, 7)'β'  substr(newV4, 2)          /*ͺ*display what Wilson primes we found. */
end   /*ͺ*n*/
say 'ββββββββ΄'center(""   , w, 'β')
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
!:      arg x; if newV1.x\==.  then return newV1.x;  a=1;  do f=1  for x;   a=a*f; end; return a
commas: parse arg newV5;  do jc=length(newV5)-3  to 1  by -3; newV5=insert(',', newV5, jc); end;  return newV5
facts:  newV1.= 1;   x= 1;  do  f=1  for hip;   x= x * f;   newV1.f= x;           end;  return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP:        newV2.1=2; newV2.2=3; newV2.3=5; newV2.4=7;  newV2.5=11 /*ͺ*define some low primes.              */
newV3.=0;  newV3.2=1; newV3.3=1; newV3.5=1; newV3.7=1;  newV3.11=1 /*ͺ*   "     "   "    "     semaphores.  */
sq.1=4; sq.2=9; sq.3= 25; sq.4= 49; newV6= 5;  sq.newV6= newV2.newV6**2   /*ͺ*squares of low primes.*/
do j=newV2.newV6+2  by 2  for max(0, hip%2-newV2.newV6%2-1)     /*ͺ*find odd primes from here on. */
parse var  j   ''  -1  newV7;  if    newV7==5  then iterate    /*ͺ*J Γ· 5?   (right digit).*/
if j//3==0  then iterate;  if j//7==0  then iterate    /*ͺ*" " 3?    Is J Γ· by 7? */
do k=5  while sq.k<=j             /*ͺ* [β]  divide by the known odd primes.*/
if j // newV2.k == 0  then iterate j  /*ͺ*Is  J Γ· X?  Then not prime.     ___  */
end   /*ͺ*k*/                       /*ͺ* [β]  only process numbers  βξεχΦ΄  β J   */
newV6= newV6+1;    newV2.newV6= j;    sq.newV6= j*j;  newV3.j= 1 /*ͺ*bump # of Ps; assign next P;  PΒ²; P# */
end          /*ͺ*j*/;               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Wilson-primes-of-order-n\wilson-primes-of-order-n.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
