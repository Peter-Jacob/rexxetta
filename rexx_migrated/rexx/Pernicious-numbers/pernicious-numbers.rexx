/*�*REXX program computes and displays a number (and also a range) of  pernicious numbers.*/
numeric digits 100                               /*�*be able to handle large numbers.     */
parse arg N L H .                                /*�*obtain optional arguments from the CL*/
if N=='' | N==','  then N=25                     /*�*N  not given?  Then use the default. */
if L=='' | L==','  then L=888888877              /*�*L   "    "       "   "   "     "     */
if H=='' | H==','  then H=888888888              /*�*H   "    "       "   "   "     "     */
say 'The 1st '   N    " pernicious numbers are:" /*�*display a nice title for the numbers.*/
say  pernicious(1,,N)                            /*�*get all pernicious # from  1 ─~─► N. */
say                                              /*�*display a blank line for a separator.*/
say 'Pernicious numbers between '      L       " and "       H        ' (inclusive) are:'
say  pernicious(L,H)                             /*�*get all pernicious # from  L ───► H. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pernicious: procedure;  parse arg bot,top,lim    /*�*obtain the bot and top numbers, limit*/
p='2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101'
newV1.=0
do k=1    until  newV2==''         /*�*examine the  list of some low primes.*/
newV2=word(p, k);  newV1.newV2=1           /*�*generate an array  "   "   "     "   */
end   /*�*k*/
newV3=                                   /*�*list of pernicious numbers (so far). */
if m==''    then   m=999999999       /*�*Not given?  Then use a gihugic limit.*/
if top==''  then top=999999999       /*�* "    "       "   "  "    "      "   */
newV4=0                                  /*�*number of pernicious numbers (so far)*/
do j=bot  to top  until newV4==lim /*�*generate pernicious #s 'til satisfied*/
pc=popCount(j)                 /*�*obtain the population count for   J. */
if \newV1.pc  then iterate         /*�*if popCount not in @.prime,  skip it.*/
newV3=newV3 j                          /*�*append a pernicious number  to list. */
newV4=newV4+1                          /*�*bump the pernicious number  count.   */
end   /*�*j*/
return substr(newV3, 2)                  /*�*return the results,  sans 1st blank. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
popCount:   return length( space( translate( x2b( d2x(arg(1))) +0,, 0), 0)) /*�*count 1's.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pernicious-numbers\pernicious-numbers.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
