/*ช*REXX program finds proper divisors (and count) of integer ranges; finds the max count.*/
parse arg bot top inc range xtra                 /*ช*obtain optional arguments from the CL*/
if   bot=='' |   bot==","  then    bot=     1    /*ช*Not specified?  Then use the default.*/
if   top=='' |   top==","  then    top=    10    /*ช* "      "         "   "   "     "    */
if   inc=='' |   inc==","  then    inc=     1    /*ช* "      "         "   "   "     "    */
if range=='' | range==","  then  range= 20000    /*ช* "      "         "   "   "     "    */
w= max( length(top), length(bot), length(range)) /*ช*determine the biggest number of these*/
numeric digits max(9, w + 1)                     /*ช*have enough digits for  //  operator.*/
newV1.= 'and'                                        /*ช*a literal used to separate #s in list*/
do n=bot  to top  by inc                   /*ช*process the first range specified.   */
q= Pdivs(n);    newV2= words(q)                /*ช*get proper divs; get number of Pdivs.*/
if q=='โ'  then newV2= q                       /*ช*adjust number of Pdivisors for zero. */
say right(n, max(20, w) )   'has'   center(newV2, 4)     "proper divisors: "    q
end   /*ช*n*/
m= 0                                             /*ช*M โก maximum number of Pdivs (so far).*/
do r=1  for range;    q= Pdivs(r)          /*ช*process the second range specified.  */
newV2= words(q);          if newV2<m  then iterate /*ช*get proper divs; get number of Pdivs.*/
if newV2<m  then iterate                       /*ช*Less then max?   Then ignore this #. */
newV1.newV2= newV1.newV2  newV1.  r;      m=newV2                  /*ช*add this Pdiv to max list; set new M.*/
end   /*ช*r*/                                /*ช* [โ]   process 2nd range of integers.*/
say
say m  ' is the highest number of proper divisors in range 1โโโบ'range,
", and it's for: "       subword(newV1.m, 3)
say                                              /*ช* [โ]  handle any given extra numbers.*/
do i=1  for words(xtra);  n= word(xtra, i) /*ช*obtain an extra number from XTRA list*/
w= max(w, 1 + length(n) )                  /*ช*use maximum width for aligned output.*/
numeric digits max(9, 1 + length(n) )      /*ช*have enough digits for  //  operator.*/
q= Pdivs(n);              newV2= words(q)      /*ช*get proper divs; get number of Pdivs.*/
say  right(n, max(20, w) )     'has'     center(newV2, 4)      "proper divisors."
end   /*ช*i*/                                /*ช* [โ] support extra specified integers*/
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
Pdivs: procedure; parse arg x,b;  x= abs(x);   if x==1  then return ''          /*ช*unity?*/
odd= x // 2;                            if x==0  then return 'โ'         /*ช*zero ?*/
a= 1                                      /*ช* [โ]  use all, or only odd #s.    ___*/
do j=2+odd  by 1+odd  while j*j < x   /*ช*divide by some integers up to    โ X */
if x//j==0  then do;  a=a j;  b=x%j b /*ช*if รท, add both divisors to ฮฑ & ร.    */
end
end   /*ช*j*/                           /*ช* [โ]  %  is the REXX integer division*/
/*ช* [โ]  adjust for a square.        ___*/
if j*j==x  then  return  a j b            /*ช*Was  X  a square?    If so, add  โ X */
return  a   b            /*ช*return the divisors  (both lists).   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Proper-divisors\proper-divisors-2.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
