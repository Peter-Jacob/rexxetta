/*�*REXX program demonstrates  Sun Tzu's  (or Sunzi's)  Chinese Remainder  Theorem.       */
parse arg Ns As .                                /*�*get optional arguments from the C.L. */
if Ns=='' | Ns==","  then Ns= '3,5,7'            /*�*Ns not specified?   Then use default.*/
if As=='' | As==","  then As= '2,3,2'            /*�*As  "      "          "   "      "   */
say 'Ns: '  Ns
say 'As: '  As;           say
Ns= space( translate(Ns, , ','));  newV2= words(Ns)  /*�*elide any superfluous blanks from N's*/
As= space( translate(As, , ','));  newV3= words(As)  /*�*  "    "       "        "      "  A's*/
if newV2\==newV3   then do;  say  "size of number sets don't match.";   exit 131;    end
if newV2==0    then do;  say  "size of the  N  set isn't valid.";   exit 132;    end
if newV3==0    then do;  say  "size of the  A  set isn't valid.";   exit 133;    end
N= 1                                             /*�*the product─to─be  for  prod(n.j).   */
do j=1  for newV2                              /*�*process each number for  As  and Ns. */
n.j= word(Ns,j);      N= N * n.j           /*�*get an  N.j  and calculate product.  */
a.j= word(As,j)                            /*�* "   "  A.j  from the  As  list.     */
end   /*�*j*/
newV1.=                                              /*�* [↓]  converts congruences ───► sets.*/
do i=1  for newV2;        newV3= a.i;    newV1.i.newV3= a.i;    p= a.i
do N;  p= p + n.i;  newV1.i.p= p             /*�*build a (array) list of modulo values*/
end   /*�*N*/
end     /*�*i*/
/*�* [↓]  find common number in the sets.*/
do   x=1  for N;  if newV1.1.x==''  then iterate                       /*�*locate a number. */
do v=2  to newV2;   if newV1.v.x==''  then iterate x                     /*�*Is in all sets ? */
end   /*�*v*/
say 'found a solution with X='    x            /*�*display one possible solution.       */
exit 0                                         /*�*stick a fork in it,  we're all done. */
end   /*�*x*/

say 'no solution found.'                         /*�*oops, announce that solution ¬ found.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Chinese-remainder-theorem\chinese-remainder-theorem-2.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
