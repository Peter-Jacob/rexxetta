/*ª*REXX program  demonstrates using    Horner's rule    for   polynomial evaluation.     */
numeric digits 30                                /*ª*use extra numeric precision.         */
parse  arg  x poly                               /*ª*get value of X and the coefficients. */
newV1=                                               /*ª*start with a clean slate equation.   */
do deg=0  until  poly==''                 /*ª*get the equation's coefficients.     */
parse var poly c.deg poly;  c.deg=c.deg/1 /*ª*get equation coefficient & normalize.*/
if c.deg>=0  then c.deg= '+'c.deg         /*ª*if Â¬ negative, then prefix with a  + */
newV1=newV1  c.deg                                /*ª*concatenate it to the equation.      */
if deg\==0 & c.deg\=0  then newV1=newV1'âˆ™x^'deg   /*ª*Â¬1st coefficient & Â¬0?  Append X pow.*/
newV1=newV1 '  '                                  /*ª*insert some blanks, make it look nice*/
end   /*ª*deg*/
say '         x = '   x
say '    degree = '  deg
say '  equation = '   newV1
a=c.deg                                          /*ª*A:  is the accumulator  (or answer). */
do j=deg-1  by -1  for deg;   a=a*x+c.j /*ª*apply Horner's rule to the equations.*/
end   /*ª*j*/
say                                              /*ª*display a blank line for readability.*/
say '    answer = ' a                            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Horners-rule-for-polynomial-evaluation\horners-rule-for-polynomial-evaluation-1.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
