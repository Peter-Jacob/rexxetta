/*ͺ*REXX program finds/displays fortunate numbers  N,  where  N  is specified (default=8).*/
numeric digits 12
parse arg n cols .                               /*ͺ*obtain optional argument from the CL.*/
if    n=='' |    n==","  then    n=  8           /*ͺ*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols= 10           /*ͺ* "      "         "   "   "     "    */
call genP n**2                                   /*ͺ*build array of semaphores for primes.*/
pp.= 1
do i=1  for n+1;   im= i - 1;    pp.i= pp.im * newV2.i   /*ͺ*calculate primorial numbers*/
end   /*ͺ*i*/
i=i-1;  call genp pp.i + 1000
title= ' fortunate numbers'
w= 10                                            /*ͺ*maximum width of a number in any col.*/
say ' index β'center(title, 1 + cols*(w+1)     )
say 'ββββββββΌ'center(""   , 1 + cols*(w+1), 'β')
found= 0;                           idx= 1       /*ͺ*number of fortunate (so far) & index.*/
newV1.= 0;                             maxFN= 0     /*ͺ*(stemmed)  array of fortunate numbers*/
do j=1  until found==n;     pt= pp.j     /*ͺ*search for fortunate numbers in range*/
pt= pp.j                                 /*ͺ*get the precalculated primorial prime*/
do m=3  by 2;  t= pt + m    /*ͺ*find  M  that satisfies requirement. */
if newV3.t==''  then leave      /*ͺ*Is !.t prime?  Then we found a good M*/
end   /*ͺ*m*/
if newV1.m  then iterate                    /*ͺ*Fortunate # already found?  Then skip*/
newV1.m= 1;      found= found + 1           /*ͺ*assign fortunate number;  bump count.*/
maxFN= max(maxFN, t)                     /*ͺ*obtain max fortunate # for displaying*/
end   /*ͺ*j*/
newV4=;                                 finds= 0     /*ͺ*$:  line of output;    FINDS:  count.*/
do k=1  for maxFN;  if \newV1.k  then iterate /*ͺ*show the fortunate numbers we found. */
finds= finds + 1                           /*ͺ*bump the  count of numbers (for $).  */
c= commas(k)                               /*ͺ*maybe add commas to the number.      */
newV4= newV4  right(c, max(w, length(c) ) )        /*ͺ*add a nice prime βββΊ list, allow big#*/
if found//cols\==0  then iterate           /*ͺ*have we populated a line of output?  */
say center(idx, 7)'β'  substr(newV4, 2);   newV4=  /*ͺ*display what we have so far  (cols). */
idx= idx + cols                            /*ͺ*bump the  index  count for the output*/
end   /*ͺ*k*/

if newV4\==''  then say center(idx, 7)"β"  substr(newV4, 2)  /*ͺ*possible display residual output.*/
say 'ββββββββ΄'center(""   , 1 + cols*(w+1), 'β')     /*ͺ*display the foot separator.      */
say
say 'Found '       commas(found)      title
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV5;  do jc=length(newV5)-3  to 1  by -3; newV5=insert(',', newV5, jc); end;  return newV5
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP:        newV2.1=2; newV2.2=3; newV2.3=5; newV2.4=7;  newV2.5=11 /*ͺ*define some low primes.              */
newV3.=0;  newV3.2=;  newV3.3=;  newV3.5=;  newV3.7=;   newV3.11=  /*ͺ*   "     "   "    "     semaphores.  */
newV6= 5;  sq.newV6= newV2.newV6**2   /*ͺ*squares of low primes.*/
do j=newV2.newV6+2  by 2  to arg(1)              /*ͺ*find odd primes from here on.        */
parse var j '' -1 newV7;     if newV7==5  then iterate       /*ͺ*J Γ· by 5 ?               */
if j//3==0  then iterate;  if j//7==0  then iterate  /*ͺ*" "  " 3?;    J Γ· by 7 ? */
do k=5  while sq.k<=j             /*ͺ* [β]  divide by the known odd primes.*/
if j // newV2.k == 0  then iterate j  /*ͺ*Is  J Γ· X?  Then not prime.     ___  */
end   /*ͺ*k*/                       /*ͺ* [β]  only process numbers  βξεχΦ΄  β J   */
newV6= newV6+1;    newV2.newV6= j;    sq.newV6= j*j;  newV3.j=   /*ͺ*bump # of Ps; assign next P;  PΒ²; P# */
end          /*ͺ*j*/;               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fortunate-numbers\fortunate-numbers.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
