/*�*REXX pgm calculates/displays base ten  long primes  (AKA golden primes, proper primes,*/
/*�*───────────────────── maximal period primes, long period primes, full reptend primes).*/
parse arg a                                      /*�*obtain optional argument from the CL.*/
if a='' | a=","  then a= '500 -500 -1000 -2000 -4000 -8000 -16000' ,  /*�*Not specified?  */
'-32000 -64000 -128000 -512000 -1024000'     /*�*Then use default*/
do k=1  for words(a);     H=word(a, k)       /*�*step through the list of high limits.*/
neg= H<1                                     /*�*used as an indicator to display count*/
H= abs(H)                                    /*�*obtain the absolute value of  H.     */
newV1=                                           /*�*the list of  long primes   (so far). */
do j=7  to H  by 2;  parse var j '' -1 newV2  /*�*start with 7,  just use odd integers.*/
if     newV2==5  then iterate /*�*last digit a five?  Then not a prime.*/
if j// 3==0  then iterate /*�*Is divisible by  3?   "   "  "   "   */
if j\==11  then if j//11==0  then iterate /*�* "     "      " 11?   "   "  "   "   */
if j\==13  then if j//13==0  then iterate /*�* "     "      " 13?   "   "  "   "   */
if j\==17  then if j//17==0  then iterate /*�* "     "      " 17?   "   "  "   "   */
if j\==19  then if j//19==0  then iterate /*�* "     "      " 19?   "   "  "   "   */
if .len(j) + 1 \== j  then iterate        /*�*Period length wrong?   Then skip it. */
newV1=newV1 j                                     /*�*add the   long prime   to the $ list.*/
end   /*�*j*/
say
if neg  then do;  say 'number of long primes ����ֱ '    H     " is: "     words(newV1);    end
else do;  say   'list of long primes ����ֱ '    H":";         say strip(newV1);    end
end      /*�*k*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.len: procedure; parse arg x;  r=1;   do x;                   r= 10*r // x;     end  /*�*x*/
rr=r;   do p=1  until r==rr;    r= 10*r // x;     end  /*�*p*/
return p
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Long-primes\long-primes-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
