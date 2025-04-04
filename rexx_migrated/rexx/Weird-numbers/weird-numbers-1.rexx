/*ͺ*REXX program  finds and displays  N   weird numbers in a vertical format (with index).*/
parse arg n cols .                               /*ͺ*obtain optional arguments from the CL*/
if    n=='' |    n==","  then    n= 25           /*ͺ*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols= 10           /*ͺ* "      "         "   "   "     "    */
w= 10                                            /*ͺ*width of a number in any column.     */
if cols>0 then say ' index β'center(' weird numbers',   1 + cols*(w+1)     )
if cols>0 then say 'ββββββββΌ'center(""              ,   1 + cols*(w+1), 'β')
idx= 1;                          newV2=              /*ͺ*index for the output list;  $: 1 line*/
weirds= 0                                        /*ͺ*the count of weird numbers  (so far).*/
do j=2  by 2  until weirds==n               /*ͺ*examine even integers 'til have 'nuff*/
if \weird(j)  then iterate                  /*ͺ*Not a  weird  number?  Then skip it. */
weirds= weirds + 1                          /*ͺ*bump the count of  weird   numbers.  */
c= commas(j)                                /*ͺ*maybe add commas to the number.      */
newV2= newV2 right(c, max(w, length(c) ) )          /*ͺ*add a nice prime βββΊ list, allow big#*/
if weirds//cols\==0  then iterate           /*ͺ*have we populated a line of output?  */
say center(idx, 7)'β'  substr(newV2, 2);   newV2=   /*ͺ*display what we have so far  (cols). */
idx= idx + cols                             /*ͺ*bump the  index  count for the output*/
end   /*ͺ*j*/

if newV2\==''  then say center(idx, 7)"β"  substr(newV2, 2)  /*ͺ*possible display residual output.*/
if cols>0 then say 'ββββββββ΄'center(""    ,  1 + cols*(w+1), 'β')
say
say 'Found '       commas(weirds)          ' weird numbers'
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV3;  do ic=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, ic); end;  return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
DaS:  procedure; parse arg x 1 z 1,b;       a= 1 /*ͺ*get X,Z,B (the 1st arg); init A list.*/
r= 0;         q= 1                         /*ͺ* [β] ββinteger square rootββ     ___ */
do while q<=z; q=q*4; end             /*ͺ*R:  an integer which will be    β X  */
do while q>1;  q=q%4;  newV3= z-r-q;  r=r%2;  if newV3>=0  then  do;  z=newV3;  r=r+q;  end
end   /*ͺ*while q>1*/                   /*ͺ* [β]  compute the integer sqrt of  X.*/
sig= a                                     /*ͺ*initialize the sigma so far.     ___ */
do j=2  to r - (r*r==x)                /*ͺ*divide by some integers up to   β X  */
if x//j==0  then do;  a=a j;  b= x%j b /*ͺ*if Γ·, add both divisors to  Ξ± and Γ. */
sig= sig +j +x%j /*ͺ*bump the sigma (the sum of divisors).*/
end
end   /*ͺ*j*/                            /*ͺ* [β]  %  is the REXX integer division*/
/*ͺ* [β]  adjust for a square.        ___*/
if j*j==x  then  return sig+j   a j b      /*ͺ*Was  X  a square?    If so, add  β X */
return sig     a   b      /*ͺ*return the divisors  (both lists).   */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
weird: procedure; parse arg x .                  /*ͺ*obtain a # to be tested for weirdness*/
if x<70 | x//3==0   then return 0         /*ͺ*test if X is too low or multiple of 3*/
parse value  DaS(x)  with  sigma divs     /*ͺ*obtain sigma and the proper divisors.*/
if sigma<=x  then  return 0               /*ͺ*X  isn't abundant  (sigma too small).*/
newV4= words(divs)                            /*ͺ*count the number of divisors for  X. */
if newV4<3   then return 0                    /*ͺ*Not enough divisors?    "      "     */
if newV4>15  then return 0                    /*ͺ*number of divs > 15?  It's not weird.*/
a.=                                       /*ͺ*initialize the    A.   stemmed array.*/
do i=1  for newV4;     newV3= word(divs, i)   /*ͺ*obtain one of the divisors of  X.    */
newV1.i= newV3;          a.newV3= .               /*ͺ*assign proper divsβββΊ@ array; also id*/
end   /*ͺ*i*/
df= sigma - x                             /*ͺ*calculate difference between ΞξεχΦ΄ and X.*/
if a.df==.  then return 0                 /*ͺ*Any divisor is equal to DF? Not weird*/
c= 0                                      /*ͺ*zero combo counter; calc. power of 2.*/
do p=1  for 2**newV4-2;         c= c + 1  /*ͺ*convert PβββΊbinary with leading zeros*/
yy.c= strip( x2b( d2x(p) ),  'L', 0)  /*ͺ*store this particular combination.   */
end   /*ͺ*p*/
/*ͺ* [β]  decreasing partitions is faster*/
do part=c  by -1  for c;      s= 0    /*ͺ*test of a partition add to the arg X.*/
newV3= yy.part;           L= length(newV3)    /*ͺ*obtain one method of partitioning.   */
do cp=L  by -1  for L               /*ͺ*obtain a sum of  a  partition.       */
if substr(newV3,cp,1)  then do;  s= s + newV1.cp            /*ͺ*1 bit?  Then add βββΊS*/
if s==x  then return 0 /*ͺ*Sum equal?  Not weird*/
if s==df then return 0 /*ͺ*Sum = DF?    "    "  */
if s>x   then iterate  /*ͺ*Sum too big? Try next*/
end
end   /*ͺ*cp*/
end   /*ͺ*part*/;           return 1    /*ͺ*no sum equal to  X,  so  X  is weird.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Weird-numbers\weird-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:35
 * -------------------------------------------------------------------------
*/ 
