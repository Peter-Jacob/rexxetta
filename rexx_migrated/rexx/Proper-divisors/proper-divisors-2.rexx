/*�*REXX program finds proper divisors (and count) of integer ranges; finds the max count.*/
parse arg bot top inc range xtra                 /*�*obtain optional arguments from the CL*/
if   bot=='' |   bot==","  then    bot=     1    /*�*Not specified?  Then use the default.*/
if   top=='' |   top==","  then    top=    10    /*�* "      "         "   "   "     "    */
if   inc=='' |   inc==","  then    inc=     1    /*�* "      "         "   "   "     "    */
if range=='' | range==","  then  range= 20000    /*�* "      "         "   "   "     "    */
w= max( length(top), length(bot), length(range)) /*�*determine the biggest number of these*/
numeric digits max(9, w + 1)                     /*�*have enough digits for  //  operator.*/
newV1.= 'and'                                        /*�*a literal used to separate #s in list*/
do n=bot  to top  by inc                   /*�*process the first range specified.   */
q= Pdivs(n);    newV2= words(q)                /*�*get proper divs; get number of Pdivs.*/
if q=='∞'  then newV2= q                       /*�*adjust number of Pdivisors for zero. */
say right(n, max(20, w) )   'has'   center(newV2, 4)     "proper divisors: "    q
end   /*�*n*/
m= 0                                             /*�*M ≡ maximum number of Pdivs (so far).*/
do r=1  for range;    q= Pdivs(r)          /*�*process the second range specified.  */
newV2= words(q);          if newV2<m  then iterate /*�*get proper divs; get number of Pdivs.*/
if newV2<m  then iterate                       /*�*Less then max?   Then ignore this #. */
newV1.newV2= newV1.newV2  newV1.  r;      m=newV2                  /*�*add this Pdiv to max list; set new M.*/
end   /*�*r*/                                /*�* [↑]   process 2nd range of integers.*/
say
say m  ' is the highest number of proper divisors in range 1──►'range,
", and it's for: "       subword(newV1.m, 3)
say                                              /*�* [↓]  handle any given extra numbers.*/
do i=1  for words(xtra);  n= word(xtra, i) /*�*obtain an extra number from XTRA list*/
w= max(w, 1 + length(n) )                  /*�*use maximum width for aligned output.*/
numeric digits max(9, 1 + length(n) )      /*�*have enough digits for  //  operator.*/
q= Pdivs(n);              newV2= words(q)      /*�*get proper divs; get number of Pdivs.*/
say  right(n, max(20, w) )     'has'     center(newV2, 4)      "proper divisors."
end   /*�*i*/                                /*�* [↑] support extra specified integers*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Pdivs: procedure; parse arg x,b;  x= abs(x);   if x==1  then return ''          /*�*unity?*/
odd= x // 2;                            if x==0  then return '∞'         /*�*zero ?*/
a= 1                                      /*�* [↓]  use all, or only odd #s.    ___*/
do j=2+odd  by 1+odd  while j*j < x   /*�*divide by some integers up to    √ X */
if x//j==0  then do;  a=a j;  b=x%j b /*�*if ÷, add both divisors to α & ß.    */
end
end   /*�*j*/                           /*�* [↑]  %  is the REXX integer division*/
/*�* [↓]  adjust for a square.        ___*/
if j*j==x  then  return  a j b            /*�*Was  X  a square?    If so, add  √ X */
return  a   b            /*�*return the divisors  (both lists).   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Proper-divisors\proper-divisors-2.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
