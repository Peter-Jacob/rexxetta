/*ͺ*REXX pgm finds:  1st N Brazilian #s;  odd Brazilian #s;  prime Brazilian #s;  ZZZth #.*/
parse arg  t.1  t.2  t.3  t.4  .                 /*ͺ*obtain optional arguments from the CL*/
if t.4=='' | t.4==","  then t.4= 0               /*ͺ*special test case of Nth Brazilian #.*/
hdr.1= 'first';   hdr.2= "first odd";   hdr.3= 'first prime';   hdr.4=   /*ͺ*four headers.*/
newV1= 0    /*ͺ*#P:   the number of primes  (so far).*/
do c=1  for 4                                /*ͺ*process each of the four cases.      */
if t.c=='' | t.c==","  then t.c= 20          /*ͺ*check if a target is null or a comma.*/
step= 1 + (c==2)                             /*ͺ*STEP is set to unity or two (for ODD)*/
if t.c==0  then iterate                      /*ͺ*check to see if this case target β‘ 0.*/
newV4=;                       newV5= 0               /*ͺ*initialize list to null; counter to 0*/
do j=1  by step  until newV5>= t.c            /*ͺ*search integers for Brazilian # type.*/
prime= 0                                  /*ͺ*signify if  J  may not be prime.     */
if c==3  then do                          /*ͺ*is this a  "case 3"  calculation?    */
if \isPrime(j) then iterate /*ͺ*(case 3)  Not a prime?  Then skip it.*/
prime= 1                    /*ͺ*signify if  J  is definately a prime.*/
end                         /*ͺ* [β] Jβ‘prime will be used for speedup*/
if \isBraz(j, prime)  then iterate        /*ͺ*Not  Brazilian number?   "    "    " */
newV5= newV5 + 1                                  /*ͺ*bump the counter of Brazilian numbers*/
if c\==4  then newV4= newV4  j                    /*ͺ*for most cases, append J to ($) list.*/
end   /*ͺ*j*/                               /*ͺ* [β] cases 1βββΊ3, $ has leading blank*/
say                                          /*ͺ* [β]  use a special header for cases.*/
if c==4  then do;  newV4= j;  t.c= th(t.c);  end /*ͺ*for Nth Brazilian number, just use J.*/
say center(' 'hdr.c" "    t.c      " Brazilian number"left('s',  c\==4)" ",  79,  'β')
say strip(newV4)                                 /*ͺ*display a case result to the terminal*/
end      /*ͺ*c*/                               /*ͺ* [β] cases 1βββΊ3 have a leading blank*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isBraz:  procedure; parse arg x,p;  if x<7      then return 0  /*ͺ*Is # < seven?  Nope.   */
if x//2==0  then return 1  /*ͺ*Is # even?     Yup.   _*/
if p  then mx= iSqrt(x)                               /*ͺ*X prime? Use integer βX*/
else mx= x%3 -1                                 /*ͺ*X  not known if prime. */
do b=2  for mx                   /*ͺ*scan for base 2 βββΊ max*/
if sameDig(x, b)  then return 1  /*ͺ*it's a Brazilian number*/
end   /*ͺ*b*/;           return 0  /*ͺ*not  "     "        "  */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isPrime: procedure expose newV3. newV2. newV1; parse arg x '' -1 newV6 /*ͺ*get 1st arg & last decimal dig*/
if newV1==0 then do;  newV2.=0;  y= 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67
do i=1  for words(y);  newV1= newV1+1; z=word(y,i); newV3.newV1= z; newV2.z=1; end
end                              /*ͺ*#P:  is the number of primes. */
if newV2.x      then return 1;   if x<61  then return 0;  if x//2==0  then return 0
if x//3==0  then return 0;   if newV6==5  then return 0;  if x//7==0  then return 0
do j=5  until newV3.j**2>x;                 if x//newV3.j     ==0  then return 0
if x//(newV3.j+2) ==0  then return 0
end   /*ͺ*j*/;   newV1= newV1 + 1;   newV3.newV1= x;   newV2.x= 1;    return 1  /*ͺ*it's a prime.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
iSqrt:   procedure; parse arg x;     q= 1;     r= 0;        do while q<=x;   q= q*4;   end
do while q>1; q=q%4; newV6=x-r-q; r=r%2; if newV6>=0 then do;x=newV6;r=r+q;end;end; return r
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sameDig: procedure; parse arg x, b;           f= x // b        /*ͺ* //  βββ the remainder.*/
x= x  % b        /*ͺ*  %  βββ is integer  Γ· */
do while x>0;  if x//b \==f  then return 0
x= x % b
end   /*ͺ*while*/;      return 1             /*ͺ*it has all the same dig*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
th: parse arg th; return th || word('th st nd rd', 1+(th//10)*(th//100%10\==1)*(th//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Brazilian-numbers\brazilian-numbers.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
