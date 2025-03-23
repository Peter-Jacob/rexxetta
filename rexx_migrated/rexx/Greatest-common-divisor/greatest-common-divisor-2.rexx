/*ª* REXX ***************************************************************
* using PL/I code extended to many arguments
* 17.08.2012 Walter Pachl
* 18.08.2012 gcd(0,0)=0
**********************************************************************/
numeric digits 300                  /*ª*handle up to 300 digit numbers.*/
Call test  7,21     ,'7 '
Call test  4,7      ,'1 '
Call test 24,-8     ,'8'
Call test 55,0      ,'55'
Call test 99,15     ,'3 '
Call test 15,10,20,30,55,'5'
Call test 496,8128  ,'16'
Call test 496,8128  ,'8'            /*ª* test wrong expectation        */
Call test 0,0       ,'0'            /*ª* by definition                 */
Exit

test:
/*ª**********************************************************************
* Test the gcd function
**********************************************************************/
n=arg()                             /*ª* Number of arguments           */
gcde=arg(n)                         /*ª* Expected result               */
gcdx=gcd(arg(1),arg(2))             /*ª* gcd of the first 2 numbers    */
Do i=2 To n-2                       /*ª* proceed with all the others   */
If arg(i+1)<>0 Then
gcdx=gcd(gcdx,arg(i+1))
End
If gcdx=arg(arg()) Then             /*ª* result is as expected         */
tag='as expected'
Else                                /*ª* result is not correct         */
Tag='*** wrong. expected:' gcde
numbers=arg(1)                      /*ª* build string to show the input*/
Do i=2 To n-1
numbers=numbers 'and' arg(i)
End
say left('the GCD of' numbers 'is',45) right(gcdx,3) tag
Return

GCD: procedure
/*ª**********************************************************************
* Recursive procedure as shown in PL/I
**********************************************************************/
Parse Arg a,b
if b = 0 then return abs(a)
return GCD(b,a//b)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Greatest-common-divisor\greatest-common-divisor-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
