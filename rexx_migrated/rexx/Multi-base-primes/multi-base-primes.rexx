/*ͺ*REXX pgm finds primes whose values in other bases (2βββΊ36) have the most diff. bases. */
parse arg widths .                               /*ͺ*obtain optional argument from the CL.*/
if widths=='' | widths==","  then widths= 5      /*ͺ*Not specified?  Then use the default.*/
call genP                                        /*ͺ*build array of semaphores for primes.*/
names= 'one two three four five six seven eight' /*ͺ*names for some low decimal numbers.  */
newV1.=
do j=1  for newV5                                /*ͺ*only use primes that are within range*/
do b=36  by -1  for 35;  n= base(newV2.j, b)  /*ͺ*use different bases for each prime.  */
L= length(n);  if L>widths  then iterate  /*ͺ*obtain length; Length too big?  Skip.*/
if L==1  then newV1.L.n= b  newV1.L.n             /*ͺ*Length  =  unity?   Prepend the base.*/
else newV1.L.n= newV1.L.n  b             /*ͺ*   "   Β¬=    "       Append  "    "  */
end   /*ͺ*b*/
end      /*ͺ*j*/
/*ͺ*display info for each of the widths. */
do w=1  for widths;             cnt= 0     /*ͺ*show for each width: cnt,number,bases*/
bot= left(1, w, 0);    top= left(9, w, 9)      /*ͺ*calculate range for DO. */
do n=bot  to top;     y= words(newV1.w.n)  /*ͺ*find the sets of numbers for a width.*/
if y>cnt  then do;  mxn=n;  cnt= max(cnt, y);  end  /*ͺ*found a max? Remember it*/
end   /*ͺ*n*/
say
say;  say center(' 'word(names, w)"βcharacter numbers that are"      ,
'prime in the most bases: ('cnt      "bases) ",  101, 'β')
do n=bot  to top;     y= words(newV1.w.n)             /*ͺ*search again for maximums.*/
if y==cnt  then say n  'βββΊ'  strip(newV1.w.n)        /*ͺ*display  βββaβββ maximum. */
end   /*ͺ*n*/
end       /*ͺ*w*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
base: procedure; parse arg x,r,,z;               newV3= '0123456789abcdefghijklmnopqrsruvwxyz'
do j=1;  newV4= r**j;  if newV4>x  then leave
end   /*ͺ*j*/
do k=j-1  to 1  by -1;   newV4= r**k;  z= z || substr(newV3, (x % newV4) + 1, 1);   x= x // newV4
end   /*ͺ*k*/;                   return z || substr(newV3, x+1, 1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV2.1=2;  newV2.2=3;  newV2.3=5;  newV2.4=7;  newV2.5=11     /*ͺ*define some low primes.              */
newV5= 5;  sq.newV5= newV2.newV5 ** 2     /*ͺ*number primes so far;  prime squared.*/
do j=newV2.newV5+2  by 2  to 2 * 36 * 10**widths /*ͺ*find odd primes from here on.        */
parse var  j   ''  -1  newV4;  if newV4==5  then iterate     /*ͺ*J is Γ· by 5? (right dig).*/
if j//3==0  then iterate;  if j//7==0  then iterate  /*ͺ*"  " " "  3?;  Γ· by  7?  */
do k=5  while sq.k<=j             /*ͺ* [β]  divide by the known odd primes.*/
if j//newV2.k==0  then iterate j      /*ͺ*Is  J Γ· X?  Then not prime.     ___  */
end   /*ͺ*k*/                       /*ͺ* [β]  only process numbers  β€  β J   */
newV5= newV5 + 1;            newV2.newV5= j;  sq.newV5= j*j  /*ͺ*bump # Ps; assign next P;  P squared.*/
end          /*ͺ*j*/;           return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multi-base-primes\multi-base-primes.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
