/*�*REXX pgm does prime decomposition of a range of positive integers (with a prime count)*/
numeric digits 1000                              /*�*handle thousand digits for the powers*/
parse arg  bot  top  step   base  add            /*�*get optional arguments from the C.L. */
if  bot==''   then do;  bot=1;  top=100;  end    /*�*no  BOT given?  Then use the default.*/
if  top==''   then              top=bot          /*�* "  TOP?  "       "   "   "     "    */
if step==''   then step=  1                      /*�* " STEP?  "       "   "   "     "    */
if add ==''   then  add= -1                      /*�* "  ADD?  "       "   "   "     "    */
tell= top>0;       top=abs(top)                  /*�*if TOP is negative, suppress displays*/
w=length(top)                                    /*�*get maximum width for aligned display*/
if base\==''  then w=length(base**top)           /*�*will be testing powers of two later? */
newV1.=left('', 7);   newV1.0="{unity}";   newV1.1='[prime]' /*�*some literals:  pad;  prime (or not).*/
numeric digits max(9, w+1)                       /*�*maybe increase the digits precision. */
newV2=0                                              /*�*#:    is the number of primes found. */
do n=bot  to top  by step                /*�*process a single number  or  a range.*/
newV3=n;  if base\==''  then newV3=base**n + add /*�*should we perform a "Mercenne" test? */
pf=factr(newV3);      f=words(pf)            /*�*get prime factors; number of factors.*/
if f==1  then newV2=newV2+1                      /*�*Is N prime?  Then bump prime counter.*/
if tell  then say right(newV3,w)   right('('f")",9)   'prime factors: '     newV1.f     pf
end   /*�*n*/
say
ps= 'primes';    if p==1  then ps= "prime"       /*�*setup for proper English in sentence.*/
say right(newV2, w+9+1)       ps       'found.'      /*�*display the number of primes found.  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
factr: procedure;  parse arg x 1 d,newV4             /*�*set X, D  to argument 1;  $  to null.*/
if x==1  then return ''                          /*�*handle the special case of   X = 1.  */
do  while x//2==0;  newV4=newV4 2;  x=x%2;  end   /*�*append all the  2  factors of new  X.*/
do  while x//3==0;  newV4=newV4 3;  x=x%3;  end   /*�*   "    "   "   3     "     "  "   " */
do  while x//5==0;  newV4=newV4 5;  x=x%5;  end   /*�*   "    "   "   5     "     "  "   " */
do  while x//7==0;  newV4=newV4 7;  x=x%7;  end   /*�*   "    "   "   7     "     "  "   " */
/*�*                                  ___*/
q=1;   do  while q<=x;  q=q*4;  end              /*�*these two lines compute integer  √ X */
r=0;   do  while q>1;   q=q%4;  newV5=d-r-q;  r=r%2;   if newV5>=0  then do; d=newV5; r=r+q; end;  end

do j=11  by 6  to r                       /*�*insure that  J  isn't divisible by 3.*/
parse var j  ''  -1  newV5                    /*�*obtain the last decimal digit of  J. */
if newV5\==5  then  do  while x//j==0;  newV4=newV4 j;  x=x%j;  end     /*�*maybe reduce by J. */
if newV5 ==3  then iterate                    /*�*Is next  Y  is divisible by 5?  Skip.*/
y=j+2;          do  while x//y==0;  newV4=newV4 y;  x=x%y;  end     /*�*maybe reduce by J. */
end   /*�*j*/
/*�* [↓]  The $ list has a leading blank.*/
if x==1  then return newV4                           /*�*Is residual=unity? Then don't append.*/
return newV4 x                         /*�*return   $   with appended residual. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Prime-decomposition\prime-decomposition-1.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
