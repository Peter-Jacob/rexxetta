/*�*REXX program  generates   pseudo─random numbers   using the  XOR─shift─star  method.  */
numeric digits 200                               /*�*ensure enough decimal digs for mult. */
parse arg n reps pick seed1 seed2 .              /*�*obtain optional arguments from the CL*/
if     n=='' |     n==","  then    n=          5 /*�*Not specified?  Then use the default.*/
if  reps=='' |  reps==","  then reps=     100000 /*�* "      "         "   "   "     "    */
if  pick=='' |  pick==","  then pick=          5 /*�* "      "         "   "   "     "    */
if seed1=='' | seed1==","  then seed1=   1234567 /*�* "      "         "   "   "     "    */
if seed2=='' | seed2==","  then seed2= 987654321 /*�* "      "         "   "   "     "    */
const= x2d(2545f4914f6cdd1d)                     /*�*initialize the constant to be used.  */
o.12= copies(0, 12)                              /*�*construct  12  bits of zeros.        */
o.25= copies(0, 25)                              /*�*     "     25    "   "   "           */
o.27= copies(0, 27)                              /*�*     "     27    "   "   "           */
w= max(3, length(n) )                            /*�*for aligning the left side of output.*/
state= seed1                                     /*�*     "     the   state  to seed #1.  */
do j=1  for n
if j==1  then do;   say center('n', w)   "    pseudo─random number"
say copies('═', w)   " ══════════════════════════"
end
say right(j':', w)" "  right(commas(next()), 18)  /*�*display a random number*/
end   /*�*j*/
say
if reps==0  then exit 0                          /*�*stick a fork in it,  we're all done. */
say center('#', w)   "  count of pseudo─random #"
say copies('═', w)   " ══════════════════════════"
state= seed2                                     /*�*     "     the   state  to seed #2.  */
newV1.= 0;                         div= pick / 2**32 /*�*convert division to inverse multiply.*/
do k=1  for reps
parse value next()*div  with  newV2 '.' /*�*get random #, floor of a "division". */
newV1.newV2= newV1.newV2 + 1                        /*�*bump the counter for this random num.*/
end   /*�*k*/

do newV3=0  for pick
say right(newV3':', w)" "  right(commas(newV1.newV3), 14) /*�*show count of a random num.*/
end   /*�*#*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
b2d:    parse arg newV4; return        x2d( b2x(newV4) )           /*�*convert bin ──► decimal.   */
d2b:    parse arg newV4; return right( x2b( d2x(newV4) ),  64, 0)  /*�*convert dec ──► 64 bit bin.*/
commas: parse arg newV2;   do newV4=length(newV2)-3  to 1  by -3; newV2= insert(',', newV2, newV4); end;  return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
next: procedure expose state const o.;  x= d2b(state)      /*�*convert  STATE  to binary. */
x  = xor(x,  left( o.12 || x,  64) )               /*�*shift right 12 bits and XOR*/
x  = xor(x, right( x || o.25,  64) )               /*�*  "    left 25  "    "   " */
x  = xor(x,  left( o.27 || x,  64) )               /*�*  "   right 27  "    "   " */
state= b2d(x)                                        /*�*set  STATE to the latest X.*/
return b2d( left( d2b(state * const), 32) )          /*�*return a pseudo─random num.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
xor:  parse arg a, b;                     newV5=               /*�*perform a bit─wise  XOR.   */
do newV6=1  for length(a);    newV5= newV5  ||  (substr(a,newV6,1)  &&  substr(b,newV6,1) )
end   /*�*!*/;       return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pseudo-random-numbers-Xorshift-star\pseudo-random-numbers-xorshift-star.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
