/*ª* REXX **************************************************************
* 04.12.2012 Walter Pachl
**********************************************************************/
digits='0123456789ABCDEF'
Do i=1 To length(digits)
d=substr(digits,i,1)
value.d=i-1
End
Call test '1'
Call test '1234'
Call test 'FE'
Call test 'F0E'
Exit
test:
Parse Arg number
res=right(number,4)
dsum=0
Do While number<>''
Parse Var number d +1 number
dsum=dsum+value.d
End
Say res '->' right(dsum,2)
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sum-digits-of-an-integer\sum-digits-of-an-integer-1.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
