/*ͺ*REXX program finds proper divisors (and count) of integer ranges; finds the max count.*/
parse arg bot top inc range xtra                 /*ͺ*obtain optional arguments from the CL*/
if   bot=='' |   bot==","  then    bot=     1    /*ͺ*Not specified?  Then use the default.*/
if   top=='' |   top==","  then    top=    10    /*ͺ* "      "         "   "   "     "    */
if   inc=='' |   inc==","  then    inc=     1    /*ͺ* "      "         "   "   "     "    */
if range=='' | range==","  then  range= 20000    /*ͺ* "      "         "   "   "     "    */
w= max( length(top), length(bot), length(range)) /*ͺ*determine the biggest number of these*/
numeric digits max(9, w + 1)                     /*ͺ*have enough digits for  //  operator.*/
newV1.= 'and'                                        /*ͺ*a literal used to separate #s in list*/
do n=bot  to top  by inc                   /*ͺ*process the first range specified.   */
q= Pdivs(n);    newV2= words(q)                /*ͺ*get proper divs; get number of Pdivs.*/
if q=='β'  then newV2= q                       /*ͺ*adjust number of Pdivisors for zero. */
say right(n, max(20, w) )   'has'   center(newV2, 4)     "proper divisors: "    q
end   /*ͺ*n*/
m= 0                                             /*ͺ*M β‘ maximum number of Pdivs (so far).*/
do r=1  for range;    q= Pdivs(r)          /*ͺ*process the second range specified.  */
newV2= words(q);          if newV2<m  then iterate /*ͺ*get proper divs; get number of Pdivs.*/
if newV2<m  then iterate                       /*ͺ*Less then max?   Then ignore this #. */
newV1.newV2= newV1.newV2  newV1.  r;      m=newV2                  /*ͺ*add this Pdiv to max list; set new M.*/
end   /*ͺ*r*/                                /*ͺ* [β]   process 2nd range of integers.*/
say
say m  ' is the highest number of proper divisors in range 1βββΊ'range,
", and it's for: "       subword(newV1.m, 3)
say                                              /*ͺ* [β]  handle any given extra numbers.*/
do i=1  for words(xtra);  n= word(xtra, i) /*ͺ*obtain an extra number from XTRA list*/
w= max(w, 1 + length(n) )                  /*ͺ*use maximum width for aligned output.*/
numeric digits max(9, 1 + length(n) )      /*ͺ*have enough digits for  //  operator.*/
q= Pdivs(n);              newV2= words(q)      /*ͺ*get proper divs; get number of Pdivs.*/
say  right(n, max(20, w) )     'has'     center(newV2, 4)      "proper divisors."
end   /*ͺ*i*/                                /*ͺ* [β] support extra specified integers*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Pdivs: procedure; parse arg x 1 z,b;  x= abs(x);   if x==1  then return ''      /*ͺ*unity?*/
odd= x // 2;                                if x==0  then return 'β'     /*ͺ*zero ?*/
r= 0;         q= 1                        /*ͺ* [β] ββinteger square rootββ     ___ */
do while q<=z; q=q*4; end            /*ͺ*R:  an integer which will be    β X  */
do while q>1;  q=q%4; newV3= z-r-q;  r=r%2;  if newV3>=0  then  do;  z=newV3;  r=r+q;  end
end   /*ͺ*while q>1*/                  /*ͺ* [β]  compute the integer sqrt of  X.*/
a=1                                       /*ͺ* [β]  use all, or only odd #s.   ___ */
do j=2 +odd  by 1 +odd to r -(r*r==x) /*ͺ*divide by some integers up to   β X  */
if x//j==0  then do;  a=a j;  b=x%j b /*ͺ*if Γ·, add both divisors to Ξ± & Γ.    */
end
end   /*ͺ*j*/                           /*ͺ* [β]  %  is the REXX integer division*/
/*ͺ* [β]  adjust for a square.        ___*/
if j*j==x  then  return  a j b            /*ͺ*Was  X  a square?    If so, add  β X */
return  a   b            /*ͺ*return the divisors  (both lists).   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Proper-divisors\proper-divisors-3.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
