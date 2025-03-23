/*�*REXX pgm calculates/displays base ten  long primes  (AKA golden primes, proper primes,*/
/*�*───────────────────── maximal period primes, long period primes, full reptend primes).*/
parse arg a                                      /*�*obtain optional argument from the CL.*/
if a='' | a=","  then a= '500 -500 -1000 -2000 -4000 -8000 -16000' ,  /*�*Not specified?  */
'-32000 -64000 -128000 -512000 -1024000'     /*�*Then use default*/
m=0;            aa= words(a)                     /*�* [↑]  two list types of low primes.  */
do j=1  for aa;   m= max(m, abs(word(a, j))) /*�*find the maximum argument in the list*/
end   /*�*j*/
call genP                                        /*�*go and generate some primes.         */
do k=1  for aa;           H= word(a, k)      /*�*step through the list of high limits.*/
neg= H<1                                     /*�*used as an indicator to display count*/
H= abs(H)                                    /*�*obtain the absolute value of  H.     */
newV3=                                           /*�*the list of  long primes   (so far). */
do j=7  to H  by 2
if \newV1.j               then iterate        /*�*Is  J  not a prime?    Then skip it. */
if .len(j) + 1 \== j  then iterate        /*�*Period length wrong?     "    "   "  */
newV3= newV3 j                                    /*�*add the   long prime   to the $ list.*/
end   /*�*j*/                               /*�* [↑]  some pretty weak prime testing.*/
say
if neg  then      say 'number of long primes ����ֳ '    H     " is: "     words(newV3)
else do;  say   'list of long primes ����ֳ '    H":";         say strip(newV3);    end
end      /*�*k*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: newV1.=0; newV1.2=1; newV1.3=1; newV1.5=1; newV1.7=1; newV1.11=1;   newV2.=0; newV2.1=2; newV2.2=3; newV2.3=5; newV2.4=7; newV2.5=11
newV4= 5                                       /*�*the number of primes  (so far).      */
do g=newV2.newV4+2  by 2  until g>=m           /*�*gen enough primes to satisfy max  A. */
if newV1.g\==0  then iterate               /*�*Is it not a prime?     Then skip it. */
do d=2  until newV2.d**2>g          /*�*only divide up to square root of  X. */
if g//newV2.d==0  then iterate g    /*�*Divisible?   Then skip this integer. */
end   /*�*d*/                     /*�* [↓]  a spanking new prime was found.*/
newV4= newV4+1               newV1.g= 1;  newV2.newV4= g   /*�*bump P counter; assign P, add to P's.*/
end            /*�*g*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.len: procedure; parse arg x;  r=1;   do x;                   r= 10*r // x;     end  /*�*x*/
rr=r;   do p=1  until r==rr;    r= 10*r // x;     end  /*�*p*/
return p
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Long-primes\long-primes-3.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
