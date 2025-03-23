/*�*REXX program finds  numbers  that are  palindromic  in both  binary  and  ternary.    */
digs=50;  numeric digits digs                    /*�*biggest known B2B3 palindrome: 44 dig*/
parse arg maxHits .;   if maxHits==''  then maxHits=6              /*�*use six as a limit.*/
hits=0;                      newV3= 'fiat'           /*�*the number of palindromes  (so far). */
call show 0,0,0;       call show 1,1,1           /*�*show the first two palindromes (fiat)*/
newV1.=0;    newV1.1=1;  newV1.5=1;  newV1.7=1;  newV1.8=1           /*�*modulus nine results that are OK.    */
newV2.=                                              /*�* [↓]  build list of powers of three. */
do i=1  until newV2.i>10**digs;  newV2.i=3**i;  end /*�*compute powers of  three  for radix3.*/
p=1                                              /*�* [↓]  primary search: bin palindromes*/
do newV3=digs                                   /*�*use all numbers, however, DEC is odd.*/
binH=x2b( d2x(newV3) )   + 0                    /*�*convert some decimal number to binary*/
binL=reverse(binH)                          /*�*reverse the binary digits  (or bits).*/
dec=x2d( b2x( binH'0'binL) ); newV4=dec//9;  if newV1.newV4  then if dec//3\==0  then call radix3
dec=x2d( b2x( binH'1'binL) ); newV4=dec//9;  if newV1.newV4  then if dec//3\==0  then call radix3
end   /*�*#*/                                 /*�* [↑]  crunch 'til found 'nuff numbers*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
radix3: parse var dec x 1 newV5,q                    /*�* [↓] convert decimal  # ──►  ternary.*/
do j=p  while newV2.j<=x;   end     /*�*find upper limit of power of three.  */
p=j-1                                    /*�*use this power of three for next time*/
do k=p  by -1  for p;   newV4=newV2.k;   d=x%newV4;   q=q || d;   x=x//newV4;   end /*�*k*/
t=q || x                                 /*�*handle residual of ternary conversion*/
if t\==reverse(t)  then return           /*�*is T ternary number not palindromic? */
call show newV5, t, strip(x2b(d2x(newV5)), , 0)  /*�*show number: decimal, ternary, binary*/
return                                   /*�* [↑]   RADIX3 subroutine is sluggish.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: hits=hits+1;         say                   /*�*bump the number of palindromes found.*/
say right('['hits"]", 5)   right( arg(1), digs)   '(decimal),   ternary='  arg(2)
say right('', 5+1+ digs)                          '             binary ='  arg(3)
if hits>2  then  if hits//2  then newV3=newV3'0'
if hits<maxHits  then return               /*�*Not enough palindromes?  Keep looking*/
exit                                       /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Find-palindromic-numbers-in-both-binary-and-ternary-bases\find-palindromic-numbers-in-both-binary-and-ternary-bases-2.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
