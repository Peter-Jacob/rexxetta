/*ͺ*REXX program calculates and displays primes using an extendible prime number generator*/
parse arg f .;    if f==''  then f= 20           /*ͺ*allow specifying number for  1 βββΊ F.*/
newV3= ' (inclusive) ';  newV4= 'between ';  newV1= 'the number of primes' newV4;  newV2= 'the primes'
call primes f;      do j=1  for f;      newV7= newV7 newV5.j;    end  /*ͺ*j*/
say 'the first '    f    " primes are: "        newV7
say
call primes -150;   do j=100  to 150;   if newV6.j==1  then newV7= newV7 j;  end  /*ͺ*j*/
say newV2  newV4  '100  to  150'  newV3  "are: "        newV7
say
call primes -8000;  do j=7700  to 8000; if newV6.j==1  then newV7= newV7 j;  end  /*ͺ*j*/
say newV1  '7,700  and  8,000'  newV3  "is: " words(newV7)
say
call primes 10000
say 'the 10,000th prime is: '    newV5.10000
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
primes: procedure expose newV6. newV5. newV7 newV9;      parse arg H,,newV7;           Hneg= H<0;    H= abs(H)
if symbol('#')=="LIT"  then call .primI  /*ͺ*1st time here?  Then initialize stuff*/
if Hneg  then  if  H<=newV5.newV9  then return   /*ͺ*do we have a high enough  P  already?*/
else nop      /*ͺ*this is used to match the above THEN.*/
else  if  H<=newV9    then return   /*ͺ*are there enough primes currently ?  */
/*ͺ* [β]  gen more primes within range.  */
do j=newV5.newV9+2   by 2; parse var j '' -1 newV8 /*ͺ*find primes until have   H   Primes. */
if     newV8==5  then iterate              /*ͺ*is the rightβmost digit a 5  (five)? */
if j// 3==0  then iterate              /*ͺ*is  J  divisible by  three?  (& etc.)*/
if j// 7==0  then iterate;  if j//11==0  then iterate; if j//13==0  then iterate
if j//17==0  then iterate;  if j//19==0  then iterate; if j//23==0  then iterate
if j//29==0  then iterate;  if j//31==0  then iterate; if j//37==0  then iterate
if j//41==0  then iterate;  if j//43==0  then iterate; if j//47==0  then iterate
if j//53==0  then iterate;  if j//59==0  then iterate; if j//61==0  then iterate
if j//67==0  then iterate;  if j//71==0  then iterate; if j//73==0  then iterate
if j//79==0  then iterate;  if j//83==0  then iterate; if j//89==0  then iterate
if j//97==0  then iterate;  if j//101==0 then iterate; if j//103==0 then iterate
x= j;          r= 0;  q= 1;   do while q<=x;  q= q*4;  end  /*ͺ*R:  the sqrt(J).*/
do while q>1; q=q%4; newV8=x-r-q; r=r%2; if newV8>=0 then do;x=newV8;r=r+q; end; end
do k=newV5.lowP   while newV5.k<=r   /*ͺ*Γ· by the known odd primes (hardcoded)*/
if j//newV5.k==0  then iterate j /*ͺ*J Γ· by a prime?  Then not prime.  ___*/
end   /*ͺ*k*/                  /*ͺ* [β]  divide by odd primes up to β J */
newV9= newV9 + 1                               /*ͺ*bump the number of primes found.     */
newV5.newV9= j;                       newV6.j= 1   /*ͺ*assign to sparse array;  primeΒ²;  P#.*/
if Hneg  then if H<=newV5.newV9  then leave    /*ͺ*is this a high enough prime?         */
else nop      /*ͺ*used to match the above  THEN.       */
else if H<=newV9    then leave    /*ͺ*have enough primes been generated?   */
end   /*ͺ*j*/                            /*ͺ* [β]  keep generating until enough.  */
return                                   /*ͺ*return to invoker with more primes.  */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.primI: newV6.=0;   newV5.=0;                            /*ͺ*!.x= a prime or not;  @.n= Nth prime.*/
L= 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103
do newV9=1  for words(L);   p= word(L, newV9);   newV5.newV9= p;   newV6.p=1;    end   /*ͺ*#*/
newV9= newV9 - 1;       newV5.lowP= newV9;      return   /*ͺ*#:   # primes;  @.lowP:   start of Γ· */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Extensible-prime-generator\extensible-prime-generator.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
