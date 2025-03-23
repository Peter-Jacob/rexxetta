/*�*REXX program  validates  credit card numbers  using  the    Luhn    algorithm.        */
newV1.=;                newV1.1= 49927398716             /*�*the  1st  sample credit card number. */
newV1.2= 49927398717             /*�* "   2nd     "      "     "     "    */
newV1.3= 1234567812345678        /*�* "   3rd     "      "     "     "    */
newV1.4= 1234567812345670        /*�* "   4th     "      "     "     "    */
do k=1  while newV1.k\==''                     /*�*validate all the credit card numbers.*/
say right( Luhn(newV1.k), 9)          ' the Luhn test, credit card number: '    newV1.k
end   /*�*k*/                                /*�* [↑] function returns passed│flunked.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Luhn: procedure;  parse arg x;              newV2= 0 /*�*get credit card number;  zero $ sum. */
y= reverse( left(0, length(x) // 2)x)      /*�*add leading zero if needed, reverse. */
do j=1  to length(y)-1  by 2;                newV3= substr(y, j+1, 1) * 2
newV2= newV2 + substr(y, j, 1) + left(newV3, 1) + substr(newV3, 2, 1, 0)     /*�* ◄────────┐*/
end   /*�*j*/                       /*�*sum odd and even decimal digits ►────┘*/
return word('passed flunked',1+(newV2//10==0)) /*�*$ ending in zero?  Then the # passed.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Luhn-test-of-credit-card-numbers\luhn-test-of-credit-card-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
