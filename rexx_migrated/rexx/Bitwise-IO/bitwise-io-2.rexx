/*ͺ*REXX pgm encodes/decodes/displays ASCII character strings as  (7βbits)  binary string.*/
parse arg newV1;        if newV1==''  then newV1= 'STRING'   /*ͺ*get optional argument; Use default ? */
say '   input string=' newV1                         /*ͺ*display the input string to terminal.*/
out= comp(newV1);       say ' encoded string='  out  /*ͺ*encodeββΊ 7βbit binary string; display*/
ori= dcomp(out);    say ' decoded string='  ori  /*ͺ*decodeββΊ 8βbit char      "  ;    "   */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
comp:  parse arg x; z=;   do j=1  for length(x)  /*ͺ*convertββΊright-justified 7-bit binary*/
z= z || right( x2b( c2x( substr(x, j, 1) )), 7)
end   /*ͺ*j*/;     L= length(z);  return left(z, L+(8-L//8)//8, 0)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
dcomp: parse arg x; z=;   do k=1  by 7  to length(x);        newV2= substr(x, k, 7)
if right(newV2, 1)==' '  then leave;   z= z || x2c( b2x(0 || newV2) )
end   /*ͺ*k*/;     return z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitwise-IO\bitwise-io-2.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
