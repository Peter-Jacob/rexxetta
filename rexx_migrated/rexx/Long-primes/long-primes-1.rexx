/*ͺ*REXX pgm calculates/displays base ten  long primes  (AKA golden primes, proper primes,*/
/*ͺ*βββββββββββββββββββββ maximal period primes, long period primes, full reptend primes).*/
parse arg a                                      /*ͺ*obtain optional argument from the CL.*/
if a='' | a=","  then a= '500 -500 -1000 -2000 -4000 -8000 -16000' ,  /*ͺ*Not specified?  */
'-32000 -64000 -128000 -512000 -1024000'     /*ͺ*Then use default*/
do k=1  for words(a);     H=word(a, k)       /*ͺ*step through the list of high limits.*/
neg= H<1                                     /*ͺ*used as an indicator to display count*/
H= abs(H)                                    /*ͺ*obtain the absolute value of  H.     */
newV1=                                           /*ͺ*the list of  long primes   (so far). */
do j=7  to H  by 2                        /*ͺ*start with 7,  just use odd integers.*/
if .len(j) + 1 \== j  then iterate        /*ͺ*Period length wrong?   Then skip it. */
newV1=newV1 j                                     /*ͺ*add the   long prime   to the $ list.*/
end   /*ͺ*j*/
say
if neg  then do;  say 'number of long primes βξεχΦ± '    H     " is: "     words(newV1);    end
else do;  say   'list of long primes βξεχΦ± '    H":";         say strip(newV1);    end
end      /*ͺ*k*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.len: procedure; parse arg x;  r=1;   do x;                   r= 10*r // x;     end  /*ͺ*x*/
rr=r;   do p=1  until r==rr;    r= 10*r // x;     end  /*ͺ*p*/
return p
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Long-primes\long-primes-1.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
