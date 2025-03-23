/*�*REXX program  generates   pseudo─random numbers   using the  split mix 64 bit  method.*/
numeric digits 200                               /*�*ensure enough decimal digs for mult. */
parse arg n reps pick seed1 seed2 .              /*�*obtain optional arguments from the CL*/
if     n=='' |     n==","  then    n=          5 /*�*Not specified?  Then use the default.*/
if  reps=='' |  reps==","  then reps=     100000 /*�* "      "         "   "   "     "    */
if  pick=='' |  pick==","  then pick=          5 /*�* "      "         "   "   "     "    */
if seed1=='' | seed1==","  then seed1=   1234567 /*�* "      "         "   "   "     "    */
if seed2=='' | seed2==","  then seed2= 987654321 /*�* "      "         "   "   "     "    */
const.1= x2d( 9e3779b97f4a7c15 )                 /*�*initialize 1st constant to be used.  */
const.2= x2d('bf58476d1ce4e5b9')                 /*�*    "      2nd     "     "  "   "    */
const.3= x2d( 94d049bb133111eb )                 /*�*    "      3rd     "     "  "   "    */
o.30= copies(0, 30)                              /*�*construct  30  bits of zeros.        */
o.27= copies(0, 27)                              /*�*     "     27    "   "   "           */
o.31= copies(0, 31)                              /*�*     "     31    "   "   "           */
w= max(3, length(n) )                            /*�*for aligning the left side of output.*/
state= seed1                                     /*�*     "     the   state  to seed #1.  */
do j=1  for n
if j==1  then do;   say center('n', w)     "     pseudo─random number   "
say copies('═', w)     " ════════════════════════════"
end
say right(j':', w)" "  right(commas(next()), 27)  /*�*display a random number*/
end   /*�*j*/
say
if reps==0  then exit 0                          /*�*stick a fork in it,  we're all done. */
say center('#', w)   "   count of pseudo─random #"
say copies('═', w)   " ════════════════════════════"
state= seed2                                     /*�*     "     the   state  to seed #2.  */
newV1.= 0;                         div= pick / 2**64 /*�*convert division to inverse multiply.*/
do k=1  for reps
parse value next()*div  with  newV2 '.' /*�*get random #, floor of a "division". */
newV1.newV2= newV1.newV2 + 1                        /*�*bump the counter for this random num.*/
end   /*�*k*/

do newV3=0  for pick
say right(newV3':', w)" "  right(commas(newV1.newV3), 15) /*�*show count of a random num.*/
end   /*�*#*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV2;   do newV4=length(newV2)-3  to 1  by -3; newV2= insert(',', newV2, newV4); end;  return newV2
b2d:    parse arg newV4; return        x2d( b2x(newV4) )             /*�*convert bin──►decimal.   */
d2b:    parse arg newV4; return right( x2b( d2x(newV4) ),  64, 0)    /*�*convert dec──►64 bit bin.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
next: procedure expose state const. o.
state= state + const.1        ; z= d2b(state)          /*�*add const1──►STATE; conv.*/
z= xor(z, left(o.30 || z, 64)); z= d2b(b2d(z)*const.2) /*�*shiftR 30 bits & XOR;  " */
z= xor(z, left(o.27 || z, 64)); z= d2b(b2d(z)*const.3) /*�*   "   27  "   "  "    " */
z= xor(z, left(o.31 || z, 64));        return b2d(z)   /*�*   "   31  "   "  "    " */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
xor:  parse arg a, b;                    newV5=                  /*�*perform a bit─wise  XOR. */
do newV6=1  for length(a);   newV5= newV5  ||  (substr(a,newV6,1)  &&  substr(b,newV6,1) )
end   /*�*!*/;      return newV5
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pseudo-random-numbers-Splitmix64\pseudo-random-numbers-splitmix64.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
