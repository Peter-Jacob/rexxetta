/*�*REXX program displays the number of chars in a fibonacci word, and the word's entropy.*/
d= 21;      de= d + 6;      numeric digits de    /*�*use more precision (the default is 9)*/
parse arg N .                                    /*�*get optional argument from the C.L.  */
if N==''  | N==","  then N= 42                   /*�*Not specified?  Then use the default.*/
say center('N', 3)   center("length", de)   center('entropy', de)   center("Fib word", 56)
say copies('─', 3)   copies("─"     , de)   copies('─'      , de)   copies("─"       , 56)
c= 1                                             /*�*initialize the 1st value for entropy.*/
do j=1  for N                              /*�* [↓]  display   N   fibonacci words. */
if j==2  then c= 0                         /*�*test for the case of  J  equals  2.  */
if j==3  then parse value  1 0  with  a b  /*�*  "   "   "    "   "  "    "     3.  */
if j>2   then c= b || a                    /*�*calculate the FIBword  if we need to.*/
L= length(c)                               /*�*find the length of the fib─word  C.  */
if L<56  then Fw= c
else Fw= '{the word is too wide to display}'
say right(j, 2)     right( commas(L), de)       '  '       entropy()     "  "     Fw
a= b;    b= c                              /*�*define the new values for  A  and  B.*/
end   /*�*j*/                                /*�*display text msg;                    */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV2;  do jc=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, jc); end;  return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
entropy: if L==1  then return left(0, d + 2)     /*�*handle special case of one character.*/
newV1.0= length(space(translate(c,, 1), 0)) /*�*efficient way to count the  "zeroes".*/
newV1.1= L - newV1.0;                  newV3= 0     /*�*define 1st fib─word; initial entropy.*/
do i=1  for 2;          newV4= i - 1 /*�*construct character from the ether.  */
newV3= newV3 - newV1.newV4 / L * log2(newV1.newV4 / L)   /*�*add  (negatively)  the entropies.    */
end   /*�*i*/
if newV3=1  then return   left(1, d+2)      /*�*return a left─justified  "1"  (one). */
return format(newV3, , d)      /*�*normalize the sum  (S)  number.      */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
log2: procedure; parse arg x 1 xx;  ig=x>1.5;  is=1-2*(ig\==1);  numeric digits 5+digits()
e=2.71828182845904523536028747135266249775724709369995957496696762772407663035354759
m=0;  do  while  ig & xx>1.5 | \ig&xx<.5;   newV4=e;         do j=-1;   iz=xx* newV4 ** - is
if j>=0  then if ig & iz<1 | \ig&iz>.5  then leave;  newV4=newV4*newV4; izz=iz;  end /*�*j*/
xx=izz;  m=m+is*2**j;  end /*�*while*/;     x=x* e** -m -1;   z=0;   newV4=-1;   p=z
do k=1;   newV4=-newV4*x;   z=z+newV4/k;   if z=p  then leave;   p=z;    end  /*�*k*/
r=z+m;            if arg()==2  then return r;             return r / log2(2,.)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fibonacci-word\fibonacci-word.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
