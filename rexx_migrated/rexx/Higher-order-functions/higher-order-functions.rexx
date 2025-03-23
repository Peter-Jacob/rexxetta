/*�*REXX program demonstrates the  passing of a  name of a function  to another function. */
call function  'fact'   ,   6;           say right(    'fact{'newV2"} = ", 30)    result
call function  'square' ,  13;           say right(  'square{'newV2"} = ", 30)    result
call function  'cube'   ,   3;           say right(    'cube{'newV2"} = ", 30)    result
call function  'reverse', 721;           say right( 'reverse{'newV2"} = ", 30)    result
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
cube:     return newV2**3
fact:     procedure expose newV2;  newV1=1;      do j=2  to newV2;    newV1=newV1*j;     end;         return newV1
function: arg ?.;   parse arg ,newV2;        signal value (?.)
reverse:  return 'REVERSE'(newV2)
square:   return newV2**2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Higher-order-functions\higher-order-functions.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
