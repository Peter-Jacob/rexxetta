/*�*REXX program calculates and displays the  modular inverse  of an integer  X  modulo Y.*/
parse arg x y .                                  /*�*obtain two integers from the C.L.    */
if x=='' | x==","  then x=   42                  /*�*Not specified?  Then use the default.*/
if y=='' | y==","  then y= 2017                  /*�* "      "         "   "   "     "    */
say  'modular inverse of '      x       " by "       y        ' ───► '         modInv(x,y)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
modInv: parse arg a,b 1 ob;     z= 0             /*�*B & OB are obtained from the 2nd arg.*/
newV1= 1                                     /*�*initialize modular inverse to unity. */
if b\=1  then do  while a>1
parse value   a/b  a//b  b  z       with      q  b  a  t
z= newV1  -  q * z
newV1= trunc(t)
end   /*�*while*/

if newV1<0  then newV1= newV1 + ob                   /*�*Negative?  Then add the original  B. */
return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Modular-inverse\modular-inverse.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
