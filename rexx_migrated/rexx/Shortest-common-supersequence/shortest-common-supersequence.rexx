/*ª*REXX program finds the  Shortest common supersequence (SCS)  of two character strings.*/
parse arg u v .                                  /*ª*obtain optional arguments from the CL*/
if u=='' | u==","  then u= 'abcbdab'             /*ª*Not specified?  Then use the default.*/
if v=='' | v==","  then v= 'bdcaba'              /*ª* "      "         "   "   "     "    */
say '                     string u='  u          /*ª*echo the value of string  U  to term.*/
say '                     string v='  v          /*ª*  "   "    "    "    "    V   "   "  */
newV1= u                                             /*ª*define initial value for the output. */
do n=1    to length(u)                     /*ª*process the whole length of string U.*/
do m=n  to length(v) - 1                 /*ª*   "    rightâ”€ish  part   "    "   V.*/
p= pos( substr(v, m, 1), newV1)              /*ª*position of mTH  V  char in $ string.*/
newV2= substr(v, m+1, 1)                     /*ª*obtain a single character of string V*/
if p\==0  &  newV2\==substr(newV1, p+1, 1)  then newV1= insert(newV2, newV1, p)
end   /*ª*m*/                              /*ª* [â†‘]  insert _ in $ after position P.*/
end     /*ª*n*/
say
say 'shortest common supersequence='  newV1          /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Shortest-common-supersequence\shortest-common-supersequence.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
