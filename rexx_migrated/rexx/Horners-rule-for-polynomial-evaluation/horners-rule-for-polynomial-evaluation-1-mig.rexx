/*�*�*REXX program  demonstrates using    Horner's rule    for   polynomial evaluation.     */
numeric digits 30                                /*�*�*use extra numeric precision.         */
parse  arg  x poly                               /*�*�*get value of X and the coefficients. */
newV1=                                               /*�*�*start with a clean slate equation.   */
do deg=0  until  poly==''                 /*�*�*get the equation's coefficients.     */
parse var poly c.deg poly;  c.deg=c.deg/1 /*�*�*get equation coefficient & normalize.*/
if c.deg>=0  then c.deg= '+'c.deg         /*�*�*if ¬ negative, then prefix with a  + */
newV1=newV1  c.deg                                /*�*�*concatenate it to the equation.      */
if deg\==0 & c.deg\=0  then newV1=newV1'∙x^'deg   /*�*�*¬1st coefficient & ¬0?  Append X pow.*/
newV1=newV1 '  '                                  /*�*�*insert some blanks, make it look nice*/
end   /*�*�*deg*/
say '         x = '   x
say '    degree = '  deg
say '  equation = '   newV1
a=c.deg                                          /*�*�*A:  is the accumulator  (or answer). */
do j=deg-1  by -1  for deg;   a=a*x+c.j /*�*�*apply Horner's rule to the equations.*/
end   /*�*�*j*/
say                                              /*�*�*display a blank line for readability.*/
say '    answer = ' a                            /*�*�*stick a fork in it,  we're all done. */
/*�* -------------------------------------------------------------------------
* REXX C:\Users\PeterJ\rexxetta\rexx\Horners-rule-for-polynomial-evaluation/horners-rule-for-polynomial-evaluation-1.rexx was migrated on 22 Mar 2025 at 19:42:59
* -------------------------------------------------------------------------
*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Horners-rule-for-polynomial-evaluation\horners-rule-for-polynomial-evaluation-1-mig.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
