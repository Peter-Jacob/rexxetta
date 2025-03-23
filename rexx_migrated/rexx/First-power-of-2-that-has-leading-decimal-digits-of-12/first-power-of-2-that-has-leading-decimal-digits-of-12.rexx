/*�*REXX program computes powers of two whose leading decimal digits are "12" (in base 10)*/
parse arg L n b .                                /*�*obtain optional arguments from the CL*/
if L=='' | L=="," then L= 12                     /*�*Not specified?  Then use the default.*/
if n=='' | n=="," then n=  1                     /*�* "      "         "   "   "     "    */
if b=='' | b=="," then b=  2                     /*�* "      "         "   "   "     "    */
LL= length(L)                                    /*�*obtain the length of  L  for compares*/
fd=   left(L, 1)                                 /*�*obtain the first   dec. digit  of  L.*/
fr= substr(L, 2)                                 /*�*   "    "  rest of dec. digits  "  " */
numeric digits max(20, LL+2)                     /*�*use an appropriate value of dec. digs*/
rest= LL - 1                                     /*�*the length of the rest of the digits.*/
newV2= 0                                             /*�*the number of occurrences of a result*/
x= 1                                             /*�*start with a product of unity (B**0).*/
do j=1  until newV2==n;        x= x * b         /*�*raise  B  to a whole bunch of powers.*/
parse var x newV3 2                             /*�*obtain the first decimal digit of  X.*/
if newV3 \== fd  then iterate                   /*�*check only the 1st digit at this time*/
if LL>1  then do                            /*�*check the rest of the digits, maybe. */
newV4= format(x, , , , 0)         /*�*express  X  in exponential format.   */
parse var newV4 '.' +1 f newV1  /*�*obtain the rest of the digits.       */
if f \== fr  then iterate     /*�*verify that  X  has the rest of digs.*/
end                           /*�* [↓] found an occurrence of an answer*/
newV2= newV2 + 1                                    /*�*bump the number of occurrences so far*/
end   /*�*j*/

say 'The '  th(n)  ' occurrence of '   b  ' raised to a power whose product starts with' ,
' "'L"'"       ' is '        commas(j).
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: arg newV3;     do c=length(newV3)-3  to 1  by -3;  newV3= insert(',', newV3, c);  end;    return newV3
th:     arg newV3;  return newV3 || word('th st nd rd', 1 +newV3//10 * (newV3//100 % 10\==1) * (newV3//10 <4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\First-power-of-2-that-has-leading-decimal-digits-of-12\first-power-of-2-that-has-leading-decimal-digits-of-12.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
