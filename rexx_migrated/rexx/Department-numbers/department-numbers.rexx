/*�*REXX program finds/displays all possible variants of (3) department numbering  puzzle.*/
say 'police sanitation fire'                     /*�*display simple title   for the output*/
say '══════ ══════════ ════'                     /*�*   "     head separator "   "    "   */
newV1=0                                              /*�*number of solutions found  (so far). */
do     p=1  for 7;     if p//2  then iterate /*�*try numbers for the police department*/
do   s=1  for 7;     if s==p  then iterate /*�* "     "     "   "  fire        "    */
do f=1  for 7;     if f==s  then iterate /*�* "     "     "   "  sanitation  "    */
if p + s + f \== 12         then iterate /*�*check if sum of department nums ¬= 12*/
newV1= newV1 + 1                                 /*�*bump count of the number of solutions*/
say center(p,6) center(s,10) center(f,4) /*�*display one possible solution.       */
end   /*�*s*/
end     /*�*f*/
end       /*�*p*/

say '══════ ══════════ ════'                     /*�*   "     head separator "   "    "   */
say                                              /*�*stick a fork in it,  we're all done. */
say newV1  ' solutions found.'                       /*�*also, show the # of solutions found. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Department-numbers\department-numbers.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
