/*�*REXX program finds  emirp  primes (base 10):  when a prime reversed, is another prime.*/
parse arg x y .                                  /*�*obtain optional arguments from the CL*/
if x=='' | x==","  then do;  x=1;  y=20;  end    /*�*Not specified?  Then use the default.*/
if y==''  then y=x                               /*�* "      "         "   "   "     "    */
r=y<0;    y=abs(y)                               /*�*display a  range  of  emirp primes ? */
rly=length(y) + \r                               /*�*adjusted length of the  Y  value.    */
newV1.=0;  c=0;   newV4=2 3 5 7 11 13 17;   newV5=           /*�*isP; emirp count; low primes; emirps.*/
do newV6=1  for words(newV4);   p=word(newV4,newV6);   newV2.newV6=p;    newV1.p=1;    end  /*�*#*/
newV6=newV6-1;   ip=newV6;  s.newV6=newV2.newV6**2                       /*�*adjust # (for the DO loop);  last P².*/
/*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒ [↓]   generate more primes within range.   */
do j=newV2.newV6+2  by 2                             /*�*only find  odd  primes from here on. */
if length(newV6)>rly  then leave                 /*�*have we enough primes for emirps?    */
if j//3      ==0  then iterate               /*�*is  J  divisible by three?           */
if right(j,1)==5  then iterate               /*�*is the right-most digit a "5" ?      */
if j//7      ==0  then iterate               /*�*is  J  divisible by seven?           */
if j//11     ==0  then iterate               /*�*is  J  divisible by eleven?          */
if j//13     ==0  then iterate               /*�*is  J  divisible by thirteen?        */
/*�*[↑]  the above five lines saves time.*/
do k=ip  while  s.k<=j                 /*�*divide by the known  odd  primes.    */
if j//newV2.k==0  then iterate j           /*�*J divisible by X?  Then ¬prime.   ___*/
end   /*�*k*/                            /*�* [↑]  divide by odd primes up to √ j */
newV6=newV6+1                                        /*�*bump the number of primes found.     */
newV2.newV6=j;      s.newV6=j*j;     newV1.j=1               /*�*assign to sparse array; prime²; prime*/
end         /*�*j*/                            /*�* [↑]  keep generating until enough.  */
/*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒ [↓]    filter  emirps  for the display.    */
do j=6  to newV2.newV6;   newV4=newV2.j                      /*�*traipse through the regular primes.  */
if (r&newV4>y) | (\r&c==y)  then leave           /*�*is the prime not within the range?   */
newV3=reverse(newV4)                                /*�*reverse (digits) of the regular prime*/
if \newV1.newV3   | newV4==newV3    then iterate           /*�*is the  reverse  a different prime ? */
c=c+1                                        /*�*bump the emirp prime counter.        */
if (r&newV4<x) | (\r&c<x) then iterate           /*�*is  emirp  not within allowed range? */
newV5=newV5 newV4                                        /*�*append prime to the emirpPrime list. */
end   /*�*j*/                                  /*�* [↑]  list:  by value  or  by range. */
/*�* [↓]  display the emirp list.        */
say strip(newV5);   say;   n=words(newV5);   newV7=(n\==1)   /*�*display the  emirp primes  wanted.   */
if newV7  then say  n   'emirp primes shown.'        /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Emirp-primes\emirp-primes-1.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
