/*ª* Rexx ***************************************************
* 09.04.2013 Walter Pachl
* Implements the task's description in a rather concise way
* Instead of reverting the ccn work it backwards
**********************************************************/
numeric digits 20

push 49927398716
push 49927398717
push 1234567812345678
push 1234567812345670

do while queued() > 0
parse pull ccnum
if luhn(ccnum) then ln = 'passed'
else                ln = 'failed'
say right(ccnum, 20) ln
end
return
exit

luhn:
Parse Arg ccn                /*ª* credit card number       */
sum=0                        /*ª* initialize test sum      */
even=0                       /*ª* even indicator           */
Do i=length(ccn) To 1 By -1  /*ª* process all digits       */
c=substr(ccn,i,1)          /*ª* pick one digit at a time */
If even Then Do            /*ª* even numbered digit      */
c=c*2                    /*ª* double it                */
If c>=10 Then            /*ª* 10, 12, 14, 16, 18       */
c=c-9                  /*ª* Sum of the two digits    */
End                      /*ª* end of even numbered     */
even=\even                 /*ª* flip even indicator      */
sum=sum+c                  /*ª* add into test sum        */
End
Return right(sum,1)=0        /*ª* ok if last digit is 0    */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Luhn-test-of-credit-card-numbers\luhn-test-of-credit-card-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
