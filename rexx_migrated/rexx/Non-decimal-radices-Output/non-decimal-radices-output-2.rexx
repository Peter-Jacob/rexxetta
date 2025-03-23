/*�*REXX program shows REXX's ability to show dec nums in bin/hex/base256.*/

do j=14  to 67               /*�*display some lower-value numbers.  */
say right(j,3)        ' in decimal is',
right(d2b(j),12)  " in binary",
right(d2x(j),12)  ' in hexadecimal',
right(d2c(j),12)  ' in base256.'
end
exit                                   /*�*stick a fork in it, we're done.*/
/*�*────────────────────────────D2B subroutine────────────────────────────*/
d2b: return word(strip(x2b(d2x(arg(1))),'L',0) 0,1)  /*�*convert dec──►bin*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Non-decimal-radices-Output\non-decimal-radices-output-2.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
