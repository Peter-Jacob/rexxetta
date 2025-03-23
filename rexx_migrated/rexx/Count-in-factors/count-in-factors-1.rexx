/*�*REXX program lists the prime factors of a specified integer  (or a range of integers).*/
newV1.=left('', 8);  newV1.0="{unity} ";  newV1.1='[prime] ' /*�*some tags  and  handy-dandy literals.*/
parse arg LO HI newV2 .                              /*�*get optional arguments from the C.L. */
if LO=='' | LO==","  then do; LO=1; HI=40;  end  /*�*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI= LO                 /*�* "      "         "   "   "     "    */
if  newV2==''            then  newV2= 'x'                /*�* "      "         "   "   "     "    */
if length(newV2)\==1  then newV2= x2c(newV2)                 /*�*Not length 1?  Then use hexadecimal. */
tell= (HI>0)                                     /*�*if  HIGH  is positive, then show #'s.*/
HI= abs(HI)                                      /*�*use the absolute value for  HIGH.    */
w= length(HI)                                    /*�*get maximum width for pretty output. */
numeric digits max(9, w + 1)                     /*�*maybe bump the precision of numbers. */
newV3= 0                                             /*�*the number of primes found (so far). */
do n=abs(LO)  to HI;          f= factr(n)   /*�*process a single number  or  a range.*/
p= words( translate(f, ,newV2) )  -  (n==1)     /*�*P:  is the number of prime factors.  */
if p==1  then newV3= newV3 + 1                      /*�*bump the primes counter (exclude N=1)*/
if tell  then say right(n, w)  '='  newV1.p  f  /*�*display if a prime, plus its factors.*/
end   /*�*n*/
say
say right(newV3, w)          ' primes found.'        /*�*display the number of primes found.  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
factr: procedure expose newV2; parse arg z 1 n,newV4;  if z<2  then return z   /*�*is Z too small?*/
do  while z//2==0;   newV4= newV4||newV2||2;   z= z%2;    end  /*�*maybe add factor of   2 */
do  while z//3==0;   newV4= newV4||newV2||3;   z= z%3;    end  /*�*  "    "     "    "   3 */
do  while z//5==0;   newV4= newV4||newV2||5;   z= z%5;    end  /*�*  "    "     "    "   5 */
do  while z//7==0;   newV4= newV4||newV2||7;   z= z%7;    end  /*�*  "    "     "    "   7 */

do j=11  by 6  while j<=z               /*�*insure that  J  isn't divisible by 3.*/
parse var j  ''  -1  newV5                  /*�*get the last decimal digit of  J.    */
if newV5\==5  then do while  z//j==0;  newV4=newV4||newV2||j;  z= z%j;  end   /*�*maybe reduce Z.*/
if newV5 ==3  then iterate                  /*�*Next # ÷ by 5?  Skip.     ___        */
if j*j>n  then leave                    /*�*are we higher than the   √ N   ?     */
y= j + 2                                /*�*obtain the next odd divisor.         */
do while  z//y==0;  newV4=newV4||newV2||y;  z= z%y;   end  /*�*maybe reduce Z.*/
end   /*�*j*/
if z==1  then return substr(newV4,       1+length(newV2) )  /*�*Is residual=1?  Don't add 1*/
return substr(newV4||newV2||z, 1+length(newV2) )  /*�*elide superfluous header.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Count-in-factors\count-in-factors-1.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
