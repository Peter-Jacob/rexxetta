/*�*REXX program finds unique positive integers for ────────── aⁿ+bⁿ+cⁿ+dⁿ==xⁿ  where n=5 */
parse arg L H N .                                /*�*get optional  LOW, HIGH,  #solutions.*/
if L=='' | L==","  then L=   0  + 1              /*�*Not specified?  Then use the default.*/
if H=='' | H==","  then H= 250  - 1              /*�* "      "         "   "   "     "    */
if N=='' | N==","  then N=   1                   /*�* "      "         "   "   "     "    */
w= length(H)                                     /*�*W:  used for display aligned numbers.*/
say center(' 'subword(sourceLine(1), 9, 3)" ", 70 +5*w, '─')  /*�*show title from 1st line*/
numeric digits 1000                              /*�*be able to handle the next expression*/
numeric digits max(9, length(3*H**5) )           /*�* "   "   "    "   3* [H to 5th power]*/
bH= H - 2;                 cH= H - 1             /*�*calculate the upper  DO  loop limits.*/
newV1.= 0                                            /*�* [↓]  define values of  5th  powers. */
do pow=1  for H;    newV2.pow= pow**5;     newV5= newV2.pow;        newV1.newV5= 1;          newV3.newV5= pow
end   /*�*pow*/
newV4.= newV1.
do    j=4   for H-3                       /*�*use the range of:   four  to   cH.   */
do k=j+1  to H;  newV5= newV2.k - newV2.j;  newV4.newV5= 1 /*�*compute the   xⁿ - dⁿ    differences.*/
end   /*�*k*/                            /*�* [↑]  diff. is always positive as k>j*/
end      /*�*j*/                            /*�*define [↑]    5th  power differences.*/
newV6= 0                                             /*�*#:  is the number of solutions found.*/   /*�* [↓]  for N=∞ solutions.*/
do       a=L    to H-3                       /*�*traipse through possible  A  values. */   /*�*◄──done       246 times.*/
do     b=a+1  to bH;      s1= newV2.a + newV2.b    /*�*   "       "        "     B    "     */   /*�*◄──done    30,381 times.*/
do   c=b+1  to cH;      s2= s1  + newV2.c    /*�*   "       "        "     C    "     */   /*�*◄──done 2,511,496 times.*/
if newV4.s2  then do d=c+1  to H;  s= s2+newV2.d /*�*find the appropriate solution.       */
if newV1.s  then call show     /*�*Is it a solution?   Then display it. */
end   /*�*d*/                /*�* [↑]    !.S  is a boolean.           */
end                 /*�*c*/
end                   /*�*b*/
end                     /*�*a*/

if newV6==0  then say "Didn't find a solution.";           exit 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: newV5= left('', 5);     newV6= newV6 + 1               /*�*_:  used as a spacer; bump # counter.*/
say newV5  'solution'   right(newV6, length(N))":"  newV5  'a='right(a, w)   newV5  "b="right(b, w),
newV5  'c='right(c, w)     newV5    "d="right(d, w)     newV5    'x='right(newV3.s, w+1)
if newV6<N  then return                        /*�*return, keep searching for more sols.*/
exit newV6                                     /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Eulers-sum-of-powers-conjecture\eulers-sum-of-powers-conjecture-1.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
