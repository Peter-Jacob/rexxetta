/*ͺ*REXX program shows REXX's ability to show dec nums in bin/hex/base256.*/

do j=14  to 67               /*ͺ*display some lower-value numbers.  */
say right(j,3)        ' in decimal is',
right(d2b(j),12)  " in binary",
right(d2x(j),12)  ' in hexadecimal',
right(d2c(j),12)  ' in base256.'
end
exit                                   /*ͺ*stick a fork in it, we're done.*/
/*ͺ*ββββββββββββββββββββββββββββD2B subroutineββββββββββββββββββββββββββββ*/
d2b: return word(strip(x2b(d2x(arg(1))),'L',0) 0,1)  /*ͺ*convert decβββΊbin*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Non-decimal-radices-Output\non-decimal-radices-output-2.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
