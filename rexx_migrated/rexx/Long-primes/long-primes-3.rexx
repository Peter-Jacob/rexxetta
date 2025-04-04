/*ͺ*REXX pgm calculates/displays base ten  long primes  (AKA golden primes, proper primes,*/
/*ͺ*βββββββββββββββββββββ maximal period primes, long period primes, full reptend primes).*/
parse arg a                                      /*ͺ*obtain optional argument from the CL.*/
if a='' | a=","  then a= '500 -500 -1000 -2000 -4000 -8000 -16000' ,  /*ͺ*Not specified?  */
'-32000 -64000 -128000 -512000 -1024000'     /*ͺ*Then use default*/
m=0;            aa= words(a)                     /*ͺ* [β]  two list types of low primes.  */
do j=1  for aa;   m= max(m, abs(word(a, j))) /*ͺ*find the maximum argument in the list*/
end   /*ͺ*j*/
call genP                                        /*ͺ*go and generate some primes.         */
do k=1  for aa;           H= word(a, k)      /*ͺ*step through the list of high limits.*/
neg= H<1                                     /*ͺ*used as an indicator to display count*/
H= abs(H)                                    /*ͺ*obtain the absolute value of  H.     */
newV3=                                           /*ͺ*the list of  long primes   (so far). */
do j=7  to H  by 2
if \newV1.j               then iterate        /*ͺ*Is  J  not a prime?    Then skip it. */
if .len(j) + 1 \== j  then iterate        /*ͺ*Period length wrong?     "    "   "  */
newV3= newV3 j                                    /*ͺ*add the   long prime   to the $ list.*/
end   /*ͺ*j*/                               /*ͺ* [β]  some pretty weak prime testing.*/
say
if neg  then      say 'number of long primes βξεχΦ³ '    H     " is: "     words(newV3)
else do;  say   'list of long primes βξεχΦ³ '    H":";         say strip(newV3);    end
end      /*ͺ*k*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV1.=0; newV1.2=1; newV1.3=1; newV1.5=1; newV1.7=1; newV1.11=1;   newV2.=0; newV2.1=2; newV2.2=3; newV2.3=5; newV2.4=7; newV2.5=11
newV4= 5                                       /*ͺ*the number of primes  (so far).      */
do g=newV2.newV4+2  by 2  until g>=m           /*ͺ*gen enough primes to satisfy max  A. */
if newV1.g\==0  then iterate               /*ͺ*Is it not a prime?     Then skip it. */
do d=2  until newV2.d**2>g          /*ͺ*only divide up to square root of  X. */
if g//newV2.d==0  then iterate g    /*ͺ*Divisible?   Then skip this integer. */
end   /*ͺ*d*/                     /*ͺ* [β]  a spanking new prime was found.*/
newV4= newV4+1               newV1.g= 1;  newV2.newV4= g   /*ͺ*bump P counter; assign P, add to P's.*/
end            /*ͺ*g*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.len: procedure; parse arg x;  r=1;   do x;                   r= 10*r // x;     end  /*ͺ*x*/
rr=r;   do p=1  until r==rr;    r= 10*r // x;     end  /*ͺ*p*/
return p
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Long-primes\long-primes-3.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
