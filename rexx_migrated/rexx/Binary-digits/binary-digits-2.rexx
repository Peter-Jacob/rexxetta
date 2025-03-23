/*�*REXX program to  convert  several  decimal numbers  to  binary  (or base 2).          */
newV1.=;             newV1.1=    0
newV1.2=    5
newV1.3=   50
newV1.4= 9000

do j=1  while  newV1.j\==''                        /*�*compute until a  NULL value is found.*/
y=strip( x2b( d2x( newV1.j )), 'L', 0)             /*�*force removal of  all leading zeroes.*/
if y==''  then y=0                             /*�*handle the special case of  0 (zero).*/
say right(newV1.j,20) 'decimal, and in binary:' y  /*�*display the number to the terminal.  */
end   /*�*j*/                                    /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Binary-digits\binary-digits-2.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
