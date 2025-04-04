/*ͺ*REXX pgm uses the LucasβLehmer primality test for prime powers of 2  (Mersenne primes)*/
newV1.=0; newV1.2=1; newV1.3=1; newV1.5=1; newV1.7=1; newV1.11=1; newV1.13=1 /*ͺ*a partial list of some low primes.   */
newV2.=newV1.;  newV2.0=1; newV2.2=1; newV2.4=1; newV2.5=1; newV2.6=1; newV2.8=1 /*ͺ*#'s with these last digs aren't prime*/
parse arg limit .                                /*ͺ*obtain optional arguments from the CL*/
if limit==''  then limit= 200                    /*ͺ*Not specified?  Then use the default.*/
say center('Mersenne prime index list',70-3,"β") /*ͺ*show a fancyβdancy header (or title).*/
say  right('M'2, 25)      " [1 decimal digit]"   /*ͺ*leftβjustify them to align&look nice.*/
/*ͺ* [βΊ] note that J==1 is a special case*/
do j=1  by 2  to limit                  /*ͺ*there're only so many hours in a day.*/
power= j + (j==1)                       /*ͺ*POWER β‘ J    except   for when  J=1. */
if \isPrime(power)  then iterate        /*ͺ*if POWER isn't prime, then ignore it.*/
newV3= LL2(power)                           /*ͺ*perform the LucasβLehmer 2 (LL2) test*/
if newV3==''            then iterate        /*ͺ*Did it flunk LL2?   Then skip this #.*/
say  right(newV3, 25)   MPsize              /*ͺ*leftβjustify them to align&look nice.*/
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isPrime: procedure expose newV2. newV1.                  /*ͺ*allow 2 stemmed arrays to be accessed*/
parse arg  x    ''  -1  z               /*ͺ*obtain variable   X   and last digit.*/
if newV1.x      then return 1               /*ͺ*is  X  already found to be a prime?  */
if newV2.z      then return 0               /*ͺ*is last decimal digit even or a five?*/
if x//3==0  then return 0               /*ͺ*divisible by three?  Then not a prime*/
if x//7==0  then return 0               /*ͺ*divisible by seven?    "   "  "   "  */
do j=11  by 6   until j*j > x    /*ͺ*ensures that J isn't divisible by 3. */
if x //  j   ==0  then return 0  /*ͺ*Is X divisible by  J   ?             */
if x // (j+2)==0  then return 0  /*ͺ* " "     "      "  J+2 ?         ___ */
end   /*ͺ*j*/                      /*ͺ* [β]  perform  DO  loop through β x  */
newV1.x=1;                         return 1 /*ͺ*indicate number  X  is a prime.      */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
LL2: procedure expose MPsize;    parse arg newV4     /*ͺ*LucasβLehmer test on    2**?  -  1   */
if newV4==2  then s=0                           /*ͺ*handle special case for an even prime*/
else s=4                           /*ͺ* [β]  same as NUMERIC FORM SCIENTIFIC*/
numeric form;               q= 2**newV4         /*ͺ*ensure correct form for REXX numbers.*/
/*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
βββ Compute a power of 2 using only 9 decimal digits.  One million digits     β
β could be used, but that really slows up computations.  So, we start with theβ
β default of 9 digits, and then find the ten's exponent in the product (2**?),β
β double it,  and then add 6.    {2  is all that's needed,  but  6  is a lot  β
β safer.}   The doubling is for the squaring of   S    (below, for  s*s).   βββ
βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
if pos('E', q)\==0  then do                 /*ͺ*is number in exponential notation ?  */
parse var q 'E' tenPow            /*ͺ*get the exponent. */
numeric digits  tenPow * 2 + 6    /*ͺ*expand precision. */
end                                   /*ͺ*REXX used dec FP. */
else numeric digits    digits() * 2 + 6    /*ͺ*use 9*2 + 6 digits*/
q=2**newV4 - 1                                  /*ͺ*compute a power of two,  minus one.  */
r= q // 8                                /*ͺ*obtain   Q   modulus  eight.         */
if r==1 | r==7  then nop                    /*ͺ*before crunching, do a simple test.  */
else return ''              /*ͺ*modulus   Q   isn't one  or  seven.  */
do newV4-2;       s= (s*s -2) // q  /*ͺ*lather,  rinse,  repeat   Β·Β·Β·        */
end                             /*ͺ* [β]   compute and test for a  MP.   */
if s\==0  then return ''                    /*ͺ*Not a Mersenne prime?  Return a null.*/
sz= length(q)                               /*ͺ*obtain number of decimal digs in MP. */
MPsize=' ['sz      "decimal digit"s(sz)']'  /*ͺ*define a literal to display after MP.*/
return 'M'newV4                  /*ͺ*return "modified" # (Mersenne index).*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
s:   if arg(1)==1  then return arg(3);  return word(arg(2) 's', 1)   /*ͺ*simple pluralizer*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Lucas-Lehmer-test\lucas-lehmer-test.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
