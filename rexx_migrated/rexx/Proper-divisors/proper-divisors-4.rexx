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
iSqrt: procedure; parse arg x;  r=0;  q=1;             do while q<=x;  q=q*4;  end
do while q>1; q=q%4; newV3=x-r-q; r=r%2; if newV3>=0 then do;x=newV3;r=r+q; end; end
return r
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Pdivs: procedure; parse arg x,b;  x= abs(x)
if x==1  then return ''                    /*�*null set.*/
if x==0  then return '∞'                   /*�*infinity.*/
odd= x // 2                               /*�*oddness of  X.        ___            */
r= iSqrt(x)                               /*�* obtain the integer  √ X             */
a= 1                                      /*�* [↓]  use all,  or only odd numbers. */
/*�*                                  ___*/
if odd then do j=3  by 2 for r%2-(r*r==x) /*�*divide by some integers up to    √ X */
if x//j==0  then do;  a=a j; b=x%j b /*�*÷?  Add both divisors to A & B*/
end
end   /*�*j*/                   /*�*                                  ___*/
else do j=2       for r-1-(r*r==x) /*�*divide by some integers up to    √ X */
if x//j==0  then do;  a=a j; b=x%j b /*�*÷?  Add both divisors to A & B*/
end
end   /*�*j*/
if r*r==x  then  return  a j b            /*�*Was  X  a square?    If so, add  √ X */
return  a   b            /*�*return proper divisors  (both lists).*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Proper-divisors\proper-divisors-4.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
