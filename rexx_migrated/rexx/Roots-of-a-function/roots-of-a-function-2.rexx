/*�*REXX program finds the roots of a specific function:  x^3 - 3*x^2 + 2*x  via bisection*/
parse arg bot top inc .                          /*�*obtain optional arguments from the CL*/
if bot=='' | bot==","  then bot= -5              /*�*Not specified?  Then use the default.*/
if top=='' | top==","  then top= +5              /*�* "       "        "   "   "     "    */
if inc=='' | inc==","  then inc=   .0001         /*�* "       "        "   "   "     "    */
x= bot - inc                                     /*�*compute 1st value to start compares. */
z= x * (x * (x-3) + 2)                           /*�*formula used   ──► x^3 - 3x^2  + 2x  */
newV1= sign(z)                                       /*�*obtain the sign of the initial value.*/
do x=bot  to top  by  inc             /*�*traipse through the specified range. */
z= x * (x * (x-3) + 2);    newV2= sign(z) /*�*compute new value;  obtain the sign. */
if z=0  then                               say  'found an exact root at'   x/1
else if newV1\==newV2  then if newV1\==0  then say  'passed a root at'         x/1
newV1= newV2                                  /*�*use the new sign for the next compare*/
end   /*�*x*/                           /*�*dividing by unity normalizes X  [↑]  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Roots-of-a-function\roots-of-a-function-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
