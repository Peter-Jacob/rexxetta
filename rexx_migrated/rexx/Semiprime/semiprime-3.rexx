/*ช*REXX program determines if any integer  (or a range of integers)  is/are  semiprime.  */
parse arg bot top .                              /*ช*obtain optional arguments from the CL*/
if bot=='' | bot==","  then bot=random()         /*ช*None given?   User wants us to guess.*/
if top=='' | top==","  then top=bot              /*ช*maybe define a range of numbers.     */
tell= bot=>0  &  top=>0                          /*ช*should results be shown to the term? */
w=max(length(bot), length(top))                  /*ช*obtain the maximum width of numbers. */
newV1.=;  newV1.2=1; newV1.3=1; newV1.5=1; newV1.7=1; newV1.11=1; newV1.13=1; newV1.17=1; newV1.19=1; newV1.23=1; newV1.29=1;  newV1.31=1
numeric digits max(9, w)                         /*ช*ensure there're enough decimal digits*/
newV2=0                                              /*ช*initialize number of semiprimes found*/
do n=abs(bot)  to abs(top)          /*ช*show results for a range of numbers. */
newV3=isSemiPrime(n);      newV2=newV2+newV3        /*ช*Is N a semiprime?; Maybe bump counter*/
if tell  then say right(n,w)  right(word("isn't" 'is', newV3+1), 6)  'semiprime.'
end   /*ช*n*/
say
if bot\==top  then say 'found '   newV2   " semiprimes."
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isPrime: procedure expose newV1.;  parse arg x;     if x<2  then return 0  /*ช*number too low?*/
if newV1.x==1                                      then return 1  /*ช*a known prime. */
if x// 2==0  then return 0;    if x//3==0      then return 0  /*ช*รท by  2;รทby  3?*/
parse var x '' -1 newV4;           if newV4==5         then return 0  /*ช*last digit a 5?*/
if x// 7==0  then return 0;    if x//11==0     then return 0  /*ช*รท by  7;รทby 11?*/
if x//13==0  then return 0;    if x//17==0     then return 0  /*ช*รท by 13;รทby 17?*/
if x//19==0  then return 0;    if x//23==0     then return 0  /*ช*รท by 19;รทby 23?*/
do j=29  by 6  until j*j>x;  if x//j==0      then return 0  /*ช*not a prime.   */
if x//(j+2)==0  then return 0  /*ช* "  "   "      */
end   /*ช*j*/
newV1.x=1;                return 1          /*ช*indicate that  X  is a prime number. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isSemiPrime: procedure expose newV1.;  parse arg x;          if x<4  then return 0

do i=2  for 2;  if x//i==0  then if isPrime(x%i)  then return 1
else return 0
end   /*ช*i*/
/*ช*    ___  */
do   j=5  by 6  until j*j>x                                   /*ช* > โ x  ?*/
do k=j  by 2  for 2;  if x//k==0  then  if isPrime(x%k)  then return 1
else return 0
end   /*ช*k*/                     /*ช* [โ]  see if 2nd factor is prime or ยฌ*/
end     /*ช*j*/                     /*ช* [โ]  J is never a multiple of three.*/
return 0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Semiprime\semiprime-3.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
