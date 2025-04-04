/*ช*REXX program determines if any integer  (or a range of integers)  is/are  semiprime.  */
parse arg bot top .                              /*ช*obtain optional arguments from the CL*/
if bot=='' | bot==","  then bot=random()         /*ช*None given?   User wants us to guess.*/
if top=='' | top==","  then top=bot              /*ช*maybe define a range of numbers.     */
tell=  top=>0 |  top==bot                        /*ช*should results be shown to the term? */
w=max(length(bot), length(top)) + 5              /*ช*obtain the maximum width of numbers. */
numeric digits max(9, w)                         /*ช*ensure there're enough decimal digits*/
newV1=0                                              /*ช*initialize number of semiprimes found*/
do n=bot  to abs(top)               /*ช*show results for a range of numbers. */
newV2=isSemiPrime(n);      newV1=newV1+newV2        /*ช*Is N a semiprime?; Maybe bump counter*/
if tell  then say right(n,w)  right(word("isn't" 'is', newV2+1), 6)  'semiprime.'
end   /*ช*n*/
say
if bot\==top  then say 'found '   newV1   " semiprimes."
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isPrime: procedure;  parse arg x;               if x<2  then return 0  /*ช*number too low?*/
if wordpos(x, '2 3 5 7 11 13 17 19 23')\==0    then return 1  /*ช*it's low prime.*/
if x//2==0  then return 0;     if x//3==0      then return 0  /*ช*รท by 2; รท by 3?*/
do j=5  by 6  until j*j>x;   if x//j==0      then return 0  /*ช*not a prime.   */
if x//(j+2)==0  then return 0  /*ช* "  "   "      */
end   /*ช*j*/
return 1                                /*ช*indicate that  X  is a prime number. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isSemiPrime: procedure;  parse arg x;          if x<4  then return 0

do i=2  for 2;  if x//i==0  then if isPrime(x%i)  then return 1
else return 0
end   /*ช*i*/
/*ช*    ___  */
do   j=5  by 6;         if j*j>x    then  return 0            /*ช* > โ x  ?*/
do k=j  by 2  for 2;  if x//k==0  then  if isPrime(x%k)  then return 1
else return 0
end   /*ช*k*/                     /*ช* [โ]  see if 2nd factor is prime or ยฌ*/
end     /*ช*j*/                     /*ช* [โ]  J is never a multiple of three.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Semiprime\semiprime-2.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
