/*�*REXX program finds and displays the   home prime   of a range of positive integers.   */
numeric digits 20                                /*�*ensure handling of larger integers.  */
parse arg  LO HI .                               /*�*obtain optional arguments from the CL*/
if LO=='' | LO=="," then LO=  2                  /*�*Not specified?  Then use the default.*/
if HI=='' | HI=="," then HI= 20                  /*�* "     "         "   "   "     "     */
newV1= 'home prime chain for '                    /*�*a literal used in two SAY statements.*/
w= length(HI)   /*�*HI width, used for output alignment. */
do j=max(2, LO)  to HI                    /*�*find home primes for an integer range*/
pf= factr(j);             f= words(pf)    /*�*get prime factors; number of factors.*/
if f==1  then do;  say newV1 j": "  j  ' is prime.';  iterate;  end   /*�*J is prime*/
xxx.1= j                                  /*�*save  J  in the first array element. */
do n=2  until newV2==1               /*�*keep processing until we find a prime*/
xxx.n= space(pf, 0)              /*�*obtain factors of a concatenated p.f.*/
pf= factr(xxx.n);   newV2= words(pf) /*�*assign factors to PF;  # of factors. */
end   /*�*n*/
ee= n                                     /*�*save  EE  as the final (last) prime. */
n= n - 1;   z= n                          /*�*adjust N (for DO loop); assign N to Z*/
newV3=                                        /*�*nullify the string of   home primes. */
do m=1  for n                    /*�*build a list  ($)  of     "     "    */
newV3= newV3  'HP'xxx.m"("z') ─► '       /*�*concatenate to string of  "     "    */
z= z - 1                         /*�*decrease the index counter by unity. */
end   /*�*m*/                      /*�* [↑]  the index counter is decreasing*/

say newV1 right(j, w)":"   newV3   xxx.ee  ' is prime.'  /*�*show string of home primes.*/
end   /*�*n*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
factr: procedure;  parse arg x 1 d,newV3             /*�*set X, D  to argument 1;  $  to null.*/
if x==1  then return ''                   /*�*handle the special case of   X = 1.  */
do  while x//2==0; newV3= newV3 2; x= x% 2; end /*�*append all the  2  factors of new  X.*/
do  while x//3==0; newV3= newV3 3; x= x% 3; end /*�*   "    "   "   3     "     "  "   " */
do  while x//5==0; newV3= newV3 5; x= x% 5; end /*�*   "    "   "   5     "     "  "   " */
do  while x//7==0; newV3= newV3 7; x= x% 7; end /*�*   "    "   "   7     "     "  "   " */
q= 1;                              r= 0   /*�*R:  will be iSqrt(x).             ___*/
do  while q<=x; q=q*4; end              /*�*these two lines compute integer  √ X */
do  while q>1;  q=q%4; newV4= d-r-q; r= r%2; if newV4>=0  then do; d= newV4; r= r+q; end; end

do k=11  by 6  to r                     /*�*insure that  J  isn't divisible by 3.*/
parse var k  ''  -1  newV4                  /*�*obtain the last decimal digit of  K. */
if newV4\==5  then  do  while x//k==0;  newV3=newV3 k;  x=x%k;  end    /*�*maybe reduce by K.*/
if newV4 ==3  then iterate                  /*�*Is next  Y  is divisible by 5?  Skip.*/
y= k+2;         do  while x//y==0;  newV3=newV3 y;  x=x%y;  end    /*�*maybe reduce by Y.*/
end   /*�*k*/
/*�* [↓]  The $ list has a leading blank.*/
if x==1  then return newV3                    /*�*Is residual=unity? Then don't append.*/
return newV3 x                  /*�*return   $   with appended residual. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Home-primes\home-primes.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
