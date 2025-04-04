/*ͺ*REXX program  generates   pseudoβrandom numbers   using the  XORβshiftβstar  method.  */
numeric digits 200                               /*ͺ*ensure enough decimal digs for mult. */
parse arg n reps pick seed1 seed2 .              /*ͺ*obtain optional arguments from the CL*/
if     n=='' |     n==","  then    n=          5 /*ͺ*Not specified?  Then use the default.*/
if  reps=='' |  reps==","  then reps=     100000 /*ͺ* "      "         "   "   "     "    */
if  pick=='' |  pick==","  then pick=          5 /*ͺ* "      "         "   "   "     "    */
if seed1=='' | seed1==","  then seed1=   1234567 /*ͺ* "      "         "   "   "     "    */
if seed2=='' | seed2==","  then seed2= 987654321 /*ͺ* "      "         "   "   "     "    */
const= x2d(2545f4914f6cdd1d)                     /*ͺ*initialize the constant to be used.  */
o.12= copies(0, 12)                              /*ͺ*construct  12  bits of zeros.        */
o.25= copies(0, 25)                              /*ͺ*     "     25    "   "   "           */
o.27= copies(0, 27)                              /*ͺ*     "     27    "   "   "           */
w= max(3, length(n) )                            /*ͺ*for aligning the left side of output.*/
state= seed1                                     /*ͺ*     "     the   state  to seed #1.  */
do j=1  for n
if j==1  then do;   say center('n', w)   "    pseudoβrandom number"
say copies('β', w)   " ββββββββββββββββββββββββββ"
end
say right(j':', w)" "  right(commas(next()), 18)  /*ͺ*display a random number*/
end   /*ͺ*j*/
say
if reps==0  then exit 0                          /*ͺ*stick a fork in it,  we're all done. */
say center('#', w)   "  count of pseudoβrandom #"
say copies('β', w)   " ββββββββββββββββββββββββββ"
state= seed2                                     /*ͺ*     "     the   state  to seed #2.  */
newV1.= 0;                         div= pick / 2**32 /*ͺ*convert division to inverse multiply.*/
do k=1  for reps
parse value next()*div  with  newV2 '.' /*ͺ*get random #, floor of a "division". */
newV1.newV2= newV1.newV2 + 1                        /*ͺ*bump the counter for this random num.*/
end   /*ͺ*k*/

do newV3=0  for pick
say right(newV3':', w)" "  right(commas(newV1.newV3), 14) /*ͺ*show count of a random num.*/
end   /*ͺ*#*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
b2d:    parse arg newV4; return        x2d( b2x(newV4) )           /*ͺ*convert bin βββΊ decimal.   */
d2b:    parse arg newV4; return right( x2b( d2x(newV4) ),  64, 0)  /*ͺ*convert dec βββΊ 64 bit bin.*/
commas: parse arg newV2;   do newV4=length(newV2)-3  to 1  by -3; newV2= insert(',', newV2, newV4); end;  return newV2
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
next: procedure expose state const o.;  x= d2b(state)      /*ͺ*convert  STATE  to binary. */
x  = xor(x,  left( o.12 || x,  64) )               /*ͺ*shift right 12 bits and XOR*/
x  = xor(x, right( x || o.25,  64) )               /*ͺ*  "    left 25  "    "   " */
x  = xor(x,  left( o.27 || x,  64) )               /*ͺ*  "   right 27  "    "   " */
state= b2d(x)                                        /*ͺ*set  STATE to the latest X.*/
return b2d( left( d2b(state * const), 32) )          /*ͺ*return a pseudoβrandom num.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
xor:  parse arg a, b;                     newV5=               /*ͺ*perform a bitβwise  XOR.   */
do newV6=1  for length(a);    newV5= newV5  ||  (substr(a,newV6,1)  &&  substr(b,newV6,1) )
end   /*ͺ*!*/;       return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pseudo-random-numbers-Xorshift-star\pseudo-random-numbers-xorshift-star.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
