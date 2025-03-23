/*�*REXX program calculates the  GCD (Greatest Common Divisor)  of any number of integers.*/
numeric digits 2000                              /*�*handle up to 2k decimal dig integers.*/
call gcd 0 0            ;    call gcd 55 0     ;       call gcd 0    66
call gcd 7,21           ;    call gcd 41,47    ;       call gcd 99 , 51
call gcd 24, -8         ;    call gcd -36, 9   ;       call gcd -54, -6
call gcd 14 0 7         ;    call gcd 14 7 0   ;       call gcd 0  14 7
call gcd 15 10 20 30 55 ;    call gcd 137438691328  2305843008139952128 /*�*◄──2 perfect#s*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gcd: procedure;  newV1=;              do i=1 for  arg();  newV1=newV1 arg(i);  end       /*�*arg list.*/
parse var newV1 x z .;  if x=0  then x=z;   x=abs(x)                        /*�* 0 case? */

do j=2  to words(newV1);   y=abs(word(newV1,j));       if y=0  then iterate  /*�*is zero? */
do until newV2==0;  newV2=x//y;  x=y;  y=newV2;  end /*�* ◄────────── the heavy lifting.*/
end   /*�*j*/

say 'GCD (Greatest Common Divisor) of '   translate(space(newV1),",",' ')   "  is  "   x
return x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greatest-common-divisor\greatest-common-divisor-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
