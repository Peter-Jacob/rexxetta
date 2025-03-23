/*�*REXX program determines  if  a list < previous list,   and returns   true  or  false. */
newV1.=;                    newV1.1 = 1 2 1 5 2
newV1.2 = 1 2 1 5 2 2
newV1.3 = 1 2 3 4 5
newV1.4 = 1 2 3 4 5
/*�* [↓]  compare a list to previous list*/
do j=2  while  newV1.j\=='';      p= j - 1  /*�*P:  points to previous value in list.*/
if FNorder(newV1.p, newV1.j)=='true'  then is= " < "       /*�*use a more familiar glyph.*/
else is= " ≥ "       /*�* "  "   "      "      "   */
say
say right('['newV1.p"]", 40)  is  '['newV1.j"]"
end   /*�*i*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
FNorder: procedure;  parse arg x,y
wx= words(x);     wy= words(y)
do k=1  for min(wx, wy)
a= word(x, k)         /*�*get a value from X. */
b= word(y, k)         /*�* "  "   "     "  Y. */
if a<b  then                return 'true'
else  if a>b  then  return 'false'
end   /*�*k*/
if wx<wy  then return 'true'                  /*�*handle case of equal (so far). */
return 'false'                 /*�*   "     "   "   "     "   "   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Order-two-numerical-lists\order-two-numerical-lists.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
