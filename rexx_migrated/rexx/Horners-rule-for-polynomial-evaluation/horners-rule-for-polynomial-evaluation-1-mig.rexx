/*ª*ª*REXX program  demonstrates using    Horner's rule    for   polynomial evaluation.     */
numeric digits 30                                /*ª*ª*use extra numeric precision.         */
parse  arg  x poly                               /*ª*ª*get value of X and the coefficients. */
newV1=                                               /*ª*ª*start with a clean slate equation.   */
do deg=0  until  poly==''                 /*ª*ª*get the equation's coefficients.     */
parse var poly c.deg poly;  c.deg=c.deg/1 /*ª*ª*get equation coefficient & normalize.*/
if c.deg>=0  then c.deg= '+'c.deg         /*ª*ª*if Â¬ negative, then prefix with a  + */
newV1=newV1  c.deg                                /*ª*ª*concatenate it to the equation.      */
if deg\==0 & c.deg\=0  then newV1=newV1'âˆ™x^'deg   /*ª*ª*Â¬1st coefficient & Â¬0?  Append X pow.*/
newV1=newV1 '  '                                  /*ª*ª*insert some blanks, make it look nice*/
end   /*ª*ª*deg*/
say '         x = '   x
say '    degree = '  deg
say '  equation = '   newV1
a=c.deg                                          /*ª*ª*A:  is the accumulator  (or answer). */
do j=deg-1  by -1  for deg;   a=a*x+c.j /*ª*ª*apply Horner's rule to the equations.*/
end   /*ª*ª*j*/
say                                              /*ª*ª*display a blank line for readability.*/
say '    answer = ' a                            /*ª*ª*stick a fork in it,  we're all done. */
/*ª* -------------------------------------------------------------------------
* REXX C:\Users\PeterJ\rexxetta\rexx\Horners-rule-for-polynomial-evaluation/horners-rule-for-polynomial-evaluation-1.rexx was migrated on 22 Mar 2025 at 19:42:59
* -------------------------------------------------------------------------
*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Horners-rule-for-polynomial-evaluation\horners-rule-for-polynomial-evaluation-1-mig.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
