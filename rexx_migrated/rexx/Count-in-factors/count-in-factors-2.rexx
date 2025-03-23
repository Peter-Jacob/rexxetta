/*ª*REXX program lists the prime factors of a specified integer  (or a range of integers).*/
newV1.=left('', 8);  newV1.0="{unity} ";  newV1.1='[prime] ' /*ª*some tags  and  handy-dandy literals.*/
parse arg LO HI newV2 .                              /*ª*get optional arguments from the C.L. */
if LO=='' | LO==","  then do; LO=1; HI=40;  end  /*ª*Not specified?  Then use the default.*/
if HI=='' | HI==","  then HI= LO                 /*ª* "      "         "   "   "     "    */
if  newV2==''            then  newV2= 'x'                /*ª* "      "         "   "   "     "    */
if length(newV2)\==1  then newV2= x2c(newV2)                 /*ª*Not length 1?  Then use hexadecimal. */
tell= (HI>0)                                     /*ª*if  HIGH  is positive, then show #'s.*/
HI= abs(HI)                                      /*ª*use the absolute value for  HIGH.    */
w= length(HI)                                    /*ª*get maximum width for pretty output. */
numeric digits max(9, w + 1)                     /*ª*maybe bump the precision of numbers. */
newV3= 0                                             /*ª*the number of primes found (so far). */
do n=abs(LO)  to HI;          f= factr(n)   /*ª*process a single number  or  a range.*/
p= words( translate(f, ,newV2) )  -  (n==1)     /*ª*P:  is the number of prime factors.  */
if p==1  then newV3= newV3 + 1                      /*ª*bump the primes counter (exclude N=1)*/
if tell  then say right(n, w)  '='  newV1.p  f  /*ª*display if a prime, plus its factors.*/
end   /*ª*n*/
say
say right(newV3, w)          ' primes found.'        /*ª*display the number of primes found.  */
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€*/
factr: procedure expose newV2; parse arg z 1 n,newV4;  if z<2  then return z   /*ª*is Z too small?*/
do  while z// 2==0;  newV4= newV4||newV2||2 ;   z= z%2 ;   end /*ª*maybe add factor of   2 */
do  while z// 3==0;  newV4= newV4||newV2||3 ;   z= z%3 ;   end /*ª*  "    "     "    "   3 */
do  while z// 5==0;  newV4= newV4||newV2||5 ;   z= z%5 ;   end /*ª*  "    "     "    "   5 */
do  while z// 7==0;  newV4= newV4||newV2||7 ;   z= z%7 ;   end /*ª*  "    "     "    "   7 */
do  while z//11==0;  newV4= newV4||newV2||11;   z= z%11;   end /*ª*  "    "     "    "  11 */
do  while z//13==0;  newV4= newV4||newV2||13;   z= z%13;   end /*ª*  "    "     "    "  13 */
do  while z//17==0;  newV4= newV4||newV2||17;   z= z%17;   end /*ª*  "    "     "    "  17 */
do  while z//19==0;  newV4= newV4||newV2||19;   z= z%19;   end /*ª*  "    "     "    "  19 */
do  while z//23==0;  newV4= newV4||newV2||23;   z= z%23;   end /*ª*  "    "     "    "  23 */
do  while z//29==0;  newV4= newV4||newV2||29;   z= z%29;   end /*ª*  "    "     "    "  29 */
do  while z//31==0;  newV4= newV4||newV2||31;   z= z%31;   end /*ª*  "    "     "    "  31 */
do  while z//37==0;  newV4= newV4||newV2||37;   z= z%37;   end /*ª*  "    "     "    "  37 */
if z>40 then do;    t= z;    q= 1;    r= 0;              do while q<=t;    q= q * 4
end   /*ª*while*/
do while q>1; q=q%4;  newV5=t-r-q;  r=r%2; if newV5>=0  then do;  t=newV5; r=r+q
end
end   /*ª*while*/                    /*ª* [â†‘]  find integer SQRT(z).  */
/*ª*R:  is the integer SQRT of Z.*/
do j=41  by 6  to  r  while j<=z   /*ª*insure J isn't divisible by 3*/
parse var j  ''  -1  newV5             /*ª*get last decimal digit of  J.*/
if newV5\==5  then do  while z//j==0;      newV4=newV4||newV2||j;     z= z%j;    end
if newV5 ==3  then iterate             /*ª*Next number  Ã·  by 5 ?  Skip.*/
y= j + 2                           /*ª*use the next (odd) divisor.  */
do  while z//y==0;      newV4=newV4||newV2||y;     z= z%y;    end
end   /*ª*j*/                        /*ª* [â†‘]  reduce  Z  by  Y ?     */
end     /*ª*if z>40*/

if z==1  then return substr(newV4,       1+length(newV2) )  /*ª*Is residual=1?  Don't add 1*/
return substr(newV4||newV2||z, 1+length(newV2) )  /*ª*elide superfluous header.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Count-in-factors\count-in-factors-2.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
