/*ª*REXX pgm (pathological FP problem):  a sequence that might converge to a wrong limit. */
parse arg digs show .                            /*ª*obtain optional arguments from the CL*/
if digs=='' | digs==","  then digs= 150          /*ª*Not specified?  Then use the default.*/
if show=='' | show==","  then show=  20          /*ª* "      "         "   "   "     "    */
numeric digits digs                              /*ª*have REXX use "digs" decimal digits. */
newV1= 2 4 5 6 7 8 9 20 30 50 100                    /*ª*the indices to display value of  V.n */
fin= word(newV1, words(newV1) )                          /*ª*find the last (largest) index number.*/
w= length(fin)                                   /*ª*  "   "  length (in dec digs) of FIN.*/
v.1= 2                                           /*ª*the value of the first   V  element. */
v.2=-4                                           /*ª* "    "    "  "  second  "     "     */
do n=3  to fin;   nm1= n-1;     nm2= n-2   /*ª*compute some values of the V elements*/
v.n= 111 - 1130/v.nm1 + 3000/(v.nm1*v.nm2) /*ª*   "      a  value  of  a  " element.*/
/*ª*display digs past the dec. pointâ”€â”€â”€â” */
if wordpos(n, newV1)\==0  then say   'v.'left(n, w)       "="        format(v.n, , show)
end   /*ª*n*/                                /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pathological-floating-point-problems\pathological-floating-point-problems-1.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
