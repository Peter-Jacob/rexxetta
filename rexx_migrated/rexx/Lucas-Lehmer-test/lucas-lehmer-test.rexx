/*�*REXX pgm uses the Lucas─Lehmer primality test for prime powers of 2  (Mersenne primes)*/
newV1.=0; newV1.2=1; newV1.3=1; newV1.5=1; newV1.7=1; newV1.11=1; newV1.13=1 /*�*a partial list of some low primes.   */
newV2.=newV1.;  newV2.0=1; newV2.2=1; newV2.4=1; newV2.5=1; newV2.6=1; newV2.8=1 /*�*#'s with these last digs aren't prime*/
parse arg limit .                                /*�*obtain optional arguments from the CL*/
if limit==''  then limit= 200                    /*�*Not specified?  Then use the default.*/
say center('Mersenne prime index list',70-3,"═") /*�*show a fancy─dancy header (or title).*/
say  right('M'2, 25)      " [1 decimal digit]"   /*�*left─justify them to align&look nice.*/
/*�* [►] note that J==1 is a special case*/
do j=1  by 2  to limit                  /*�*there're only so many hours in a day.*/
power= j + (j==1)                       /*�*POWER ≡ J    except   for when  J=1. */
if \isPrime(power)  then iterate        /*�*if POWER isn't prime, then ignore it.*/
newV3= LL2(power)                           /*�*perform the Lucas─Lehmer 2 (LL2) test*/
if newV3==''            then iterate        /*�*Did it flunk LL2?   Then skip this #.*/
say  right(newV3, 25)   MPsize              /*�*left─justify them to align&look nice.*/
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isPrime: procedure expose newV2. newV1.                  /*�*allow 2 stemmed arrays to be accessed*/
parse arg  x    ''  -1  z               /*�*obtain variable   X   and last digit.*/
if newV1.x      then return 1               /*�*is  X  already found to be a prime?  */
if newV2.z      then return 0               /*�*is last decimal digit even or a five?*/
if x//3==0  then return 0               /*�*divisible by three?  Then not a prime*/
if x//7==0  then return 0               /*�*divisible by seven?    "   "  "   "  */
do j=11  by 6   until j*j > x    /*�*ensures that J isn't divisible by 3. */
if x //  j   ==0  then return 0  /*�*Is X divisible by  J   ?             */
if x // (j+2)==0  then return 0  /*�* " "     "      "  J+2 ?         ___ */
end   /*�*j*/                      /*�* [↑]  perform  DO  loop through √ x  */
newV1.x=1;                         return 1 /*�*indicate number  X  is a prime.      */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LL2: procedure expose MPsize;    parse arg newV4     /*�*Lucas─Lehmer test on    2**?  -  1   */
if newV4==2  then s=0                           /*�*handle special case for an even prime*/
else s=4                           /*�* [↓]  same as NUMERIC FORM SCIENTIFIC*/
numeric form;               q= 2**newV4         /*�*ensure correct form for REXX numbers.*/
/*�*╔═══════════════════════════════════════════════════════════════════════════╗
╔═╝ Compute a power of 2 using only 9 decimal digits.  One million digits     ║
║ could be used, but that really slows up computations.  So, we start with the║
║ default of 9 digits, and then find the ten's exponent in the product (2**?),║
║ double it,  and then add 6.    {2  is all that's needed,  but  6  is a lot  ║
║ safer.}   The doubling is for the squaring of   S    (below, for  s*s).   ╔═╝
╚═══════════════════════════════════════════════════════════════════════════╝*/
if pos('E', q)\==0  then do                 /*�*is number in exponential notation ?  */
parse var q 'E' tenPow            /*�*get the exponent. */
numeric digits  tenPow * 2 + 6    /*�*expand precision. */
end                                   /*�*REXX used dec FP. */
else numeric digits    digits() * 2 + 6    /*�*use 9*2 + 6 digits*/
q=2**newV4 - 1                                  /*�*compute a power of two,  minus one.  */
r= q // 8                                /*�*obtain   Q   modulus  eight.         */
if r==1 | r==7  then nop                    /*�*before crunching, do a simple test.  */
else return ''              /*�*modulus   Q   isn't one  or  seven.  */
do newV4-2;       s= (s*s -2) // q  /*�*lather,  rinse,  repeat   ···        */
end                             /*�* [↑]   compute and test for a  MP.   */
if s\==0  then return ''                    /*�*Not a Mersenne prime?  Return a null.*/
sz= length(q)                               /*�*obtain number of decimal digs in MP. */
MPsize=' ['sz      "decimal digit"s(sz)']'  /*�*define a literal to display after MP.*/
return 'M'newV4                  /*�*return "modified" # (Mersenne index).*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:   if arg(1)==1  then return arg(3);  return word(arg(2) 's', 1)   /*�*simple pluralizer*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Lucas-Lehmer-test\lucas-lehmer-test.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
