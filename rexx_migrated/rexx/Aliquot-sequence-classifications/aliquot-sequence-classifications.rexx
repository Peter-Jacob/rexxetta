/*ͺ*REXX program classifies various  positive integers  for  types of  aliquot sequences. */
parse arg low high newV1                            /*ͺ*obtain optional arguments from the CL*/
high= word(high low 10,1);   low= word(low 1,1)  /*ͺ*obtain the  LOW  and  HIGH  (range). */
if newV1=''  then newV1=11 12 28 496 220 1184 12496 1264460 790 909 562 1064 1488 15355717786080
numeric digits 100                               /*ͺ*be able to compute the number:  BIG  */
big= 2**47;                  NTlimit= 16 + 1     /*ͺ*limits for a nonβterminating sequence*/
numeric digits max(9, length(big) )              /*ͺ*be able to handle big numbers for // */
digs= digits()                                   /*ͺ*used for align numbers for the output*/
newV2.= .;        newV2.0= 0;        newV2.1= 0              /*ͺ*#.   are the proper divisor sums.    */
say center('numbers from '      low      " ββββΊ "      high      ' (inclusive)', 153, "β")
do n=low  to high;    call classify  n /*ͺ*call a subroutine to classify number.*/
end   /*ͺ*n*/                            /*ͺ* [β]   process a range of integers.  */
say
say center('first numbers for each classification', 153, "β")
class.= 0                                        /*ͺ* [β]  ensure one number of each class*/
do q=1  until class.sociable\==0       /*ͺ*the only one that has to be counted. */
call classify  -q                      /*ͺ*minus (-) sign indicates don't tell. */
newV3= what;  upper newV3                      /*ͺ*obtain the class and uppercase it.   */
class.newV3= class.newV3 + 1                   /*ͺ*bump counter for this class sequence.*/
if class.newV3==1  then say right(q, digs)':'      center(what, digs)      newV4
end   /*ͺ*q*/                            /*ͺ* [β]  only display the 1st occurrence*/
say                                              /*ͺ* [β]  process until all classes found*/
say center('classifications for specific numbers', 153, "β")
do i=1  for words(newV1)                  /*ͺ*$L:  is a list of  "special numbers".*/
call classify   word(newV1, i)            /*ͺ*call a subroutine to classify number.*/
end   /*ͺ*i*/                            /*ͺ* [β]  process a list of integers.    */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
classify: parse arg a 1 aa;         a= abs(a)    /*ͺ*obtain number that's to be classified*/
if newV2.a\==.    then s= newV2.a                 /*ͺ*Was this number been  summed  before?*/
else s= sigma(a)            /*ͺ*No, then classify number the hard way*/
newV2.a= s                                    /*ͺ*define sum of the  proper divisors.  */
newV4= s                                      /*ͺ*define the start of integer sequence.*/
what= 'terminating'         /*ͺ*assume this kind of classification.  */
c.=  0                                    /*ͺ*clear all cyclic sequences (to zero).*/
c.s= 1                                    /*ͺ*set the first cyclic sequence.       */
if newV4==a  then what= 'perfect'             /*ͺ*check for a  "perfect"  number.      */
else do t=1  while s>0           /*ͺ*loop until sum isn't  0   or   > big.*/
m= s                        /*ͺ*obtain the last number in sequence.  */
if newV2.m==.  then s= sigma(m) /*ͺ*Not defined? Then sum proper divisors*/
else s= newV2.m      /*ͺ*use the previously found integer.    */
if m==s  then if m>=0   then do;  what= 'aspiring';  leave;   end
parse var  newV4   .  word2  .  /*ͺ*obtain the 2nd  number in sequence.  */
if word2==a             then do;  what= 'amicable';  leave;   end
newV4= newV4 s                      /*ͺ*append a sum to the integer sequence.*/
if s==a  then if t>3    then do;  what= 'sociable';  leave;   end
if c.s   then if m>0    then do;  what= 'cyclic'  ;  leave;   end
c.s= 1                      /*ͺ*assign another possible cyclic number*/
/*ͺ* [β]  Rosetta Code task's limit: >16 */
if t>NTlimit     then do;  what= 'nonβterminating';  leave;   end
if s>big         then do;  what= 'NONβTERMINATING';  leave;   end
end   /*ͺ*t*/                 /*ͺ* [β]  only permit within reason.     */
if aa>0  then say right(a, digs)':'     center(what, digs)     newV4
return                                    /*ͺ* [β] only display if  AA  is positive*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sigma: procedure expose newV2. !.;  parse arg x;   if 11<2  then return 0;        odd= x // 2
s= 1                                      /*ͺ* [β]  use EVEN or ODD integers.   ___*/
do j=2+odd  by 1+odd  while j*j<x    /*ͺ*divide by all the integers up to β X */
if x//j==0  then  s= s + j +   x % j /*ͺ*add the two divisors to the sum.     */
end   /*ͺ*j*/                          /*ͺ* [β]  adjust for square.          ___*/
if j*j==x  then  s= s + j                 /*ͺ*Was  X  a square?    If so, add  β X */
newV2.x= s                                    /*ͺ*memoize division sum for argument  X.*/
return s                                  /*ͺ*return      "     "   "      "     " */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Aliquot-sequence-classifications\aliquot-sequence-classifications.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
