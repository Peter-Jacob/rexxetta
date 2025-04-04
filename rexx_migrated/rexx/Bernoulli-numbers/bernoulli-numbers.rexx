/*ͺ*REXX program calculates  N  number of Bernoulli numbers expressed as vulgar fractions.*/
parse arg N .;     if N=='' | N==","  then N= 60 /*ͺ*Not specified?  Then use the default.*/
numeric digits max(9, n*2)                       /*ͺ*increase the decimal digits if needed*/
w= max(length(N), 4);      Nw= N  + w  +  N % 4  /*ͺ*used for aligning (output) fractions.*/
say 'B(n)'   center("Bernoulli numbers expressed as vulgar fractions",  max(78-w, Nw) )
say copies('β',w)  copies("β", max(78-w,Nw+2*w)) /*ͺ*display 2nd line of title, separators*/
newV2.= .;    do newV4=0  to  N                          /*ͺ*process the numbers from  0  βββΊ  N. */
b= bern(newV4);      if b==0  then iterate /*ͺ*calculate Bernoulli number, skip if 0*/
indent= max(0, nW - pos('/', b) )      /*ͺ*calculate the alignment (indentation)*/
say right(newV4, w)  left('', indent)  b   /*ͺ*display the indented Bernoulli number*/
end   /*ͺ*#*/                            /*ͺ* [β]  align the Bernoulli fractions. */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
bern: parse arg x; if x==0  then return  '1/1'   /*ͺ*handle the special case of  zero.    */
if x==1  then return '-1/2'   /*ͺ*   "    "     "      "   "  one.     */
if x//2  then return   0      /*ͺ*   "    "     "      "   "  odds > 1.*/
do j=2  to x  by 2;      jp= j+1         /*ͺ*process the positive integers up to X*/
sn= 1 - j                                /*ͺ*define the  numerator.               */
sd= 2                                    /*ͺ*   "    "   denominator.             */
do k=2  to j-1  by 2          /*ͺ*calculate a  SN/SD  sequence.        */
parse var  newV3.k    bn  '/'  ad /*ͺ*get a previously calculated fraction.*/
an= comb(jp, k) * bn          /*ͺ*use  COMBination  for the next term. */
newV1= LCM(sd, ad)             /*ͺ*use Least Common Denominator function*/
sn= newV1 % sd * sn;  sd= newV1 /*ͺ*calculate the   current  numerator.  */
an= newV1 % ad * an            /*ͺ*    "      "      next      "        */
sn= sn + an                   /*ͺ*    "      "    current     "        */
end   /*ͺ*k*/                   /*ͺ* [β]  calculate the  SN/SD  sequence.*/
sn= -sn                                  /*ͺ*flip the sign for the numerator.     */
sd= sd * jp                              /*ͺ*calculate         the denominator.   */
if sn\==1  then do;  newV5= GCD(sn, sd)      /*ͺ*get the  Greatest Common Denominator.*/
sn= sn%newV5;   sd= sd%newV5 /*ͺ*reduce the numerator and denominator.*/
end                      /*ͺ* [β]   done with the reduction(s).   */
newV3.j= sn'/'sd                             /*ͺ*save the result for the next round.  */
end              /*ͺ*j*/                   /*ͺ* [β]  done calculating Bernoulli #'s.*/
return sn'/'sd
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
comb: procedure expose newV2.; parse arg x,y;   if x==y  then return 1
if newV2.C.x.y\==.  then return newV2.C.x.y                 /*ͺ*combination computed before?*/
if   x-y  <  y  then y= x-y                         /*ͺ*x-y < y?   Then use a new Y.*/
z= perm(x, y);           do j=2  for y-1;  z= z % j
end   /*ͺ*j*/
newV2.C.x.y= z;     return z                            /*ͺ*assign memoization & return.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
GCD:  procedure;               parse arg x,y;                     x= abs(x)
do  until y==0;     parse value  x//y  y    with    y  x;  end;        return x
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
LCM:  procedure; parse arg x,y      /*ͺ*X=ABS(X);  Y=ABS(Y)   not needed for Bernoulli #s.*/
/*ͺ*IF Y==0 THEN RETURN 0  "    "    "      "       " */
newV6= x * y                                        /*ͺ*calculate part of the LCM here. */
do  until y==0;   parse  value   x//y  y     with     y  x
end   /*ͺ*until*/                    /*ͺ* [β]  this is a short & fast GCD*/
return newV6 % x                                    /*ͺ*divide the preβcalculated value.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
perm: procedure expose newV2.;  parse arg x,y;          if newV2.P.x.y\==.  then return newV2.P.x.y
z= 1;       do j=x-y+1  to x;     z= z*j;     end;        newV2.P.x.y= z;       return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bernoulli-numbers\bernoulli-numbers.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
