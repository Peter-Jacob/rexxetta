/*ช*REXX program finds and shows lists (or counts) attractive numbers up to a specified N.*/
parse arg N .                                    /*ช*get optional argument from the C.L.  */
if N=='' | N==","  then N= 120                   /*ช*Not specified?  Then use the default.*/
cnt= N<0                                         /*ช*semaphore used to control the output.*/
N= abs(N)                                        /*ช*ensure that  N  is a positive number.*/
call genP 100                                    /*ช*gen 100 primes (high= 541); overkill.*/
sw= linesize()  -  1                             /*ช*SW:    is the usable screen width.   */
if \cnt  then say 'attractive numbers up to and including '      commas(N)        " are:"
newV2= 0                                             /*ช*number of attractive #'s  (so far).  */
newV3=                                               /*ช*a list of attractive numbers (so far)*/
do j=1  for N;   if newV1.j  then iterate        /*ช*Is it a low prime?  Then skip number.*/
a= cFact(j)                            /*ช*call cFact to count the factors in J.*/
if \newV1.a  then iterate                        /*ช*if # of factors not prime, then skip.*/
newV2= newV2 + 1                                     /*ช*bump number of attractive #'s found. */
if cnt   then iterate                        /*ช*if not displaying numbers, skip list.*/
cj= commas(j);             newV4= newV3 cj           /*ช*append a commatized number to $ list.*/
if length(newV4)>sw  then do;  say strip(newV3);  newV3= cj;  end   /*ช*display a line of numbers.*/
else                     newV3= newV4          /*ช*append the latest number. */
end   /*ช*j*/

if newV3\==''  &  \cnt   then say strip(newV3)           /*ช*display any residual numbers in list.*/
say;     say commas(newV2)     ' attractive numbers found up to and including '      commas(N)
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
cFact: procedure;  parse arg z 1 oz;  if z<2  then return z  /*ช*if Z too small, return Z.*/
newV2= 0                                      /*ช*#:  is the number of factors (so far)*/
do  while z//2==0;  newV2= newV2+1;  z= z%2;  end  /*ช*maybe add the factor of two.  */
do  while z//3==0;  newV2= newV2+1;  z= z%3;  end  /*ช*  "    "   "     "    " three.*/
do  while z//5==0;  newV2= newV2+1;  z= z%5;  end  /*ช*  "    "   "     "    " five. */
do  while z//7==0;  newV2= newV2+1;  z= z%7;  end  /*ช*  "    "   "     "    " seven.*/
/*ช* [โ]  reduce  Z  by some low primes. */
do k=11  by 6  while k<=z              /*ช*insure that  K  isn't divisible by 3.*/
parse var k  ''  -1  newV4                 /*ช*obtain the last decimal digit of  K. */
if newV4\==5  then do  while z//k==0;  newV2= newV2+1;   z= z%k;   end   /*ช*maybe reduce Z.*/
if newV4 ==3  then iterate                 /*ช*Next number รท by 5?  Skip.   ____    */
if k*k>oz then leave                   /*ช*are we  greater  than the   โ OZ  ?  */
y= k + 2                               /*ช*get next divisor,  hopefully a prime.*/
do while  z//y==0;  newV2= newV2+1;   z= z%y;   end   /*ช*maybe reduce Z.*/
end   /*ช*k*/
if z\==1  then return newV2 + 1               /*ช*if residual isn't unity, then add one*/
return newV2                   /*ช*return the number of factors in  OZ. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
commas: parse arg newV5;  do jc=length(newV5)-3  to 1  by -3; newV5=insert(',', newV5, jc); end;  return newV5
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
genP: procedure expose newV1.; parse arg n;           newV1.=0;         newV1.2= 1;     newV1.3= 1;   p= 2
do j=3  by 2  until p==n;   do k=3  by 2  until k*k>j;  if j//k==0  then iterate j
end  /*ช*k*/;             newV1.j = 1;        p= p + 1
end   /*ช*j*/;          return             /*ช* [โ]  generate  N  primes.           */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Attractive-numbers\attractive-numbers.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
