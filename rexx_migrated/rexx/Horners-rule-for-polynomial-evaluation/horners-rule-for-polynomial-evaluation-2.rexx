/*ª* REXX ---------------------------------------------------------------
* 27.07.2012 Walter Pachl
*            coefficients reversed to descending order of power
*            I'm used to x**2+x-3
*            equation formatting prettified (coefficients 1 and 0)
*--------------------------------------------------------------------*/
Numeric Digits 30                /*ª* use extra numeric precision.   */
Parse Arg x poly                 /*ª* get value of x and coefficients*/
rpoly=''
Do p=0 To words(poly)-1
rpoly=rpoly word(poly,words(poly)-p)
End
poly=rpoly
equ=''                           /*ª* start with equation clean slate*/
deg=words(poly)-1
pdeg=deg
Do Until deg<0                   /*ª* get the equation's coefficients*/
Parse Var poly c.deg poly      /*ª* in descending order of powers  */
c.deg=c.deg+0                  /*ª* normalize it                   */
If c.deg>0 & deg<pdeg Then     /*ª* positive and not first term    */
prefix='+'                   /*ª*  prefix a + sign.              */
Else prefix=''
Select
When deg=0 Then term=c.deg
When deg=1 Then
If c.deg=1 Then term='x'
Else term=c.deg'*x'
Otherwise
If c.deg=1 Then term='x^'deg
Else term=c.deg'*x^'deg
End
If c.deg<>0 Then               /*ª* build up the equation          */
equ=equ||prefix||term
deg=deg-1
End
a=c.pdeg
Do p=pdeg To 1 By -1             /*ª* apply Horner's rule.           */
pm1=p-1
a=a*x+c.pm1
End
Say '        x = ' x
Say '   degree = ' pdeg
Say ' equation = ' equ
Say ' '
Say '   result = ' a
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Horners-rule-for-polynomial-evaluation\horners-rule-for-polynomial-evaluation-2.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
