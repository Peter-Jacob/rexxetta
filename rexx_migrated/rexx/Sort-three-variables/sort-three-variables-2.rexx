/*ª*REXX program sorts  three (numeric)  variables  (X, Y, and  Z)  into ascending order. */
numeric digits 1000                              /*ª*handle some pretty gihugic integers. */      /*ª*can be bigger.*/
parse arg x y z .                                /*ª*obtain the three variables from C.L. */
if x=='' | x==","  then x= 77444                 /*ª*Not specified?  Then use the default.*/
if y=='' | y==","  then y=   -12                 /*ª* "      "         "   "   "     "    */
if z=='' | z==","  then z=     0                 /*ª* "      "         "   "   "     "    */
w= max( length(x), length(y), length(z) )   + 5  /*ª*find max width of the values, plus 5.*/
say 'â”€â”€â”€â”€â”€ original values of X, Y, and Z: '       right(x, w)   right(y, w)   right(z, w)
low = x                                          /*ª*assign a temporary variable.         */
mid = y                                          /*ª*   "   "     "        "              */
high= z                                          /*ª*   "   "     "        "              */
x= min(low,  mid,  high)           /*ª*determine the lowest value of X,Y,Z. */      /*ª* â—„â”€â”€â”€ sorting.*/
z= max(low,  mid,  high)           /*ª*    "      "  highest  "    " " " "  */      /*ª* â—„â”€â”€â”€ sorting.*/
y=     low + mid + high - x - z    /*ª*    "      "  middle   "    " " " "  */      /*ª* â—„â”€â”€â”€ sorting.*/
/*ª*stick a fork in it,  we're all done. */
say 'â•â•â•â•â•  sorted  values of X, Y, and Z: '    right(x, w)    right(y, w)    right(z, w)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-three-variables\sort-three-variables-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
