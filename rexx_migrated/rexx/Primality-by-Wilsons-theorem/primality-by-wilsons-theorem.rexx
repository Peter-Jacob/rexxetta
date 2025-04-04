/*ͺ*REXX pgm tests for primality via Wilson's theorem: a # is prime if p divides (p-1)! +1*/
parse arg LO zz                                  /*ͺ*obtain optional arguments from the CL*/
if LO=='' | LO==","  then LO= 120                /*ͺ*Not specified?  Then use the default.*/
if zz ='' | zz =","  then zz=2 3 9 15 29 37 47 57 67 77 87 97 237 409 659 /*ͺ*use default?*/
sw= linesize() - 1;  if sw<1  then sw= 79        /*ͺ*obtain the terminal's screen width.  */
digs = digits()                                  /*ͺ*the current number of decimal digits.*/
newV3= 0                                             /*ͺ*number of  (LO)  primes found so far.*/
newV2.= 1                                            /*ͺ*placeholder for factorial memoization*/
newV4=                                               /*ͺ*     "      to hold a list of primes.*/
do p=1  until newV3=LO;         oDigs= digs      /*ͺ*remember the number of decimal digits*/
newV5= isPrimeW(p)                               /*ͺ*test primality using Wilson's theorem*/
if digs>Odigs  then numeric digits digs      /*ͺ*use larger number for decimal digits?*/
if \newV5  then iterate                          /*ͺ*if not prime, then ignore this number*/
newV3= newV3 + 1;                   newV4= newV4 p           /*ͺ*bump prime counter; add prime to list*/
end   /*ͺ*p*/

call show 'The first '    LO    " prime numbers are:"
w= max( length(LO), length(word(reverse(zz),1))) /*ͺ*used to align the number being tested*/
newV1.0= "            isn't";     newV1.1= 'is'      /*ͺ*2 literals used for display: is/ain't*/
say
do z=1  for words(zz);      oDigs= digs      /*ͺ*remember the number of decimal digits*/
p= word(zz, z)                               /*ͺ*get a number from userβsupplied list.*/
newV5= isPrimeW(p)                               /*ͺ*test primality using Wilson's theorem*/
if digs>Odigs  then numeric digits digs      /*ͺ*use larger number for decimal digits?*/
say right(p, max(w,length(p) ) )       newV1.newV5      "prime."
end   /*ͺ*z*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isPrimeW: procedure expose newV2. digs;  parse arg x '' -1 last;        newV6= 1;       xm= x - 1
if x<2                   then return 0 /*ͺ*is the number too small to be prime? */
if x==2 | x==5           then return 1 /*ͺ*is the number a two or a five?       */
if last//2==0 | last==5  then return 0 /*ͺ*is the last decimal digit even or 5? */
if newV2.xm\==1  then newV6= newV2.xm              /*ͺ*has the factorial been preβcomputed? */
else do;  if xm>newV2.0  then do; base= newV2.0+1; newV7= newV2.0;  newV6= newV2.newV7; end
else     base= 2        /*ͺ* [β] use shortcut.*/
do j=newV2.0+1  to xm;  newV6= newV6 * j  /*ͺ*compute factorial.*/
if pos(., newV6)\==0  then do;  parse var newV6  'E'  expon
numeric digits expon +99
digs = digits()
end    /*ͺ* [β] has exponent,*/
end   /*ͺ*j*/                   /*ͺ*bump numeric digs.*/
if xm<999  then do; newV2.xm=newV6; newV2.0=xm; end /*ͺ*assign factorial. */
end                                     /*ͺ*only save small #s*/
if (newV6+1)//x==0  then return 1                             /*ͺ*X  is     a prime.*/
return 0                             /*ͺ*"  isn't  "   "   */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: parse arg header,oo;     say header        /*ͺ*display header for the first N primes*/
w= length( word(newV4, LO) )                   /*ͺ*used to align prime numbers in $ list*/
do k=1  for LO; newV7= right( word(newV4, k), w) /*ͺ*build list for displaying the primes.*/
if length(oo newV7)>sw  then do;  say substr(oo,2);  oo=;  end  /*ͺ*a line overflowed?*/
oo= oo newV7                                                    /*ͺ*display a line.   */
end   /*ͺ*k*/                                                 /*ͺ*does pretty print.*/
if oo\=''  then say substr(oo, 2);  return /*ͺ*display residual (if any overflowed).*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Primality-by-Wilsons-theorem\primality-by-wilsons-theorem.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
