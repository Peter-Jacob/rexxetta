/*�*REXX program runs  FRACTRAN  for a given set of  fractions  and  from a specified  N. */
numeric digits 999;  d= digits();   w= length(d) /*�*be able to handle gihugeic numbers.  */
parse arg N terms fracs                          /*�*obtain optional arguments from the CL*/
if     N=='' |     N==","  then     N=   2       /*�*Not specified?  Then use the default.*/
if terms=='' | terms==","  then terms= 100       /*�* "      "         "   "   "      "   */
if fracs=''                then fracs= "17/91, 78/85, 19/51, 23/38, 29/33, 77/29, 95/23,",
'77/19, 1/17, 11/13, 13/11, 15/14, 15/2, 55/1'
/*�* [↑]  The default for the fractions. */
f= space(fracs, 0)                               /*�*remove all blanks from the FRACS list*/
do newV4=1  while f\=='';    parse var  f    n.newV4   "/"   d.newV4   ','   f
end   /*�*#*/                  /*�* [↑]  parse all the fractions in list*/
newV4= newV4 - 1                                         /*�*adjust the number of fractions found.*/
tell= terms>0                                    /*�*flag:  show number  or  a power of 2.*/
newV1.= 0;                              newV5= 1         /*�*the default value  for powers of  2. */
if \tell  then do p=1  until length(newV5)>d;                 newV5= newV5 + newV5;              newV1.newV5= 1
if p==1  then newV2.newV5= left('', w + 9)        "2**"left(p, w)    ' '
else newV2.newV5= '(prime' right(p, w)")  2**"left(p, w)    ' '
end   /*�*p*/                       /*�* [↑]  build   powers of 2   tables.  */
L= length(N)                                     /*�*length in decimal digits of integer N*/
say newV4  'fractions:'  fracs                       /*�*display number and actual fractions. */
say 'N  is starting at '  N                      /*�*display the starting number   N.     */
if tell  then say terms  ' terms are being shown:'                     /*�*display header.*/
else say 'only powers of two are being shown:'                /*�*   "       "   */
newV3= '(max digits used:'                          /*�*a literal used in the   SAY   below. */

do j=1  for  abs(terms)                        /*�*perform DO loop once for each  term. */
do k=1  for  newV4                              /*�*   "     "   "    "   "    " fraction*/
if N // d.k \== 0  then iterate             /*�*Not an integer?  Then ignore it.     */
cN= commas(N);                 cj=commas(j) /*�*maybe insert commas into  N.         */
if tell  then say right('term' cj, 44)   "──► "   cN      /*�*display Nth term and N.*/
else if newV1.N  then say right('term' cj,15)  "──►"  newV2.N newV3  right(L,w)")  " cN
N= N  %  d.k  *  n.k                        /*�*calculate next term (use %≡integer ÷)*/
L= max(L, length(N) )                       /*�*the maximum number of decimal digits.*/
leave                                       /*�*go start calculating the next term.  */
end   /*�*k*/                                 /*�* [↑]  if an integer, we found a new N*/
end      /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV6;  do jc=length(newV6)-3  to 1  by -3; newV6=insert(',', newV6, jc); end;  return newV6
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fractran\fractran-2.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
