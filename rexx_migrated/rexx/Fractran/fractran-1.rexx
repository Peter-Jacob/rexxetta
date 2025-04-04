/*ͺ*REXX program runs  FRACTRAN  for a given set of  fractions  and  from a specified  N. */
numeric digits 2000                              /*ͺ*be able to handle larger numbers.    */
parse arg N terms fracs                          /*ͺ*obtain optional arguments from the CL*/
if     N=='' |     N==","  then     N=   2       /*ͺ*Not specified?  Then use the default.*/
if terms=='' | terms==","  then terms= 100       /*ͺ* "      "         "   "   "      "   */
if fracs=''                then fracs= "17/91, 78/85, 19/51, 23/38, 29/33, 77/29, 95/23,",
'77/19, 1/17, 11/13, 13/11, 15/14, 15/2, 55/1'
/*ͺ* [β]  The default for the fractions. */
f= space(fracs, 0)                               /*ͺ*remove all blanks from the FRACS list*/
do newV1=1  while f\=='';    parse var  f   n.newV1   "/"   d.newV1   ','   f
end   /*ͺ*#*/                  /*ͺ* [β]  parse all the fractions in list*/
newV1= newV1 - 1                                         /*ͺ*the number of fractions just found.  */
say newV1   'fractions:'   fracs                     /*ͺ*display number and actual fractions. */
say 'N  is starting at '   N                     /*ͺ*display the starting number  N.      */
say terms   ' terms are being shown:'            /*ͺ*display a kind of header/title.      */

do    j=1  for  terms                        /*ͺ*perform the DO loop for each   term. */
do k=1  for  newV1                            /*ͺ*   "     "   "   "   "    "  fraction*/
if N // d.k \== 0  then iterate           /*ͺ*Not an integer?  Then ignore it.     */
cN= commas(N);     L= length(cN)          /*ͺ*maybe insert commas into N;  get len.*/
say right('term' commas(j), 44) "βββΊ " right(cN, max(15, L))  /*ͺ*show Nth term & N*/
N= N  %  d.k  *  n.k                      /*ͺ*calculate next term (use %β‘integer Γ·)*/
leave                                     /*ͺ*go start calculating the next term.  */
end   /*ͺ*k*/                               /*ͺ* [β]  if an integer, we found a new N*/
end      /*ͺ*j*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV2;  do jc=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, jc); end;  return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fractran\fractran-1.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
